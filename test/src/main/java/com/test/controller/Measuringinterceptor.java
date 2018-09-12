package com.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Measuringinterceptor extends HandlerInterceptorAdapter{
	
	private static Logger logger = LoggerFactory.getLogger(Measuringinterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		long currentTime = System.currentTimeMillis();
	
		request.setAttribute("bTime", currentTime);

		return true;
	}
	
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception{
		
		long currentTime = System.currentTimeMillis();
		
		long beginTime = (long)request.getAttribute("bTime");
		
		long processedTime = currentTime - beginTime;
		
		logger.info("요청된 URL : " + request.getRequestURI());
		logger.info("총 처리 시간은 " + processedTime);
		super.afterCompletion(request, response, handler, ex);
	}
}
