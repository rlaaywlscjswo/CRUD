package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.CSDTO;

@Mapper
public interface CSMapper {
	
	// 질문 작성
	public int writeQuestion(HashMap<String, Object> hm);
	
	// 질문 개수
	public int csList_totalCount(HashMap<String, Object> hm);
	
	// 질문 목록
	public List<CSDTO> csList(HashMap<String, Object> hm);
	
	// no값 추출
	public int getNo(String email);
	
	// 질문 수정
	
	// 질문 삭제
	public int deleteQuestion();

} // end CSMapper
