package com.newlecture.webapp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		//System.out.println("필터시작"); //서블릿 또는 이후 필터가 실행되기전에 실행
		
		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
		
      //  System.out.println("필터ㅂㅂ"); // 후에 실행
		
	}
}