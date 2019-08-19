package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;

@Mapper
public interface MypageMapper {
	
	public int totalCount(HashMap<String, Object> hm);

	public List<MemberDTO> mypageInfoList();

	public List<SupportDTO> mypageSupportList(HashMap<String, Object> hm);

	public int theNumbersOfMyProject();
	
	public List<ProjectDTO> theNumberOfMyProject();
	
	public List<OptionDTO> propropro();

} // end MypageMapper interface
