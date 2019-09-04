package com.bitcamp.app;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value = "/pay", method=RequestMethod.POST)
	public String pay(OptionDTO odto, @RequestParam(defaultValue="null") String alias, Model model, Principal principal) {
		System.out.println("페이페이페이페이페이페이");
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
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
		
		model.addAttribute("member", mdto);
		model.addAttribute("talklist", tdto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		return "/member/talk";
	}
	
	// 보관함 쪽지 리스트.
	@RequestMapping("/talkkeep")
	public String talkkeep(Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		List<TalkDTO> tdto = memberService.recipientkeeplist(mdto.getNo());
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
		
		model.addAttribute("member", mdto);
		model.addAttribute("talklist", tdto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		return "/member/talkkeep";
	}
	
	// 쪽지 상세페이지
	@RequestMapping("/talkdetail/{talk_no}")
	public String talkDetail(@PathVariable int talk_no, Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		HashMap<TalkDTO, Object> dto = memberService.talkdetail(talk_no);
		int result = memberService.talkstatus(talk_no); 
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
		
		model.addAttribute("member", mdto);
		model.addAttribute("detail", dto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		return "/member/talkdetail";
	}
	
	// 보낸 쪽지함 리스트
	@RequestMapping("/talksend")
	public String talksend(Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		List<TalkDTO> tdto = memberService.sentlist(mdto.getNo());
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
	
		model.addAttribute("member", mdto);
		model.addAttribute("list", tdto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		return "/member/talksend";
	}
	
	// 보낸 쪽지 삭제
	@RequestMapping(value = "/deletesent", method=RequestMethod.POST)
	public String deletesent(@RequestParam(value="talk_no") List<String> talk_no, Principal principal) {
		for(int i=0; i<talk_no.size(); i++) {
			System.out.println(talk_no);
		}
		int result = memberService.deletesent(talk_no);
		return "redirect:talksend";
	}
	
	// 쪽지 쓰기/답장
	@RequestMapping("/talkreply/{no}")
	public String talkreply(@PathVariable int no, Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
		// no -> 0 일때 쪽지 쓰기   /   no -> 0 이 아닐때 답장
		if(no != 0) {
			//reply
			//memberService.reply();
			System.out.println("답장 하자!");
		}
		model.addAttribute("member", mdto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		return "/member/talkreply";
	}
	
	// 회원 찾기 새창
	@RequestMapping("/idPopup")
	public String idPopup() {
		return "/member/idPopup";
	}
	
	//회원 찾기
	@RequestMapping(value = "/idsearch", method=RequestMethod.POST)
	public @ResponseBody List<MemberDTO> idsearch(@RequestParam(required=false) String search, Principal principal) {
		List<MemberDTO> dto = memberService.idsearch(search); 
		return dto;
	}
	
	// 쪽지 보내기
	@RequestMapping(value = "/send", method=RequestMethod.POST)
	public String send(TalkDTO dto) {
		int result = memberService.talksend(dto);
		return "redirect:talk";
	}
	
	// 보관함으로 이동 (단일, 복수)
	@RequestMapping(value = "/keep", method=RequestMethod.POST)
	public String keep(@RequestParam(value="talk_no") List<String> talk_no, Principal principal) {
		int result = memberService.keep(talk_no);
		return "redirect:talk";
	}
	 
	// 받은 쪽지함으로 이동 (단일, 복수)
	@RequestMapping(value = "/move", method=RequestMethod.POST)
	public String move(@RequestParam(value="talk_no") List<String> talk_no, Principal principal) {
		int result = memberService.move(talk_no);
		return "redirect:talkkeep";
	}
	
	// 모두읽음 버튼
	@RequestMapping("/allread")
	public String allread(HttpServletRequest request, Principal principal) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		int keep = 0;
		String str = (String)request.getHeader("REFERER");
		String urlarr[] = str.split("/");
		String url = urlarr[3];
		if("talkkeep".equals(url)) {
			keep = 1;
		} else {
			keep = 0;
		} 
		url = str.substring(str.lastIndexOf("8080/")+5);
		int result = memberService.allread(new TalkDTO (mdto.getNo(), keep));
		return "redirect:"+url;
	}
	
	// 쪽지 삭제 (단일, 복수)
	@RequestMapping(value = "/talkdelete", method=RequestMethod.POST)
	public String talkdelete(@RequestParam(value="talk_no") List<String> talk_no, HttpServletRequest request, Principal principal) {
		int result = memberService.talkdelete(talk_no);
		String str = (String)request.getHeader("REFERER");
		System.out.println(str);
		
		String urlarr[] = str.split("/");
		String url = urlarr[3];
		if("talkdetail".equals(urlarr[3])) {
			url = "talk";
		} else {
			url = str.substring(str.lastIndexOf("8080/")+5);
		}
		System.out.println("이동 경로 : "+url);
		return "redirect:"+url;
	}
	
	// 이전 페이지로 돌아가기.
	@RequestMapping("/back")
	public String back(HttpServletRequest request) {
		String str = (String)request.getHeader("REFERER");
		System.out.println(str);
		String url = str.substring(str.lastIndexOf("8080/")+5);
		return "redirect:"+url;
	}
	
	// 현재 로그인된 정보
	@RequestMapping(value = "/loginInfo", method=RequestMethod.POST)
	public @ResponseBody MemberDTO loginInfo(Principal principal) {
		MemberDTO dto = memberService.memberinfo(principal.getName());
		return dto;
	}
	
} // end MemberController class
