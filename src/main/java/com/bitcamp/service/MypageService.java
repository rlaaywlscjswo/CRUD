package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;

public interface MypageService {

	// for paging
	public int mySupport_totalCount(String support_search, String email);
	
	// 마이 페이지 - 내 정보 설정
	public List<MemberDTO> mypageInfoList();

	// 마이 페이지 - 내 후원 내역
	public List<SupportDTO> mySupport_list(int startRow, int pagePerSize, String support_search, String email);

	// 마이 페이지 - 내가 만든 프로젝트
	
	// 내가 만든 프로젝트 개수
	public int theNumbersOfMyProject(String email);
	
	public int myProject_totalCount(String project_search, String email);
	
	// 다..
	public List<ProjectDTO> mypage_myProject(int starRow, int pagePerSize, String project_search, String email);

	
	/*public int theNumbersOfMyProject();

	public List<ProjectDTO> theNumberOfMyProject();
	
	public List<OptionDTO> propropro();
	
	public int remainingDays();
	
	public List<MemberDTO> myProjectList();
	
	public int achievePercent();*/
	
} // end MypageService interface
