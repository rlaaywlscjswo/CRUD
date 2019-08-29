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
	
	// for paging
	public int totalCount(HashMap<String, Object> hm);

	// 마이 페이지 - 내 정보 설정
	public List<MemberDTO> mypageInfoList();

	// 마이 페이지 - 내 후원 내역
	public List<SupportDTO> mypageSupportList(HashMap<String, Object> hm);

	// 마이 페이지 - 내가 만든 프로젝트
	
	// 내가 만든 프로젝트 개수
	public int theNumbersOfMyProject(String email);
	
	// 프로젝트 번호를 받아오자
	public List<ProjectDTO> getProject_no(String email);
	
	// 썸네일 이미지
	public List<ProjectDTO> thumbnail(String email);
	
	
	
/*	public int theNumbersOfMyProject();
	
	public List<ProjectDTO> theNumberOfMyProject();
	
	public List<OptionDTO> propropro();
	
	public int remainingDays();
	
	public List<MemberDTO> myProjectList();
	
	public int achievePercent();*/

} // end MypageMapper interface
