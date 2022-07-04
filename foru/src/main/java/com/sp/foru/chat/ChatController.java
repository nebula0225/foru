package com.sp.foru.chat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("chat.chatController")
@RequestMapping("/chat/*")
public class ChatController {
	
	@RequestMapping("main")
	public String main(
			HttpServletRequest req, 
			Model model
			) {
		
		String cp = req.getContextPath();
		String wsURL = "ws://" + req.getServerName() + ":" + req.getServerPort() + cp +
				"/chat.msg";
		
		model.addAttribute("wsURL", wsURL);
		
		
		return ".chat.main";
	}

}
