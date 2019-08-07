package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.MemberDTO;

@Mapper
public interface MypageMapper {

	public List<MemberDTO> myPageList();

} // end MypageMapper interface
