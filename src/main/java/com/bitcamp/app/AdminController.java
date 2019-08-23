package com.bitcamp.app;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		
		model.addAttribute("needemail", principal.getName());
		
		return "/admin/admin";
		
	} // end adminPage method
	
} // end AdminController class
