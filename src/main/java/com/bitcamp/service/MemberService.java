package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SupportDTO;

public interface MemberService {
	public int emailCheck(String email);
	public int memberAdd(MemberDTO dto);
	public AddressDTO address(int no);
	public int addrssInsert(AddressDTO adto);
	public List<AddressDTO> addrlist(int no);
	public int addrssupdate1(AddressDTO adto);
	public int addrssupdate2(AddressDTO adto);
	public int supportinsert(SupportDTO sdto);
}
