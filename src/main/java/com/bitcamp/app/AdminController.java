package com.bitcamp.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/admin")
	public String adminPage() {
		
		return "/admin/admin";
		
	} // end adminPage method
	
} // end AdminController class
