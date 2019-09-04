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
	public int unread(TalkDTO dto);
	public HashMap<TalkDTO, Object> talkdetail(int talk_no);
	public int talkstatus(int talk_no);
	public int talksend(TalkDTO dto);
	public int keep(List<String> talk_no);
	public List<TalkDTO> recipientkeeplist(int no);
	public int talkdelete(List<String> talk_no);
	public int move(List<String> talk_no);
	public int allread(TalkDTO talkDTO);
	public List<TalkDTO> sentlist(int no);
	public int deletesent(List<String> talk_no);
	public List<MemberDTO> idsearch(String search);
	
}
