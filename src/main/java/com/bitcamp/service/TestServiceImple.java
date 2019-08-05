package com.bitcamp.service;

import org.springframework.stereotype.Service;

@Service("testservice")
public class TestServiceImple implements TestService {

	@Override
	public void test() {
		
		System.out.println("test very well plz");
		
	} // end test method

} // end TestServiceImple class
