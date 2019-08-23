package com.bitcamp.app;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.service.MemberService;

@Controller
public class AdminController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		
		model.addAttribute("needemail", principal.getName());
		
		return "/admin/admin";
		
	} // end adminPage method
	
	@RequestMapping("/changeAuth")
	public String changeAuth(Principal principal, Model model) {		
		
		int result = service.changeAuth(principal.getName());
		model.addAttribute("changeAuth", result);		
		
		return "redirect:/admin";
		
	} // end changeAuth method
	
} // end AdminController class
