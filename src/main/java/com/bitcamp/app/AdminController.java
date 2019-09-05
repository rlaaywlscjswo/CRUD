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
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.PagingDTO;
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
	public void ExcelDown(HttpServletResponse response, @RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String fmember_search) {
		
		int totalCount = adminService.fmember_totalCount(fmember_search);
		int pagePerSize = 5;
		int blockPerSize = 5;
		
		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);

		System.out.println("★★★★★ Excel Down Start ★★★★★");

		adminService.getExcelDown(response, dto.getStartRow(), pagePerSize, fmember_search);

		System.out.println("★★★★★ Excel Down End ★★★★★");

	} // end ExcelDown method

	// 펀딩 회원 관리
	@RequestMapping("/fmember")
	public String admin_fmember(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String fmember_search, Model model) {
		
		int totalCount = adminService.fmember_totalCount(fmember_search);
		int pagePerSize = 5;
		int blockPerSize = 3;
		
		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);
		
		List<HashMap<String, Object>> fmemberList1 = adminService.admin_fmember1(dto.getStartRow(), pagePerSize, fmember_search);
		List<HashMap<String, Object>> fmemberList2 = adminService.admin_fmember2(dto.getStartRow(), pagePerSize, fmember_search);

		// 통계
		// 성공 횟수
		int successCount = adminService.successCount();
		// 총 프로젝트 등록 횟수
		int regipro = adminService.theNumbersOfRegiProject();
		// 평균 달성률
		float avgdal = adminService.avgdal();
		// 평균 평점
		float avgRating = adminService.avgRating();
		
		model.addAttribute("fmemberList1", fmemberList1);
		model.addAttribute("fmemberList2", fmemberList2);
		model.addAttribute("dto", dto);
		model.addAttribute("successCount", successCount);
		model.addAttribute("regipro", regipro);
		model.addAttribute("avgdal", avgdal);
		model.addAttribute("avgRating", avgRating);

		return "/admin/admin_fmember";

	} // end admin_fmember method
	
	// 통계
	// 성공 횟수
	
	// 총 프로젝트 등록 횟수
	
	// 평균 달성률
	// 평균 평점

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
