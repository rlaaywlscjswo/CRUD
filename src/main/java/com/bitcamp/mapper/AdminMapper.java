package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.MemberDTO;

@Mapper
public interface AdminMapper {

	// 펀딩 회원 관리
	public List<MemberDTO> admin_fmember();
	
} // end AdminMapper interface
