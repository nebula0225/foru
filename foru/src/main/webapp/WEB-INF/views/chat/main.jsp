<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<style type="text/css">
.body-container {
	max-width: 800px;
	margin: auto;
}

.chat-msg-container {
	display: flex;
	flex-direction:column; 
	height: 310px;
	overflow-y: scroll;
}

.chat-connection-list {
	height: 355px;
	overflow-y: scroll;
}
.chat-connection-list span {
	display: block;
	cursor: pointer;
	margin-bottom: 3px;
}
.chat-connection-list span:hover {
	color: #0d6efd
}

.user-left {
	color: #0d6efd;
	font-weight: 700;
	font-size: 10px;
	margin-left: 3px;
	margin-bottom: 1px;
}

.chat-info, .msg-left, .msg-right {
	max-width: 350px;
	line-height: 1.5;
	font-size: 13px;
    padding: 0.35em 0.65em;
    border: 1px solid #ccc;
    color: #333;
    white-space: pre-wrap;
    vertical-align: baseline;
    border-radius: 0.25rem;
}
.chat-info {
    background: #f8f9fa;
    color: #333;
    margin-right: auto;
    margin-left: 3px;
    margin-bottom: 5px;
}
.msg-left {
    margin-right: auto;
    margin-left: 8px;
    margin-bottom: 5px;
}
.msg-right {
	margin-left: auto;
    margin-right: 3px;
    margin-bottom: 5px;
}

.send_box {
	position: relative;
	width: 97%;
	display: inline-block;
	margin-right: 1%;
}

.send_ico_box {
	position: absolute;
	display: inline-block;
	font-size: 26px;
	padding: 1px;
	margin-top: 6px;
}

</style>

<script type="text/javascript">
$(function(){
	$("#ico").mouseover(function(){
		$(this).removeClass();
		$(this).addClass("bi bi-cursor-fill");
	});
	
	$("#ico").mouseleave(function(){
		$(this).removeClass();
		$(this).addClass("bi bi-cursor");
	});
	
});
</script>

<section class="page-section" id="contact">
<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-chat-heart"></i> 채팅 <small class="fs-6 fw-normal">홈페이지 접속중인 모두와 채팅</small></h3>
		</div>
		
		<div class="body-main content-frame">
			<div class="row">
				<div class="col-8">
					<p class="form-control-plaintext fs-6">메세지</p>
					<div class="border p-3 chat-msg-container"></div>
					
					<div class="mt-2 send_box">
						<input type="text" id="chatMsg" class="form-control" 
							placeholder="채팅 메시지를 입력 하세요">
					</div>
					<div class="send_ico_box" id="msg_send">
						<a href="#"><i id="ico" class="bi bi-cursor"></i></a>
					</div>
					
				</div>
				<div class="col-4">
					<p class="form-control-plaintext fs-6"><i class="bi bi-clipboard2-heart"></i> 접속자 목록</p>
					<div class="border p-3 chat-connection-list"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>

