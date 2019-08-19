package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImple implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public int emailCheck(String email) {
		return mapper.emailcheck(email);
	}

	@Override
	public int memberAdd(MemberDTO dto) {
		System.out.println("서비스에서 생일 : "+dto.getBirth());
		System.out.println("서비스에서 연락처 : "+dto.getPhone());
		return mapper.memberAdd(dto);
	}

	@Override
	public AddressDTO address(int no) {
		return mapper.address(no);
	}

	@Override
	public int addrssInsert(AddressDTO adto) {
		return mapper.addressInsert(adto);
	}

}
