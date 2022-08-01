package com.event;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListenerTest implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
		System.out.println("서버 중지됨...");
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		System.out.println("서버 시작됨...");
		
		//ServletContext sc = sce.getServletContext();
		//sc.setAttribute("name", "Servlet");
		
	}

}
