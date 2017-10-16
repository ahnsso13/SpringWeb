package com.newlecture.aop.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Program {
	public static void main(String[] args) {
		// Calculator origin = new NewlecCalculator();

		ApplicationContext context = new ClassPathXmlApplicationContext("com/newlecture/aop/spring/aop-context.xml");

		Calculator cal = (Calculator) context.getBean("cal");

		int data = cal.add(3, 4);
		data = cal.div(3, 1);

		System.out.println(data);

	}
}