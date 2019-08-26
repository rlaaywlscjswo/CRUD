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
	
	// 펀딩 회원 관리
	@Override
	public List<MemberDTO> admin_fmember() {

		return mapper.admin_fmember();
		
	} // end admin_fmember method

} // end AdminServiceImple class