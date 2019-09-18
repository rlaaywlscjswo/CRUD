package com.bitcamp.app;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.CSDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.PagingDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.service.AdminService;
import com.bitcamp.service.MemberService;

@Controller
public class AdminController {

	@Autowired
	private MemberService service;

	@Autowired
	private AdminService adminService;

	// Excel Download
	@RequestMapping(value = "/fmemberExcelDown.do", method = RequestMethod.POST)
	public void fmemberExcelDown(HttpServletResponse response) {

		System.out.println("★★★★★ Excel Down Start ★★★★★");

		adminService.getExcelDown(response);

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

		List<MemberDTO> fmemberList = adminService.admin_fmember(dto.getStartRow(), pagePerSize, fmember_search);

		model.addAttribute("fmemberList", fmemberList);
		model.addAttribute("dto", dto);

		return "/admin/admin_fmember.temp";

	} // end admin_fmember method

	// 통계 페이지
	@RequestMapping("/stats")
	public @ResponseBody Map<String, Object> stats(@RequestParam(required = false, defaultValue = "0") int no) {

		System.out.println("no값을 알려주세요.." + no);

		// 통계
		// 이름 가져오기
		String getName = adminService.getName(no);
		// 성공 횟수
		int successCount = adminService.successCount(no);
		// 총 프로젝트 등록 횟수
		int regipro = adminService.theNumbersOfRegiProject(no);
		// 평균 달성률
		float avgdal = adminService.avgdal(no);
		// 평균 평점
		float avgRating = adminService.avgRating(no);

		Map<String, Object> map = new HashMap<>();
		map.put("getName", getName);
		map.put("successCount", successCount);
		map.put("regipro", regipro);
		map.put("avgdal", avgdal);
		map.put("avgRating", avgRating);

		return map;

	} // end stats method

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

	
	// pdf 받아오기
	@RequestMapping(value="/getpdf" ,method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String getpdf(@RequestParam int project_no) {
		String result = adminService.getPdf(project_no);
		return result;
	}
	// 펀딩 현황 목록
	@RequestMapping("/spro")
	public String admin_sproject(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String sproject_search, Model model) {

		int totalCount = adminService.sproject_totalCount(sproject_search);
		int pagePerSize = 10;
		int blockPerSize = 5;

		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);

		List<ProjectDTO> admin_sproject = adminService.admin_sproject(dto.getStartRow(), pagePerSize, sproject_search);

		model.addAttribute("admin_sproject", admin_sproject);
		model.addAttribute("dto", dto);

		return "/admin/admin_sproject.temp";

	} // end admin_sproject method
	
	// 승인 시 권한 변경, 프로젝트 상태 변경 (1로)
	@RequestMapping("agree")
	public @ResponseBody void agree(@RequestParam(required = false, defaultValue = "1") int project_no) {
		
		System.out.println("동의는 잘 넘어왔어요? : " + project_no);
		
		adminService.agree(project_no);
		adminService.psChange(project_no);
		
	} // end agree method
	
	// 거절 시 프로젝트 상태 변경 (2로)
	@RequestMapping("disagree")
	public @ResponseBody void disagree(@RequestParam(required = false, defaultValue = "1") int project_no) {
		
		System.out.println("거절도 잘 넘어왔어요? : " + project_no);
		
		adminService.disagree(project_no);
		
	} // end disagree method
	
	// 승인 대기 프로젝트 승인 여부 (pdf controller)
	@RequestMapping("/agreeee")
	public @ResponseBody String agreeee(@RequestParam(required = false, defaultValue = "1") int project_no) {
		
		System.out.println("바보야 : " + project_no);
		
		return "바보야 : " + project_no;
		
	} // end agree method

	// Excel Download
	@RequestMapping(value = "/sprojectExcelDown.do", method = RequestMethod.POST)
	public void sprojectExcelDown(HttpServletResponse response) {

		System.out.println("★★★★★ Excel Down Start ★★★★★");

		adminService.sproject_getExcelDown(response);

		System.out.println("★★★★★ Excel Down End ★★★★★");

	} // end ExcelDown method
	
	// 고객 문의
	@RequestMapping("/adcs")
	public String admin_cs(Model model) {
		
		List<CSDTO> adminCS = adminService.adminCS();
		
		model.addAttribute("adminCS", adminCS);
		
		return "/admin/admin_cs.temp";
		
	} // end admin_cs method

} // end AdminController class
