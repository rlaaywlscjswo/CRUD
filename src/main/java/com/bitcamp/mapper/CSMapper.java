package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.CSDTO;

@Mapper
public interface CSMapper {
	
	// 질문 작성
	public int writeQuestion(HashMap<String, Object> hm);
	
	// 질문 목록
	public List<CSDTO> csList();
	
	// 질문 수정
	
	// 질문 삭제
	public int deleteQuestion(int service_no);

} // end CSMapper
