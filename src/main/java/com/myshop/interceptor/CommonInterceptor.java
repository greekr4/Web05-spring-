package com.myshop.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myshop.dto.CustomerDTO;


public class CommonInterceptor extends HandlerInterceptorAdapter{


	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		//세션아이디 및 정보 불러오기
		//String sid = (String) session.getAttribute("sid");
		CustomerDTO sdto = (CustomerDTO) session.getAttribute("sdto");
		
		if (sdto == null) {
			//로그인 안됐음
			response.sendRedirect("/myapp/Customer/LoginForm"); 
			return false;
		} else {
			//로그인 됐음
			if (sdto.getGrade() == 9) {
				//관리자권한
				return true;
			} else {
				//권한없음
				response.sendRedirect("../"); 
				return false;
			}
		}
		
		
	}
	
}
