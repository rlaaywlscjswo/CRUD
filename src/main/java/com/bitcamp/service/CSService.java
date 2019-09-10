package com.bitcamp.service;

import com.bitcamp.dto.CSDTO;

public interface CSService {

	// 질문 작성
	public int writeQuestion(String email, String question_type, String service_title, int service_secret,
			String service_contents);

} // end CSService interface
