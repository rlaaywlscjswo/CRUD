package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.dto.TalkDTO;

@Mapper
public interface MemberMapper {
	public int maxno();
	
	// 권한부여 method
	public int grantedAuth(MemberDTO dto);
	
	// userid select method
	public MemberDTO getUserById(String email);
	
	// 관리자 승인 시 회원 권한 update
	public int changeAuth(String email);
	
	public int emailcheck(String email);
	public int memberAdd(MemberDTO dto);
	public AddressDTO address(int no);
	public int addressInsert(AddressDTO adto);
	public List<AddressDTO> addrlist(int no);
	public int addrssupdate1(AddressDTO adto);
	public int addrssupdate2(AddressDTO adto);
	public int supportinsert(SupportDTO sdto);
	public MemberDTO memberinfo(String email); // 회원 정보
	public ProjectDTO projectinfo(int option_no); // 프로젝트 정보
	public List<TalkDTO> recipientlist(int no); // 받은 쪽지 리스트
	public int unread(int no); // 읽지 않은 쪽지 갯수
	public int keep(HashMap<String, Object> talk_no); // 쪽지 보관함으로 이동.
	public HashMap<TalkDTO, Object> talkdetail(int talk_no); // 쪽지 상세
	public int talkstatus(int talk_no); // 쪽지 읽음 처리.
	public int talksend(TalkDTO dto); // 쪽지 보내기

	
	
}
