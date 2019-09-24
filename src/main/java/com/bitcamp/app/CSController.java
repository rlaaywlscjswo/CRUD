package com.bitcamp.app;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.CSDTO;
import com.bitcamp.dto.PagingDTO;
import com.bitcamp.service.CSService;

@Controller
public class CSController {

	@Autowired
	private CSService service;

	// 질문 작성
	@RequestMapping("wq")
	public String writeQuestion(@RequestParam(value = "question_no", defaultValue = "1") int question_no, CSDTO dto,
			Principal principal) {

		// 현재 로그인 한 사용자의 이메일 추출
		String email = principal.getName();

		// 질문 작성
		service.writeQuestion(email, dto, question_no);

		return "redirect:/cs";

	} // end writeQuestion method

	@RequestMapping("/cs")
	public String customerService(@RequestParam(required = false, defaultValue = "1") int currPage,
			@RequestParam(required = false, defaultValue = "0") int no,
			@RequestParam(required = false, defaultValue = "") String cs_search, Model model, Principal principal) {
		
		System.out.println("no값 잘 받았나요? : " + no);

		int totalCount = service.csList_totalCount(cs_search);
		int pagePerSize = 5;
		int blockPerSize = 3;

		PagingDTO dto = new PagingDTO(currPage, totalCount, pagePerSize, blockPerSize);

		// 질문 목록
		List<CSDTO> csList = service.csList(dto.getStartRow(), pagePerSize, cs_search);
		model.addAttribute("csList", csList);
		model.addAttribute("dto", dto);		
		
		// no값 추출
		String email = principal.getName();
		no = service.getNo(email);
		model.addAttribute("no", no);

		return "/cs/customerService.temp";

	} // end customerService method

	@RequestMapping("dq")
	public String deleteQuestion() {

		service.deleteQuestion();
		System.out.println("1번 질문 삭제 완료!");

		return "redirect:/cs";

	} // end deleteQuestion method

} // end CustomerServiceController class
