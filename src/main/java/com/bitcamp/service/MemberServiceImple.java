package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImple implements MemberService {
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
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
		
		// 병훈쓰 spring security password encoding
		String changePassword = encoder.encode(dto.getPassword());
		dto.setPassword(changePassword);
		
		dto.setNo(mapper.maxno());
		
		mapper.memberAdd(dto);
		
		return mapper.grantedAuth(dto);
	}

	@Override
	public AddressDTO address(int no) {
		return mapper.address(no);
	}

	@Override
	public int addrssInsert(AddressDTO adto) {
		return mapper.addressInsert(adto);
	}

	@Override
	public List<AddressDTO> addrlist(int no) {
		return mapper.addrlist(no);
	}

}
