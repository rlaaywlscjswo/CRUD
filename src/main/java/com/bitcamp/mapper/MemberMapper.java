package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SupportDTO;

@Mapper
public interface MemberMapper {
	public int emailcheck(String email);
	public int memberAdd(MemberDTO dto);
	public AddressDTO address(int no);
	public int addressInsert(AddressDTO adto);
	public List<AddressDTO> addrlist(int no);
	public int addrssupdate1(AddressDTO adto);
	public int addrssupdate2(AddressDTO adto);
	public int supportinsert(SupportDTO sdto);
	
	public int maxno();
	
	// 권한부여 method
	public int grantedAuth(MemberDTO dto);
	
	// userid select method
	public MemberDTO getUserById(String email);
	
}
