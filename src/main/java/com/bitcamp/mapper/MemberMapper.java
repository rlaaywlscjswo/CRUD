package com.bitcamp.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	public int emailcheck(String email);
}
