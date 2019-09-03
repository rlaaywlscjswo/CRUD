package com.bitcamp.app;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.dto.TalkDTO;
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
		System.out.println("비밀 번호 : " + dto.getPassword());
		
		return "/member/signupsuccess";
	}
	 
	@RequestMapping(value = "/emailcheck", method=RequestMethod.POST)
	public @ResponseBody int eamilcheck(@RequestBody String email) {
		int result  = memberService.emailCheck(email);
		return result;
	}
	
	@RequestMapping(value = "projectdetail/pay", method=RequestMethod.POST)
	public String pay(OptionDTO odto, @RequestParam(defaultValue="null") String alias, Model model, Principal principal) {
		if("null".equals(alias)) {
			ProjectDTO dto = memberService.projectinfo(odto.getOption_no());
			alias = dto.getAlias();
		}
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		AddressDTO adto = memberService.address(mdto.getNo());
		model.addAttribute("opt", odto);
		model.addAttribute("member", mdto);
		model.addAttribute("addr", adto);
		model.addAttribute("alias", alias);
		return "/payment/pay.temp";
	}
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "/payment/jusoPopup";
	}
	@RequestMapping("/addrPopup")
	public String addrPopup(@RequestParam int no, Model model) {
		List<AddressDTO> dto = memberService.addrlist(no);
		model.addAttribute("addrlist", dto);
		return "/payment/addrPopup";
	}
/*	@RequestMapping(value = "/addrlist", method=RequestMethod.POST)
	public @ResponseBody List<AddressDTO> addrlist(@RequestParam int no) {
		return dto;
	}*/
	
	@RequestMapping(value = "/success", method=RequestMethod.POST)
	public String paymentsuccess(AddressDTO adto, SupportDTO sdto, @RequestParam String payselect, @RequestParam String options, @RequestParam String addrs, @RequestParam String fulladdr,
			@RequestParam(value="addr_add", required=false) String addr_add, @RequestParam(value="default_addrs", required=false) String default_addrs) {
		int result = 0;
		if("true".equals(addr_add)) {
			//배송 주소록 추가.
			result = memberService.addressInsert(adto);
		}
		//기본 배송지로 지정
		if("true".equals(default_addrs)) {
			//기본 배송지 지정 풀기
			result = memberService.addrssupdate1(adto);
			//기본 배송지 지정 하기
			result = memberService.addrssupdate2(adto);
		}
		result = memberService.supportinsert(sdto);
		return "/payment/success.temp";
	}
	
	// 받은 쪽지함 리스트.
	@RequestMapping("/talk")
	public String talk(Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		List<TalkDTO> tdto = memberService.recipientlist(mdto.getNo());
		int unread = memberService.unread(mdto.getNo());
		int talknew = memberService.unread(mdto.getNo());
		
		model.addAttribute("member", mdto);
		model.addAttribute("talklist", tdto);
		model.addAttribute("unread", unread);
		model.addAttribute("talknew", talknew);
		return "/member/talk";
	}
	
	// 쪽지 상세페이지
	@RequestMapping("/talkdetail/{talk_no}")
	public String talkDetail(@PathVariable int talk_no, Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		HashMap<TalkDTO, Object> dto = memberService.talkdetail(talk_no);
		int result = memberService.talkstatus(talk_no); 
		int talknew = memberService.unread(mdto.getNo());
		
		model.addAttribute("member", mdto);
		model.addAttribute("detail", dto);
		model.addAttribute("talknew", talknew);
		return "/member/talkdetail";
	}
	
	// 쪽지 쓰기/답장
	@RequestMapping("/talkreply/{no}")
	public String talkreply(@PathVariable int no, Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		int talknew = memberService.unread(mdto.getNo());
		// no -> 0 일때 쪽지 쓰기   /   no -> 0 이 아닐때 답장
		if(no != 0) {
			System.out.println("답장 하자!");
		}
		 
		model.addAttribute("member", mdto);
		model.addAttribute("talknew", talknew);
		return "/member/talkreply";
	}
	
	// 쪽지 보내기
	@RequestMapping(value = "/send", method=RequestMethod.POST)
	public String send(TalkDTO dto) {
		int result = memberService.talksend(dto);
		return "redirect:talk";
	}
	
	// 보관함으로 이동  수정 해야함.
	@RequestMapping(value = "/keep", method=RequestMethod.POST)
	public @ResponseBody String talk(@RequestBody List<Integer> talk_no) {
		List<TalkDTO> list = new ArrayList<TalkDTO>(); 
		for(int i=0; i<talk_no.size(); i++) {
			TalkDTO dto = new TalkDTO();
			dto.setTalk_no(talk_no.get(i));
			System.out.println("보관함으로 가는 : "+talk_no.get(i));
			list.add(dto);
		}
		int result = memberService.keep(list);
		return "1";
	}
	
	// 현재 로그인된 정보
	@RequestMapping(value = "/loginInfo", method=RequestMethod.POST)
	public @ResponseBody MemberDTO loginInfo(Principal principal) {
		MemberDTO dto = memberService.memberinfo(principal.getName());
		return dto;
	}
	
} // end MemberController class
