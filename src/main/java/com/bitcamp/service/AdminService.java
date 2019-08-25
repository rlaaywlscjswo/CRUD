package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.MemberDTO;

public interface AdminService {

	// 펀딩 회원 관리
	public List<MemberDTO> admin_fmember();
	
} // end AdminService interface
