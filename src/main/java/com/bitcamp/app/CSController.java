package com.bitcamp.app;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.dto.CSDTO;
import com.bitcamp.service.CSService;

@Controller
public class CSController {

	@Autowired
	private CSService service;

	// 질문 작성
	@RequestMapping("wq")
	public String writeQuestion(@RequestParam(required = false) String question_type, 
			@RequestParam(required = false) String service_title,
			@RequestParam(required = false, defaultValue="1") int service_secret,
			@RequestParam(required = false) String service_contents,
			Model model,
			Principal principal) {

		String email = principal.getName();

		int writeQuestion = service.writeQuestion(email, question_type, service_title, service_secret, service_contents);

		model.addAttribute("writeQuestion", writeQuestion);

		return "redirect:/cs";

	} // end writeQuestion method

	@RequestMapping("/cs")
	public String customerService() {

		return "/cs/customerService.temp";

	} // end customerService method

} // end CustomerServiceController class
