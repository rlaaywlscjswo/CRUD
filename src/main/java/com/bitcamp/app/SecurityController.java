package com.bitcamp.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@RequestMapping("/sec_login")
	public String customLogin() {
		
		return "/security/customlogin";

	} // end memberPage method
	
	@RequestMapping("/customLogout")
	public String logoutGet() {
		
		System.out.println("로그아웃!!");
		
		return "/security/customlogout";

	} // end memberPage method
	
	

} // end SecurityController class
