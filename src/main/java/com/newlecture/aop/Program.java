package com.newlecture.aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class Program {
public static void main(String[] args) {
	Calculator origin = new NewlecCalculator();
	/*실행 전과 후에 실행 시간등을 알고싶은데 예전에는 직업 메소드 앞뒤에 써줬는데
	그럼 메소드마다 다 써줘야 하니까 그게 힘듦 그래서 proxy를 이용한다*/
	
	//proxy를 생성해서 실제 주업무 로직을 위임
	//1. 자바에서 지원하는 proxy 스프링이 아님
	Calculator cal = (Calculator) Proxy.newProxyInstance(NewlecCalculator.class.getClassLoader(), new Class[] {Calculator.class}, new InvocationHandler() {
		
		@Override
		public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
			// TODO Auto-generated method stub
			System.out.println("사전처리 보조업무");
			Object result = method.invoke(origin, args);
			return result;
		}
	});
	//int data = cal.add(3, 4);
	int data = cal.add(3, 4);

	
	System.out.println(data);
	
}
}
