package com.bitcamp.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/signup")
	public String signup() {
		return "/member/signup";
	}
	
	@RequestMapping(value = "/emailcheck", method=RequestMethod.POST)
	public @ResponseBody int eamilcheck(@RequestBody String email) {
		int result  = memberService.emailCheck(email);
		return result;
	}
}
