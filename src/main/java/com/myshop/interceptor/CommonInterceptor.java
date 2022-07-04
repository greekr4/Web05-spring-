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
		
		CustomerDTO sdto = (CustomerDTO) session.getAttribute("sdto");
		
		if (sdto == null) {
			//로그인 안됐음
			response.sendRedirect("/myapp/Customer/LoginForm"); 
			return false;
		} else if (sdto.getGrade() != 9) {
				//관리자없음
				return false;
			} 
		//모든 예외처리 통과함
		return true;
		
		
	}
	
}
