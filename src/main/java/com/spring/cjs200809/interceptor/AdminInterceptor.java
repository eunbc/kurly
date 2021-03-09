package com.spring.cjs200809.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String slevel = session.getAttribute("slevel")==null? "" : (String)session.getAttribute("slevel");
		
		if(!slevel.equals("관리자")) {
			response.sendRedirect(request.getContextPath()+"/msg/adminNo");
		}
		return true;
	}

}
