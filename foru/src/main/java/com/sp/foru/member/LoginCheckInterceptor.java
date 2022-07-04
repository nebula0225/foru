package com.sp.foru.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginCheckInterceptor implements HandlerInterceptor {
	
	private final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean result = true;
		
		try {
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String cp = request.getContextPath();
			String uri = request.getRequestURI();
			String queryString = request.getQueryString();
			
			if(info == null) {
				result = false;
				
				if(isAjaxRequest(request)) {
					response.sendError(403);
				} else {
					if(uri.indexOf(cp) == 0) {
						uri = uri.substring(request.getContextPath().length());
					}
					if(queryString != null) {
						uri += "?" + queryString;
					}
					
					session.setAttribute("preLoginURI", uri);
					response.sendRedirect(cp + "/member/login");
				}
			} else {
				if(uri.indexOf("admin") != -1 && info.getMembership() < 51) {
					result = false;
					response.sendRedirect(cp + "/member/noAuthorized");
				}
			}
			
		} catch (Exception e) {
			logger.info("pre Error: " + e.toString());
		}
		
		return result;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
	// check Ajax request.
	private boolean isAjaxRequest(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
		return header != null && header.equals("true");
	}
	

}
