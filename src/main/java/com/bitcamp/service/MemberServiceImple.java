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
	public List<TalkDTO> recipientlist(HashMap<String, Object> map) {
		return mapper.recipientlist(map);
	}

	@Override
	public int unread(TalkDTO dto) {
		return mapper.unread(dto);
	}

	@Override
	public HashMap<TalkDTO, Object> talkdetail(int talk_no) {
		return mapper.talkdetail(talk_no);
	}

	@Override
	public int talkstatus(int talk_no) {
		return mapper.talkstatus(talk_no);
	}

	@Override
	public int talksend(TalkDTO dto) {
		return mapper.talksend(dto);
	}

	@Override
	public int keep(List<String> talk_no) {
		System.out.println("Service Imple");
		System.out.println(talk_no.get(0));
		System.out.println(talk_no);
		return mapper.keep(talk_no);
	}

	@Override
	public int talkdelete(List<String> talk_no) {
		return mapper.talkdelete(talk_no);
	}

	@Override
	public int move(List<String> talk_no) {
		return mapper.move(talk_no);
	}

	@Override
	public int allread(TalkDTO talkDTO) {
		return mapper.allread(talkDTO);
	}

	@Override
	public List<TalkDTO> sentlist(HashMap<String, Object> map) {
		return mapper.sentlist(map);
	}

	@Override
	public int deletesent(List<String> talk_no) {
		return mapper.deletesent(talk_no);
	}

	@Override
	public List<MemberDTO> idsearch(String search) {
		return mapper.idsearch(search);
	}

	@Override
	public MemberDTO nosearch(int no) {
		return mapper.nosearch(no);
	}

	@Override
	public int recipientcount(HashMap<String, Object> map) {
		return mapper.recipientcount(map);
	}

	@Override
	public int sentcount(HashMap<String, Object> map) {
		return mapper.sentcount(map);
	}

	@Override
	public String memberpwd(String email) {
		return mapper.memberpwd(email);
	}

	@Override
	public int passwordupdate(MemberDTO dto) {
		String changePassword = encoder.encode(dto.getPassword());
		dto.setPassword(changePassword);
		return mapper.passwordupdate(dto);
	}

}
