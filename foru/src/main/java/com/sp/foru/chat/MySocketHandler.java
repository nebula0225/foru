package com.sp.foru.chat;

import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.PostConstruct;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class MySocketHandler extends TextWebSocketHandler {
	private final Logger logger = LoggerFactory.getLogger(MySocketHandler.class);
	
	private Map<String, User> sessionMap = new Hashtable<String, User>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// WebSocket 연결이 되고 사용이 준비될 때 호출
		super.afterConnectionEstablished(session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		super.handleMessage(session, message);
		
		JSONObject jsonReceive = null;
		try {
			jsonReceive = new JSONObject(message.getPayload().toString());
		} catch (Exception e) {
			return;
		}
		
		System.out.println(jsonReceive.toString());
		String cmd = jsonReceive.getString("cmd");
		if(cmd == null) {
			return;
		}
		
		if(cmd.equals("connect")) { // 처음 접속한 경우
		
			String uid = jsonReceive.getString("uid");
			String nickName = jsonReceive.getString("nickName");
			
			User user = new User();
			user.setUid(uid);
			user.setNickName(nickName);
			user.setSession(session);
			
			sessionMap.put(uid, user);
			
			// 현재 접속중인 사용자 목록을 전송함
			Iterator<String> it = sessionMap.keySet().iterator();
			while(it.hasNext()) {
				String key = it.next();
				if(uid.equals(key)) { // 자기 자신이면
					continue;
				}
				
				User vo = sessionMap.get(key);
				JSONObject job = new JSONObject();
				job.put("cmd", "connectList");
				job.put("uid", vo.getUid());
				job.put("nickName", vo.getNickName());
				
				sendOneMessage(job.toString(), session);
			}
			
			// 다른 사용자에게 접속 사실을 알림
			JSONObject job = new JSONObject();
			job.put("cmd", "connect");
			job.put("uid", uid);
			job.put("nickName", nickName);
			sendAllMessage(job.toString(), uid);
			
		} else if(cmd.equals("message")) {
			User vo = getUser(session);
			String msg = jsonReceive.getString("chatMsg");
			
			JSONObject job = new JSONObject();
			job.put("cmd", "message");
			job.put("chatMsg", msg);
			job.put("uid", vo.getUid());
			job.put("nickName", vo.getNickName());
			
			sendAllMessage(job.toString(), vo.getUid());
			
		} else if(cmd.equals("whisper")) {
			User vo = getUser(session);
			String msg = jsonReceive.getString("chatMsg");
			String receiver = jsonReceive.getString("receiver");
			User receiverVo = sessionMap.get(receiver);
			if(receiverVo == null) {
				return;
			}
			
			JSONObject job = new JSONObject();
			job.put("cmd", "whisper");
			job.put("chatMsg", msg);
			job.put("uid", vo.getUid());
			job.put("nickName", vo.getNickName());
			
			// 귓속말 대상자에게 메세지 보내기
			sendOneMessage(job.toString(), receiverVo.getSession());
		}
		
		
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		super.handleTransportError(session, exception);
		
		// 전송 에러가 발생할 때 호출
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		
		// WebSocket이 닫혔을때 호출
		String uid = removeUser(session);
		logger.info("remove session : " + uid );
	}
	
	
	protected void sendOneMessage(String message, WebSocketSession session) {
		if(session.isOpen()) {
			try {
				session.sendMessage(new TextMessage(message));
			} catch (Exception e) {
				logger.error("fail to send message");
			}
		}
	}

	// 모든 사용자에게 메세지 전송
	protected void sendAllMessage(String message, String out) {
		Iterator<String> it = sessionMap.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			
			if(out != null && out.equals(key)) {
				continue;
			}
			
			User user = sessionMap.get(key);
			WebSocketSession session = user.getSession();
			
			try {
				if(session.isOpen()) {
					session.sendMessage(new TextMessage(message));
				}
			} catch (Exception e) {
				removeUser(session);
			}
			
		}
	}
	
	// session에 해당하는 User 객체
	protected User getUser(WebSocketSession session) {
		Iterator<String> it = sessionMap.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			
			User dto = sessionMap.get(key);
			if(dto.getSession() == session) {
				return dto;
			}
		}
		
		return null;
	}
	
	protected String removeUser(WebSocketSession session) {
		User user = getUser(session);
		if(user == null) {
			return null;
		}
		
		JSONObject job = new JSONObject();
		job.put("cmd", "disconnect");
		job.put("uid", user.getUid());
		job.put("nickName", user.getNickName());
		
		sendAllMessage(job.toString(), user.getUid());
		
		try {
			user.getSession().close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		sessionMap.remove(user.getUid());
		
		return user.getUid();
	}

	@PostConstruct // init 메소드가 생성자가 실행되고 딱 한번 실행되는 메소드
	public void init() throws Exception {
		TimerTask task = new TimerTask() {
			
			@Override
			public void run() {
				Calendar cal = Calendar.getInstance();
				int h = cal.get(Calendar.HOUR_OF_DAY);
				int m = cal.get(Calendar.MINUTE);
				int s = cal.get(Calendar.SECOND);
				
				JSONObject job = new JSONObject();
				job.put("cmd", "time");
				job.put("hour", h);
				job.put("minute", m);
				job.put("second", s);
				
				sendAllMessage(job.toString(), null);
				
			}
		};
		
		Timer timer = new Timer();
		// 1분마다 실행
		timer.schedule(task, new Date(), 60000);
	}

}
