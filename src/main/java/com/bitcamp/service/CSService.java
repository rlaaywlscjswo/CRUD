package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.CSDTO;

public interface CSService {

	// 질문 작성
	public int writeQuestion(String email, CSDTO dto, int question_no);
	
	// 질문 개수
	public int csList_totalCount(String cs_search);
	
	// 질문 목록
	public List<CSDTO> csList(int startRow, int pagePerSize, String cs_search);
	
	// 질문 수정
	
	// 질문 삭제
	public int deleteQuestion();

} // end CSService interface
