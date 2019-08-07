package com.bitcamp.mypage;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.service.MypageService;

@Controller
public class MyController {
	
	@Inject
	private MypageService service;

	@RequestMapping("mypage")
	public String myPage(Model model) {
		
		List<MemberDTO> list = service.myPageList();
		model.addAttribute("list", list);
		
		return "/mypage/mypage_info";
		
	} // end myList method
	
} // end MyController class
