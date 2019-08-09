package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImple implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public int emailCheck(String email) {
		return mapper.emailcheck(email);
	}

}
