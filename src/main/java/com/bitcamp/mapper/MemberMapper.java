package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.AddressDTO;
import com.bitcamp.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	public int emailcheck(String email);
	public int memberAdd(MemberDTO dto);
	public AddressDTO address(int no);
	public int addressInsert(AddressDTO adto);
	public List<AddressDTO> addrlist(int no);
	public MemberDTO getUserById(String email); // 병훈쓰  spring security
}
