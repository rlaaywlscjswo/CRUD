package com.bitcamp.app;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.dto.MemberDTO;
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
	public String mypageSupportList(Model model) {
		
		List<SupportDTO> supportList = service.mypageSupportList();
		model.addAttribute("supportList", supportList);
		
		return "/mypage/mypage_support";
		
	} // end mypageSupportList method

} // end MyController class
