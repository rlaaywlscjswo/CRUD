package com.bitcamp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	public int emailcheck(String email);
	public int memberAdd(MemberDTO dto);
}
