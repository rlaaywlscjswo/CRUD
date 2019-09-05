package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

	// 펀딩 회원 관리 1
	public List<HashMap<String, Object>> admin_fmember1();
	
	// 펀딩 회원 관리 2
	public List<HashMap<String, Object>> admin_fmember2();
	
} // end AdminMapper interface
