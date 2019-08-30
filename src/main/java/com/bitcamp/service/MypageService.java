package com.bitcamp.service;

import java.util.List;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;

public interface MypageService {
	
	// 마이 페이지 - 내 프로필
	public List<MemberDTO> myProfile(String email);

	// 마이 페이지 - 내가 만든 프로젝트

	// 내가 만든 프로젝트 개수
	public int theNumbersOfMyProject(String email);

	// for paging
	public int myProject_totalCount(String project_search, String email);

	// 목록
	public List<ProjectDTO> myProject_list(int starRow, int pagePerSize, String project_search, String email);

	// 마이 페이지 - 내 후원 내역
	
	// 필터링
	// 진행 중인 프로젝트
	public List<ProjectDTO> filter_ing(String email);

	// for paging
	public int mySupport_totalCount(String support_search, String email);

	// 목록
	public List<SupportDTO> mySupport_list(int startRow, int pagePerSize, String support_search, String email);

} // end MypageService interface
