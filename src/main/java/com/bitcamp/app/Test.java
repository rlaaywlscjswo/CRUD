package com.bitcamp.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml")
public class Test {
	@Value("#{dbinfo['db.driver']}")
	private String gg;
		
	@org.junit.Test
	public void t1() {
	 assertEquals(gg, "oracle.jdbc.OracleDriver");
	}
}
