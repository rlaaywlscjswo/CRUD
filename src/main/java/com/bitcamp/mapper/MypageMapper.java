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

	// 마이 페이지 - 내 후원 내역

	// for paging
	public int mySupport_totalCount(HashMap<String, Object> hm);

	// 목록
	public List<SupportDTO> mySupport_list(HashMap<String, Object> hm);

	
	// 마이 페이지 - 내가 만든 프로젝트

	// 내가 만든 프로젝트 개수
	public int theNumbersOfMyProject(String email);
	
	// for paging
	public int myProject_totalCount(HashMap<String, Object> hm);

	// 목록
	public List<ProjectDTO> mypage_myProject(HashMap<String, Object> hm);

	
	// 마이 페이지 - 내 정보 설정
	public List<MemberDTO> mypageInfoList();

	/*
	 * public int theNumbersOfMyProject();
	 * 
	 * public List<ProjectDTO> theNumberOfMyProject();
	 * 
	 * public List<OptionDTO> propropro();
	 * 
	 * public int remainingDays();
	 * 
	 * public List<MemberDTO> myProjectList();
	 * 
	 * public int achievePercent();
	 */

} // end MypageMapper interface
