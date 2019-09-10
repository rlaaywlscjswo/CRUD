package com.bitcamp.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CSMapper {
	
	// 질문 작성
	public int writeQuestion(HashMap<String, Object> hm);

} // end CSMapper
