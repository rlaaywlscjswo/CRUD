package com.bitcamp.app;

import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ReplyDTO;
import com.bitcamp.service.MemberService;
import com.bitcamp.service.ReplyService;

@Controller
public class ReplyController {

	@Resource // 회원 서비스
	private MemberService memberservice;
	
	@Resource // 댓글 서비스
	private ReplyService replyservice;
	
	// 댓글 목록
	@RequestMapping(value="/replylist",method=RequestMethod.POST)	
	public @ResponseBody List<ReplyDTO> replylist(@RequestParam int project_no) {		
		System.out.println("프번프번 :"+project_no);			
		return  replyservice.replyList(project_no);
	}

	// 댓글 등록
	@RequestMapping(value="/replyinsert", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int replyinsert (@RequestParam int project_no, @RequestParam String reply_contents,
			@RequestParam float rating,
			Principal principal) {
		System.out.println("프번"+project_no);
		System.out.println("contents"+reply_contents);
		MemberDTO mdto = memberservice.memberinfo(principal.getName());
		System.out.println("회ㅣㅣㅣㅣㅣㅣㅣㅣㅣ번"+mdto.getNo());
		System.out.println("평점"+rating);
		ReplyDTO reply =new ReplyDTO();
		reply.setNo(mdto.getNo()); // 회원번호
		reply.setProject_no(project_no); // 프로젝트 번호		
		reply.setReply_contents(reply_contents); // 댓글 내용
		reply.setRating(rating); // 평점
		return replyservice.replyInsert(reply);
	}
}
