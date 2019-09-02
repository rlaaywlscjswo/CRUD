package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.MemberDTO;

@Mapper
public interface AdminMapper {

	// 펀딩 회원 관리 1
	public List<MemberDTO> admin_fmember1();
	
	// 펀딩 회원 관리 2
	public List<MemberDTO> admin_fmember2();
	
} // end AdminMapper interface
