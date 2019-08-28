package com.bitcamp.service;

import java.util.List;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;

public interface MypageService {

	// for paging
	public int totalCount(String support_search, String email);
	
	// 마이 페이지 - 내 정보 설정
	public List<MemberDTO> mypageInfoList();

	// 마이 페이지 - 내 후원 내역
	public List<SupportDTO> mypageSupportList(int startRow, int pagePerSize, String support_search, String email);

	// 마이 페이지 - 내가 만든 프로젝트
	
	// 프로젝트 번호를 받아오자
	public List<ProjectDTO> getProject_no(String email);
	
	
	/*public int theNumbersOfMyProject();

	public List<ProjectDTO> theNumberOfMyProject();
	
	public List<OptionDTO> propropro();
	
	public int remainingDays();
	
	public List<MemberDTO> myProjectList();
	
	public int achievePercent();*/
	
} // end MypageService interface
