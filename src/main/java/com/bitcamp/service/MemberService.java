package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.dto.TalkDTO;

public interface MemberService {
	// 관리자 승인 시 회원 권한 update
	public int changeAuth(String email);
	public List<TalkDTO> recipientlist(int no);
	
	public int emailCheck(String email);
	public int memberAdd(MemberDTO dto);
	public AddressDTO address(int no);
	public int addressInsert(AddressDTO adto);
	public List<AddressDTO> addrlist(int no);
	public int addrssupdate1(AddressDTO adto);
	public int addrssupdate2(AddressDTO adto);
	public int supportinsert(SupportDTO sdto);
	public MemberDTO memberinfo(String email);
	public ProjectDTO projectinfo(int option_no);
	public int unread(int no);
	public int keep(List<TalkDTO> list);
	public HashMap<TalkDTO, Object> talkdetail(int talk_no);
	public int talkstatus(int talk_no);
	public int talksend(TalkDTO dto);
	
}
