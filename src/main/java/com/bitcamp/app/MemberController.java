package com.bitcamp.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.SupportDTO;
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
	
	@RequestMapping(value = "/pay", method=RequestMethod.POST)
	public String pay(OptionDTO odto, MemberDTO mdto, @RequestParam String alias, Model model) {
		AddressDTO adto = memberService.address(mdto.getNo());
		//System.out.println(adto.getRoadaddr());
		model.addAttribute("opt", odto);
		//로그인 완료 후에 변경해야하는곳. (MemberDTO 받아오는 방식 변경 예정.)
		mdto.setName("이찬영");
		mdto.setEmail("joy23456@naver.com");
		model.addAttribute("member", mdto);
		model.addAttribute("addr", adto);
		model.addAttribute("alias", alias);
		return "/payment/pay";
	}
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "/payment/jusoPopup";
	}
	@RequestMapping("/addrPopup")
	public String addrPopup() {
		return "/payment/addrPopup";
	}
	@RequestMapping(value = "/addrlist", method=RequestMethod.POST)
	public @ResponseBody List<AddressDTO> addrlist(@RequestParam int no) {
		List<AddressDTO> dto = memberService.addrlist(no);
		return dto;
	}
	
	@RequestMapping(value = "/success", method=RequestMethod.POST)
	public String paymentsuccess(AddressDTO adto, SupportDTO sdto, @RequestParam String addr_add) {
		//배송 주소록 추가.
		int result = 0;
		if("y".equals(addr_add)) {
			result = memberService.addrssInsert(adto);
			System.out.println("주소 추가 ? : "+result);
		} 
		return "/payment/success";
	}
	
}
