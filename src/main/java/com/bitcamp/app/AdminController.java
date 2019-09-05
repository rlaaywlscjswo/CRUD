package com.bitcamp.app;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.service.AdminService;
import com.bitcamp.service.MemberService;

@Controller
public class AdminController {

	@Autowired
	private MemberService service;

	@Autowired
	private AdminService adminService;
	
	// Excel Download
	@RequestMapping(value = "/excelDown.do", method = RequestMethod.POST)
	public void ExcelDown(HttpServletResponse response) {
		
		System.out.println("★★★★★ Excel Down Start ★★★★★");
		
		adminService.getExcelDown(response);
		
		System.out.println("★★★★★ Excel Down End ★★★★★");
		
	} // end ExcelDown method

	// 펀딩 회원 관리
	@RequestMapping("/fmember")
	public String admin_fmember(Model model) {

		List<HashMap<String, Object>> fmemberList1 = adminService.admin_fmember1();
		List<HashMap<String, Object>> fmemberList2 = adminService.admin_fmember2();
		
		model.addAttribute("fmemberList1", fmemberList1);
		model.addAttribute("fmemberList2", fmemberList2);
		
		return "/admin/admin_fmember";

	} // end admin_fmember method

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
