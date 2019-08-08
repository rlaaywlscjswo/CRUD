package com.bitcamp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SupportDTO;

@Mapper
public interface MypageMapper {

	public List<MemberDTO> mypageInfoList();

	public List<SupportDTO> mypageSupportList();

} // end MypageMapper interface
