package com.bitcamp.app;

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

	@RequestMapping("/info")
	public String mypageInfoList(Model model) {

		List<MemberDTO> infoList = service.mypageInfoList();
		model.addAttribute("infoList", infoList);

		return "/mypage/mypage_info.temp";

	} // end myList method

	@RequestMapping("/support")
	public String mypageSupportList(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String support_search, Model model) {

		int totalCount = service.totalCount(support_search);
		int pagePerSize = 2;
		int blockPerSize = 3;

		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);

		List<SupportDTO> supportList = service.mypageSupportList(dto.getStartRow(), pagePerSize, support_search);
		model.addAttribute("support_search", support_search);
		model.addAttribute("dto", dto);
		model.addAttribute("supportList", supportList);

		return "/mypage/mypage_support.temp";

	} // end mypageSupportList method
	
	@RequestMapping("/mypro")
	public String theNumbersOfMyProject(Model model) {
		
		int myProject = service.theNumbersOfMyProject();
		List<ProjectDTO> theNumberOfMyProject = service.theNumberOfMyProject();
		List<OptionDTO> propropro = service.propropro();
		System.out.println("★★★★★★★★★★ propropro : " + propropro);
		
		model.addAttribute("myProject", myProject);
		model.addAttribute("theNumberOfMyProject", theNumberOfMyProject);
		model.addAttribute("propropro", propropro);
		
		return "/mypage/mypage_project.temp";
		
	} // end theNumbersOfMyProject method

} // end MyController class
