package com.bitcamp.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		System.out.println("로그인 성공!!");
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		System.out.println("ROLE_NAME : " + roleNames);
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/yummy");
		}
		
		if (roleNames.contains("ROLE_MANAGER")) {
			response.sendRedirect("/yummy");
		}
		
		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/yummy");
		}
		
		// response.sendRedirect("/");
		
	} // end onAuthenticationSuccess method

} // end CustomLoginSuccessHandler class
