package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.MemberDTO;

public interface AdminService {

	// 펀딩 회원 관리 1
	public List<MemberDTO> admin_fmember1();
	
	// 펀딩 회원 관리 2
	public List<MemberDTO> admin_fmember2();
	
} // end AdminService interface
