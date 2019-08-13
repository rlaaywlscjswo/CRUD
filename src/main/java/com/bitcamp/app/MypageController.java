package com.bitcamp.app;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.PagingDTO;
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

		return "/mypage/mypage_info";

	} // end myList method

	@RequestMapping("/support")
	public String mypageSupportList(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "") String search, Model model) {

		int totalCount = service.totalCount(search);
		int pagePerSize = 2;
		int blockPerSize = 3;

		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);

		List<SupportDTO> supportList = service.mypageSupportList(dto.getStartRow(), pagePerSize, search);
		model.addAttribute("search", search);
		model.addAttribute("dto", dto);
		model.addAttribute("supportList", supportList);
		
		System.out.println("★★★★★★★★★★ search : " + search);

		return "/mypage/mypage_support";

	} // end mypageSupportList method

} // end MyController class
