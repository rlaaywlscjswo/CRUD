package com.bitcamp.member.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {

	@RequestMapping("mypage")
	public String myPage() {
		
		return "/mypage/mypage";
		
	} // end myList method
	
} // end MyController class
