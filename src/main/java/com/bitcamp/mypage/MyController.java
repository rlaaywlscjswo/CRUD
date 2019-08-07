package com.bitcamp.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.dto.MemberDTO;

@Controller
public class MyController {

	@RequestMapping("mypage")
	public String myPage(MemberDTO dto, Model model) {
		
		model.addAttribute(dto.getName());
		
		return "/mypage/mypage";
		
	} // end myList method
	
} // end MyController class
