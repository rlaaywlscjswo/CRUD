package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.mapper.AdminMapper;

@Service
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	// 펀딩 회원 관리 1
	@Override
	public List<MemberDTO> admin_fmember1() {

		return mapper.admin_fmember1();
		
	} // end admin_fmember method
	
	// 펀딩 회원 관리 2
	@Override
	public List<MemberDTO> admin_fmember2() {
		
		return mapper.admin_fmember2();
		
	} // end admin_fmember2 method

} // end AdminServiceImple class
