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
	
	// 질문 목록
	@Override
	public List<CSDTO> csList() {
		
		return mapper.csList();
		
	} // end csList method
	
	// 질문 수정
	
	// 질문 삭제
	@Override
	public int deleteQuestion(int service_no) {
		
		return mapper.deleteQuestion(service_no);
		
	} // end deleteQuestion method

} // end CSServiceImple class
