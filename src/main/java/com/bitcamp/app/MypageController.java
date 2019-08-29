package com.bitcamp.app;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.PagingDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.service.MypageService;

@Controller
public class MypageController {

	@Inject
	private MypageService service;
	
	// 마이 페이지 - main
	@RequestMapping("/mypage")
	public String mypage() {
		
		return "/mypage/mypage";
		
	} // end mypage method

	// 마이 페이지 - 내 정보 설정
	@RequestMapping("/info")
	public String mypageInfoList(Model model) {

		List<MemberDTO> infoList = service.mypageInfoList();
		model.addAttribute("infoList", infoList);

		return "/mypage/mypage_info.temp";

	} // end myList method

	// 마이 페이지 - 내 후원 내역
	@RequestMapping("/support")
	public String mypageSupportList(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String support_search, Model model, Principal principal) {

		String email = principal.getName();
		
		int totalCount = service.totalCount(support_search, email);
		int pagePerSize = 2;
		int blockPerSize = 3;

		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);

		List<SupportDTO> supportList = service.mypageSupportList(dto.getStartRow(), pagePerSize, support_search, email);
		model.addAttribute("support_search", support_search);
		model.addAttribute("dto", dto);
		model.addAttribute("supportList", supportList);

		return "mypage/mypage_support";

	} // end mypageSupportList method
	
	// 마이 페이지 - 내가 만든 프로젝트
	@RequestMapping("mypro")
	public String mypage_MyProjectList(Model model, Principal principal) {
		
		String email = principal.getName();
		
		// 내가 만든 프로젝트 개수
		int theNumbersOfMyProject = service.theNumbersOfMyProject(email);
		
		// 프로젝트 번호를 받아오자		
		List<ProjectDTO> getProject_no = service.getProject_no(email);
		
		// 썸네일 이미지
		List<ProjectDTO> thumbnail = service.thumbnail(email);
		System.out.println("thumbnail : " + thumbnail);
		
		model.addAttribute("theNumbersOfMyProject", theNumbersOfMyProject);
		model.addAttribute("thumbnail", thumbnail);
		
		return "/mypage/mypage_project";
		
	} // end mypage_MyProjectList method
	
	
	
	
	/*@RequestMapping("/mypro")
	public String theNumbersOfMyProject(Model model) {
		
		int myProject = service.theNumbersOfMyProject();
		List<ProjectDTO> theNumberOfMyProject = service.theNumberOfMyProject();
		List<OptionDTO> propropro = service.propropro();
		System.out.println("★★★★★★★★★★ propropro : " + propropro);
		
		int remainingDays = service.remainingDays();
		System.out.println("remainingDays : " + remainingDays);
		
		List<MemberDTO> myProjectList = service.myProjectList();
		
		// int achievePercent = service.achievePercent();
		
		model.addAttribute("myProject", myProject);
		model.addAttribute("theNumberOfMyProject", theNumberOfMyProject);
		model.addAttribute("propropro", propropro);
		model.addAttribute("remainingDays", remainingDays);
		model.addAttribute("myProjectList", myProjectList);
		// model.addAttribute("achievePercent", achievePercent);
		
		return "/mypage/mypage_project.temp";
		
	} // end theNumbersOfMyProject method
*/
} // end MyController class
