package com.bitcamp.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/signup")
	public String signup() {
		return "/member/signup";
	}
	
	@RequestMapping("/signupresult")
	public String signupresult(MemberDTO dto) {
		if("".equals(dto.getPhone()) || null == dto.getPhone()) {
			dto.setPhone("404");
			System.out.println("전화번호 : "+dto.getPhone());
		}
		if("".equals(dto.getBirth()) || null == dto.getBirth()) {
			dto.setBirth("404");
			System.out.println("생일 : "+dto.getBirth());
		}
		int result = memberService.memberAdd(dto);
		return "redirect:main";
	}
	
	@RequestMapping(value = "/emailcheck", method=RequestMethod.POST)
	public @ResponseBody int eamilcheck(@RequestBody String email) {
		int result  = memberService.emailCheck(email);
		return result;
	}
	
	
}
