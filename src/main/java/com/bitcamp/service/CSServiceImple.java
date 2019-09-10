package com.bitcamp.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.CSDTO;
import com.bitcamp.mapper.CSMapper;

@Service
public class CSServiceImple implements CSService {

	@Autowired
	private CSMapper mapper;

	// 질문 작성
	@Override
	public int writeQuestion(String email, String question_type, String service_title, int service_secret,
			String service_contents) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("email", email);
		hm.put("question_type", question_type);
		hm.put("service_title", service_title);
		hm.put("service_secret", service_secret);
		hm.put("service_contents", service_contents);

		return mapper.writeQuestion(hm);

	} // end writeQuestion method

} // end CSServiceImple class
