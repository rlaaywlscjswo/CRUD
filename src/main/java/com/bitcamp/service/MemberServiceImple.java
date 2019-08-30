package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.dto.TalkDTO;
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
	public int addressInsert(AddressDTO adto) {
		return mapper.addressInsert(adto);
	}

	@Override
	public List<AddressDTO> addrlist(int no) {
		return mapper.addrlist(no);
	}

	@Override
	public int addrssupdate1(AddressDTO adto) {
		return mapper.addrssupdate1(adto);
	}

	@Override
	public int addrssupdate2(AddressDTO adto) {
		return mapper.addrssupdate2(adto);
	}

	@Override
	public int supportinsert(SupportDTO sdto) {
		return mapper.supportinsert(sdto);
	}

	// 관리자 승인 시 회원 권한 update
	@Override
	public int changeAuth(String email) {
		return mapper.changeAuth(email);
	} // end changeAuth method

	@Override
	public MemberDTO memberinfo(String email) {
		return mapper.memberinfo(email);
	}

	@Override
	public ProjectDTO projectinfo(int option_no) {
		return mapper.projectinfo(option_no);
	}

	@Override
	public List<TalkDTO> recipientlist(int no) {
		return mapper.recipientlist(no);
	}

	@Override
	public int unread(int no) {
		return mapper.unread(no);
	}

	@Override
	public int keep(List<TalkDTO> list) {
		HashMap<String, Object> map = new HashMap<>();
		for(int i=0; i<list.size(); i++) {
			System.out.println("보관함으로 "+list.get(i).getTalk_no());
		}
		map.put("list", list);
		return mapper.keep(map);
	}

}
