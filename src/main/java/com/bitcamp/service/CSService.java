package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.CSDTO;

public interface CSService {

	// 질문 작성
	public int writeQuestion(String email, CSDTO dto, int question_no);
	
	// 질문 목록
	public List<CSDTO> csList();

} // end CSService interface
