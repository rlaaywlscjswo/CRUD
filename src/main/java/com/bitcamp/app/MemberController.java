package com.bitcamp.app;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.PagingDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.dto.TalkDTO;
import com.bitcamp.service.MemberService;
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	/*@Autowired
	private UserMailSendService mailsender;*/
	
	@RequestMapping(value = "/signup", method = {RequestMethod.POST, RequestMethod.GET})
	public String signup(@RequestParam(value="email", required=false) String email, @RequestParam(value="name", required=false) String name, Model model) {
		model.addAttribute("email", email);
		model.addAttribute("name", name);
		return "/member/signup";
	}
	
	@RequestMapping("/naverlogin")
	public String naverlogin() {
		return "/security/callback";
	}
	
	@RequestMapping("/mailForm")
	public String mailForm() {
		return "/mail/mailForm";
	}
	
	@RequestMapping(value = "/mailSending", method = RequestMethod.POST)
	  public @ResponseBody String mailSending(@RequestBody Map<String, String> email, HttpServletRequest request) {
	   System.out.println("메일 보내기");
	   System.out.println("받는 사람 : "+email.get("email"));
		
	    String setfrom = "sloth7711@gmail.com";         
	    String tomail  = email.get("email");				// 받는 사람 이메일
	    String title   = "CRUD 비밀번호 인증키 입니다.";	// 제목
	    TempKey key = new TempKey();
	    String authkey = key.getKey(6, true);
	    System.out.println("인증키 : "+authkey);
	    String content = "<tbody><tr><td style=\" height: 65px; background-color: #000000; border-bottom: 1px solid #4d4b48;\">\r\n" + 
	    		"              <img src=\"/resources/img/logo.png\" width=\"538\" height=\"65\" alt=\"CURD\">\r\n" + 
	    		"        </td></tr>\r\n" + 
	    		"	<tr><td bgcolor=\"#17212e\">\r\n" + 
	    		"			<table align=\"center\" width=\"470\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-left: 5px; padding-right: 5px; padding-bottom: 10px;\">\r\n" + 
	    		"\r\n" + 
	    		"				<tbody><tr bgcolor=\"#17212e\"><td style=\"padding-top: 32px;\">\r\n" + 
	    		"					<span style=\"padding-top: 16px; padding-bottom: 16px; font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\r\n" + 
	    		"						안녕하세요 "+tomail+" 님,\r\n" + 
	    		"					</span><br>\r\n" + 
	    		"					</td></tr>\r\n" + 
	    		"				\r\n" + 
	    		"				<tr><td style=\"padding-top: 12px;\">\r\n" + 
	    		"					<span style=\"font-size: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\">\r\n" + 
	    		"						<p>"+tomail+" 계정 비밀번호 변경하는 데 필요한 CRUD 코드:</p>\r\n" + 
	    		"					</span>\r\n" + 
	    		"					</td></tr>\r\n" + 
	    		"\r\n" + 
	    		"\r\n" + 
	    		"				<tr><td>\r\n" + 
	    		"						<div>\r\n" + 
	    		"							<span style=\"font-size: 24px; color: #66c0f4; font-family: Arial, Helvetica, sans-serif; font-weight: bold;\"> "+authkey+" </span>\r\n" + 
	    		"						</div>\r\n" + 
	    		"					</td></tr>\r\n" + 
	    		"\r\n" + 
	    		"\r\n" + 
	    		"				<tr bgcolor=\"#121a25\"><td style=\"padding: 20px; font-size: 12px; line-height: 17px; color: #c6d4df; font-family: Arial, Helvetica, sans-serif;\">\r\n" + 
	    		"							<p style=\"padding-bottom: 10px; color: #c6d4df;\">비밀번호 변경하려면 CRUD 코드(이)가 필요합니다. <span style=\"color: #ffffff; font-weight: bold;\">이 이메일이 없으면 누구도 귀하의 계정에 접속할 수 없습니다.</span></p>\r\n" + 
	    		"							<p style=\"padding-bottom: 10px; color: #c6d4df;\"><span style=\"color: #ffffff; font-weight: bold;\">비밀번호 변경을 하려고 한 게 아니라면</span> CRUD 비밀번호를 변경해 주세요. 계정 보안을 유지하기 위해 이메일 비밀번호도 변경하시는 것이 좋습니다.</p>\r\n" + 
	    		"					</td></tr>\r\n" + 
	    		"\r\n" + 
	    		"\r\n" + 
	    		"				<tr><td style=\"font-size: 12px; color: #6d7880; padding-top: 16px; padding-bottom: 60px;\">\r\n" + 
	    		"                    			CURD 팀 드림<br>\r\n" + 
	    		"                    			<a style=\"color: #8f98a0;\" href=\"http://localhost:8080/yummy\" rel=\"noreferrer noopener\" target=\"_blank\">http://localhost:8080/yummy</a><br>\r\n" + 
	    		"                    </td></tr>\r\n" + 
	    		"\r\n" + 
	    		"			</tbody></table>\r\n" + 
	    		"		</td></tr>\r\n" + 
	    		"</tbody>";    // 내용
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content, true);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return authkey;
	}
	
	@RequestMapping(value = "/naverlogincheck", method = RequestMethod.POST)
	public @ResponseBody int naverlogincheck(@RequestParam String email, @RequestParam String name) {
		//System.out.println(email);
		int result  = memberService.emailCheck(email);
		//String url = "redirect:/yummy";
		/*if(result != 1) {
			MemberDTO dto = new MemberDTO();
			dto.setEmail(email);
			dto.setName(name);
			dto.setPhone("404");
			dto.setBirth("404");
			
			TempKey key = new TempKey();
			String temppwd = key.getKey(10, true);
			System.out.println(temppwd);
			
			dto.setPassword(temppwd);
			memberService.memberAdd(dto);
			System.out.println("네이버 아이디 신규 추가!");
		} else {
			System.out.println("이미있던 아이디");
		}*/
		return result;
	}

	@RequestMapping("/signupresult")
	public String signupresult(MemberDTO dto, HttpServletRequest request) {
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
		//mailsender.mailSendWithUserKey(dto.getEmail(), dto.getEmail(), request);
		
		return "/member/signupsuccess";
	}
	
	@RequestMapping("/uhuhuh")
	public String uhuhuh() {
		return "/member/signupsuccess";
	} // 테스트용
	
	@RequestMapping(value = "/passwordupdate", method=RequestMethod.POST)
	public String passwordupdate(MemberDTO dto, @RequestParam(value="auth", required=false) String auth, @RequestParam(value="confirmPassword", required=false) String confirmPassword) {
		memberService.passwordupdate(dto);
		return "/security/customlogin";
	}
	
	@RequestMapping(value = "/emailcheck", method=RequestMethod.POST)
	public @ResponseBody int eamilcheck(@RequestBody Map<String, String> email) {
		System.out.println("check....");
		String e=email.get("email");
		System.out.println(email);
		int result  = memberService.emailCheck(e);
		System.out.println("result..."+result);
		return result;
	}

	
	@RequestMapping(value = "/pay", method=RequestMethod.POST)
	public String pay(OptionDTO odto, ProjectDTO pdto, @RequestParam(defaultValue="null") String alias, Model model, Principal principal) {
		if("null".equals(alias)) {
			ProjectDTO dto = memberService.projectinfo(odto.getOption_no());
			alias = dto.getAlias();
		}
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		AddressDTO adto = memberService.address(mdto.getNo());
		model.addAttribute("pdto", pdto);
		model.addAttribute("opt", odto);
		model.addAttribute("member", mdto);
		model.addAttribute("addr", adto);
		model.addAttribute("alias", alias);
		return "/payment/pays.temp";
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
	@RequestMapping("/unread")
	public @ResponseBody int unread(Principal principal) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		return unread;
	}
	
	// 받은 쪽지함 리스트.
	@RequestMapping("/talk")
	public String talk(@RequestParam(defaultValue="", required=false) String kind, @RequestParam(defaultValue="", required=false) String search, 
			@RequestParam(defaultValue="1", required=false) int currPage, Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		HashMap<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("search", search);
		map.put("no", mdto.getNo());
		map.put("talk_keep", 0);
		
		int totalCount = memberService.recipientcount(map);
		int pagePerSize = 9;
		int blockPerSize = 5;
		
		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);
		map.put("startRow", dto.getStartRow());
		map.put("pagePerSize", pagePerSize);
		List<TalkDTO> tdto = memberService.recipientlist(map);
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
		
		model.addAttribute("dto", dto);
		model.addAttribute("member", mdto);
		model.addAttribute("talklist", tdto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		model.addAttribute("kind", kind);
		model.addAttribute("search", search);
		return "/member/talk";
	}
	
	// 보관함 쪽지 리스트.
	@RequestMapping("/talkkeep")
	public String talkkeep(@RequestParam(defaultValue="", required=false) String kind, @RequestParam(defaultValue="", required=false) String search, 
			@RequestParam(defaultValue="1", required=false) int currPage, Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		HashMap<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("search", search);
		map.put("no", mdto.getNo());
		map.put("talk_keep", 1);
		
		int totalCount = memberService.recipientcount(map);
		int pagePerSize = 9;
		int blockPerSize = 5;

		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);
		map.put("startRow", dto.getStartRow());
		map.put("pagePerSize", pagePerSize);
		List<TalkDTO> tdto = memberService.recipientlist(map);
		
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
		
		model.addAttribute("dto", dto);
		model.addAttribute("member", mdto);
		model.addAttribute("talklist", tdto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		model.addAttribute("kind", kind);
		model.addAttribute("search", search);
		return "/member/talkkeep";
	}
	
	// 쪽지 상세페이지
	@RequestMapping("/talkdetail/{talk_no}")
	public String talkDetail(HttpServletRequest request, @PathVariable int talk_no, Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		HashMap<TalkDTO, Object> dto = memberService.talkdetail(talk_no);
		
		int result = memberService.talkstatus(talk_no); 
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
		
		String url = Function.url((String)request.getHeader("REFERER"));
		System.out.println(url);
		String urlarr[] = url.split("/");
		System.out.println(urlarr[0]);

		model.addAttribute("select", urlarr[0]);
		model.addAttribute("member", mdto);
		model.addAttribute("detail", dto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		return "/member/talkdetail";
	}
	
	// 보낸 쪽지함 리스트
	@RequestMapping("/talksend")
	public String talksend(@RequestParam(defaultValue="", required=false) String kind, @RequestParam(defaultValue="", required=false) String search, 
			@RequestParam(defaultValue="1", required=false) int currPage, Principal principal, Model model) {
		MemberDTO mdto = memberService.memberinfo(principal.getName());
		HashMap<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("search", search);
		map.put("no", mdto.getNo());
		
		int totalCount = memberService.sentcount(map);
		int pagePerSize = 9;
		int blockPerSize = 5;
		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);
		map.put("startRow", dto.getStartRow());
		map.put("pagePerSize", pagePerSize);
		
		List<TalkDTO> tdto = memberService.sentlist(map);
		int unread = memberService.unread(new TalkDTO(mdto.getNo(), 0));
		int keepunread = memberService.unread(new TalkDTO(mdto.getNo(), 1));
	
		model.addAttribute("dto", dto);
		model.addAttribute("member", mdto);
		model.addAttribute("list", tdto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		model.addAttribute("kind", kind);
		model.addAttribute("search", search);
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
		MemberDTO reply = new MemberDTO();
		if(no != 0) {
			reply = memberService.nosearch(no);
			model.addAttribute("reply", reply);
		}
		model.addAttribute("member", mdto);
		model.addAttribute("unread", unread);
		model.addAttribute("keepunread", keepunread);
		return "/member/talkreply";
	}
	
	// 회원 찾기 새창
	@RequestMapping("/idPopup")
	public String idPopup(@RequestParam(defaultValue="", required=false) String search, Principal principal, Model model) {
		List<MemberDTO> dto = new ArrayList<>();
		System.out.println("검색값 : "+search);
		if(!"".equals(search)) {
			dto = memberService.idsearch(search);
		}
		model.addAttribute("list", dto);
		return "/member/idPopup";
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
	
	@RequestMapping("/pays")
	public String pays() {
		return "/payment/pays.temp";
	}
	
	@RequestMapping("/passwordfind")
	public String passwordfind() {
		return "/mail/passwordfind.temp";
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
	
	@RequestMapping("/test10")
	public String test() {
		return "/payment/success.temp";
	}
	
} // end MemberController class
