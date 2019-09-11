package com.bitcamp.app;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.CSDTO;
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
	public String customerService(Model model) {

		// 질문 목록
		List<CSDTO> csList = service.csList();
		model.addAttribute("csList", csList);

		return "/cs/customerService.temp";

	} // end customerService method


	@RequestMapping(value = "dq", method = RequestMethod.GET)
	public String deleteQuestion(@RequestParam int service_no) {

		service.deleteQuestion(service_no);
		System.out.println("1번 질문 삭제 완료!" + service_no);

		return "redirect:/cs";

	} // end deleteQuestion method

} // end CustomerServiceController class
