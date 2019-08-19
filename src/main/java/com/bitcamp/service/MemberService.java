package com.bitcamp.service;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;

public interface MemberService {
	public int emailCheck(String email);
	public int memberAdd(MemberDTO dto);
	public AddressDTO address(int no);
}