<!-- 귓속말 Modal -->
<div class="modal fade" id="myDialogModal" tabindex="-1" aria-labelledby="myDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myDialogModalLabel">귓속말</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<input type="text" id="chatOneMsg" class="form-control" 
							placeholder="귓속말을 입력 하세요...">
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	var socket = null;
	
	var host = "${wsURL}";
	
	if('WebSocket' in window) {
		socket = new WebSocket(host);
	} else if('MozWebSocket' in window) {
		socket = new MozWebSocket(host);
	} else {
		writeToScreen("<div class='chat-info'>웹소켓을 지원하지 않는 브라우저</div>");
		return false;
	}
	
	socket.onopen = function(evt) { onOpen(evt) };
	socket.onclose = function(evt) { onClose(evt) };
	socket.onmessage = function(evt) { onMessage(evt) };
	socket.onerror = function(evt) { onError(evt) };
	
	function onOpen(evt) {
		var uid = "${sessionScope.member.memberIdx}";
		var nickName = "${sessionScope.member.userName}";
		if(! uid) {
			location.href = "${pageContext.request.contextPath}/member/login";
			return;
		}
		
		writeToScreen("<div class='msg-right'>채팅방에 입장 했습니다.</div> ");
		var out = "<span id='user-"+uid+"' data-uid='"+uid+"'><i class='bi bi-person-square'></i>"+"&nbsp;"+nickName+"</span>";
		$(".chat-connection-list").append(out);
		
		// 서버 접속이 성공하면 아이디와 이름을 JSON으로 서버에 전송
		var obj = {};
		var jsonStr;
		
		obj.cmd = "connect";
		obj.uid = uid;
		obj.nickName = nickName;
		jsonStr = JSON.stringify(obj); // stringify(obj) : 자바스크립트 객체를 json 형식의 문자열로 변환
		socket.send(jsonStr); // 서버로 전송하기
		
		$("#chatMsg").on("keydown", function(event){
			// 엔터를 누를경우 서버로 메세지 전송
			if(event.keyCode === 13) {
				sendMessage();
			}
		});
		
		$("#msg_send").click(function(){
			sendMessage();
		});
		
	 }
	
	// 연결이 끊어진 경우에 호출되는 콜백함수
	function onClose(evt) {
		$("#chatMsg").on("keydown", null);
		writeToScreen("<div class='chat-info'>WebSocket closed.</div> ");
	}

	// 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
	function onMessage(evt) {
		// 전송 받은 문자열을 JSON 객체로 변환
		
		// console.log(evt.data);
		
		var data = JSON.parse(evt.data);
		
		var cmd = data.cmd;
		
		if(cmd === "connectList") { // 최초 접속시 접속자 리스트 받기
			var uid = data.uid;
			var nickName = data.nickName;
			
			var out = "<span id='user-"+uid+"' data-uid='"+uid+"'><i class='bi bi-person-square'></i>"+"&nbsp;"+nickName+"</span>";
			$(".chat-connection-list").append(out);
			
		} else if(cmd === "connect") { // 추가로 접속한 사람 받기
			var uid = data.uid;
			var nickName = data.nickName;
			
			var out = "<div class='chat-info'> "+nickName+"님이 입장했습니다.</div>";
			writeToScreen(out);
			
			out = "<span id='user-"+uid+"' data-uid='"+uid+"'><i class='bi bi-person-square'></i>"+"&nbsp;"+nickName+"</span>";
			$(".chat-connection-list").append(out);
			
		} else if(cmd === "disconnect") {
			var uid = data.uid;
			var nickName = data.nickName;
			
			var out = "<div class='chat-info'> "+nickName+"님이 나갔습니다.</div>";
			writeToScreen(out);
			
			$("#user-" + uid).remove();
			
		} else if(cmd === "message") {
			// 메세지를 받은 경우
			var uid = data.uid;
			var nickName = data.nickName;
			var msg = data.chatMsg;
			
			var out = "<div class='user-left'> " +nickName+ "</div>";
			out += "<div class='msg-left'>"+msg+"</div>";
			
			writeToScreen(out);
		} else if(cmd === "whisper") {
			// 귓속말을 받은 경우
			var uid = data.uid;
			var nickName = data.nickName;
			var msg = data.chatMsg;
			
			var out = "<div class='user-left'> " +nickName+ "(귓속말)</div>";
			out += "<div class='msg-left'>"+msg+"</div>";
			
			writeToScreen(out);
		} else if(cmd === "time") {
			var h = data.hour;
			var m = data.minute;
			var s = data.second;
			console.log(h + ":" + m + ":" + s);
		}
		
	}

	// 에러가 발생시 호출되는 콜백함수
	function onError(evt) {

	}
	
	// 채팅 메시지 전송
	function sendMessage() {
		var msg = $("#chatMsg").val().trim();
		if(! msg) {
			$("#chatMsg").focus();
			return;
		}
		
		var job = {};
		var jsonStr;
		job.cmd = "message";
		job.chatMsg = msg;
		jsonStr = JSON.stringify(job);
		socket.send(jsonStr);
		
		$("#chatMsg").val("");
		writeToScreen("<div class='msg-right'> "+msg+"</div>");
	}
	
	// -----------------------------------------
	// 채팅 참여자 리스트를 클릭한 경우 위스퍼(귓속말, dm) 대화상자 열기
	$("body").on("click", ".chat-connection-list span", function(){
		var uid = $(this).attr("data-uid");
		var nickName = $(this).text();

		$("#chatOneMsg").attr("data-uid", uid);
		$("#chatOneMsg").attr("data-nickName", nickName);
		
		var myModalEl = document.getElementById('myDialogModal')
		myModalEl.addEventListener('show.bs.modal', function (event) {
		  $("#chatOneMsg").on("keydown", function(event){
				if(event.keyCode === 13) {
					sendOneMessage();
				}
		  });
		  
		});
		
		myModalEl.addEventListener('hidden.bs.modal', function (event) {
			  $("#chatOneMsg").on("keydown", null);
			  $("#chatOneMsg").val("");
		});
		
		$("#myDialogModalLable").html("귓속말-" + nickName);
		$("#myDialogModal").modal("show");

		
	});
	
	
	// -----------------------------------------
	// 귓속말 전송
	function sendOneMessage() {
		var msg = $("#chatOneMsg").val().trim();
		if(! msg) {
			$("#chatOneMsg").focus();
			return false;
		}
		
		var uid = $("#chatOneMsg").attr("data-uid");
		var nickName = $("#chatOneMsg").attr("data-nickName").trim();
		
		var obj={};
		var jsonStr;
		obj.cmd = "whisper";
		obj.chatMsg = msg;
		obj.receiver = uid;
		obj.nickName = nickName;
		
		jsonStr = JSON.stringify(obj);
		socket.send(jsonStr);
		
		wirteToScreen("<div class='msg-right'> "+msg+" ("+nickName+") </div>");
		$("#chatOneMsg").val("");
		$("#myDialogModal").modal("hide");
				s
	}
});

//---------------------------------------------
//채팅 메시지를 출력하기 위한 함수
function writeToScreen(message) {
	var $obj = $(".chat-msg-container");
	$obj.append(message);
	
	$obj.scrollTop($obj.prop("scrollHeight")); // 자동으로 스크롤바 밑으로 이동시킴
	
}

</script>