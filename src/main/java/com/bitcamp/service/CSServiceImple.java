package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

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
	public int writeQuestion(String email, CSDTO dto, int question_no) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("email", email);
		hm.put("question_no", question_no);
		hm.put("service_title", dto.getService_title());
		hm.put("service_secret", dto.getService_secret());
		hm.put("service_contents", dto.getService_contents());

		return mapper.writeQuestion(hm);

	} // end writeQuestion method
	
	// 질문 개수
	@Override
	public int csList_totalCount(String cs_search) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("cs_search", cs_search);
		
		return mapper.csList_totalCount(hm);
		
	} // end csList_totalCount method
	
	// 질문 목록
	@Override
	public List<CSDTO> csList(int startRow, int pagePerSize, String cs_search) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pagePerSize", pagePerSize);
		hm.put("cs_search", cs_search);
		
		return mapper.csList(hm);
		
	} // end csList method
	
	// no값 추출
	@Override
	public int getNo(String email) {
		
		return mapper.getNo(email);
		
	} // end getNo method
	
	// 질문 수정
	
	// 질문 삭제
	@Override
	public int deleteQuestion() {
		
		return mapper.deleteQuestion();
		
	} // end deleteQuestion method

} // end CSServiceImple class
