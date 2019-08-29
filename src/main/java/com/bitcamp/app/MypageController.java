package com.bitcamp.app;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.MemberDTO;
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
	public String mySupport_list(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String support_search, Model model,
			Principal principal) {

		String email = principal.getName();

		int totalCount = service.mySupport_totalCount(support_search, email);
		int pagePerSize = 2;
		int blockPerSize = 3;

		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);

		List<SupportDTO> mySupport_list = service.mySupport_list(dto.getStartRow(), pagePerSize, support_search, email);
		model.addAttribute("support_search", support_search);
		model.addAttribute("dto", dto);
		model.addAttribute("mySupport_list", mySupport_list);

		return "mypage/mypage_support";

	} // end mypageSupportList method

	// 마이 페이지 - 내가 만든 프로젝트
	@RequestMapping("mypro")
	public String mypage_MyProjectList(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String project_search, Model model,
			Principal principal) {

		String email = principal.getName();

		int totalCount = service.myProject_totalCount(project_search, email);
		int pagePerSize = 2;
		int blockPerSize = 3;

		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);

		// 내가 만든 프로젝트 개수
		int theNumbersOfMyProject = service.theNumbersOfMyProject(email);

		// 내가 만든 프로젝트 목록
		List<ProjectDTO> mypage_myProject = service.mypage_myProject(dto.getStartRow(), pagePerSize, project_search,
				email);

		model.addAttribute("theNumbersOfMyProject", theNumbersOfMyProject);
		model.addAttribute("dto", dto);
		model.addAttribute("mypage_myProject", mypage_myProject);

		return "/mypage/mypage_myProject";

	} // end mypage_MyProjectList method

} // end MyController class
