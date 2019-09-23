package com.bitcamp.app;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SecurityController {

/*	@RequestMapping("/sec_admin")
	public String adminPage() {

		return "/security/admin";

	} // end adminPage method
*/
	@RequestMapping("/sec_manager")
	public String managerPage() {

		return "/security/manager";

	} // end managerPage method

	@RequestMapping("/sec_member")
	public String memberPage() {

		return "/security/member";

	} // end memberPage method
	
	@RequestMapping("/sec_all")
	public String allPage() {

		return "/security/all";

	} // end memberPage method

	// 403 Error는 여기로 옴
	@RequestMapping("/accessError")
	public String accessError() {

		return "/security/accessError";

	} // end memberPage method

	@RequestMapping(value = "/sec_login", method = {RequestMethod.POST, RequestMethod.GET})
	public String customLogin(@RequestParam(value="email", required=false) String email, Model model, HttpServletRequest request) {
		model.addAttribute("email", email);
		return "/security/customlogin";

	} // end memberPage method
	
	@RequestMapping("/customLogout")
	public String logoutGet() {
		
		System.out.println("로그아웃!!");
		
		return "/security/customlogout";

	} // end memberPage method

} // end SecurityController class
