package com.bitcamp.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/test")
	public String test() {
		
		return "/admin/test";
		
	} // end test method
	
} // end TestController class
