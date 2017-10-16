package com.newlecture.aop.spring;

import java.lang.reflect.Method;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;

public class AfterHandler implements AfterReturningAdvice{
	
	private Log log = LogFactory.getLog(this.getClass());

	@Override
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) 
			throws Throwable {
		
		System.out.println(method.getName() + "() 호출후 반환된 값: " + returnValue);
	
	}
	
}
