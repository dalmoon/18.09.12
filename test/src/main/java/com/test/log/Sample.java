package com.test.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.StaticApplicationContext;

public class Sample {
	final Logger logger = LoggerFactory.getLogger(Sample.class);
	public void run() {
		logger.debug("debug");
		logger.info("info");
		
		StaticApplicationContext context = new StaticApplicationContext();
		context.registerSingleton("test", Sample.class);
		context.getBean("test", Sample.class);
	}
}
