package com.sp.foru.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.memberController")
@RequestMapping(value = "/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String userId, 
			@RequestParam String userPwd,  
			HttpSession session,  
			Model model) {
		
		
		Member dto = service.loginMember(userId);
		if(dto == null) {
			model.addAttribute("msg", "가입된 회원이 아닙니다.");
			return ".member.login";
		} else if(! userId.equals(dto.getUserId())) {
			model.addAttribute("msg", "아이디가 일치하지 않습니다.");
			return ".member.login";
		} else if(! userPwd.equals(dto.getUserPwd())) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return ".member.login";
		}
		
		SessionInfo info = new SessionInfo();
		info.setMemberIdx(dto.getMemberIdx());
		info.setMembership(dto.getMembership());
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		
		session.setMaxInactiveInterval(30 * 60); // 세션 유지 시간  x * 60초
		session.setAttribute("member", info);
		
		return "redirect:/";
			
		
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		
		// 세션초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String signUpForm() {
		return ".member.signUp";
	}
	
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUpSubmit(Member dto) {
		
		try {
			service.insertMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return ".member.signUp";
		}
		
		return ".member.signUpOk";
	}
	
	@RequestMapping("signUpOk")
	public String signUpOk() {
		
		return ".member.signUpOk";
	}
	
}
