package com.bitcamp.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;

public interface AdminService {

	// Excel Download
	public void getExcelDown(HttpServletResponse response);
	
	// for paging
	public int fmember_totalCount(String fmember_search);

	// 펀딩 회원 관리 1
	public List<MemberDTO> admin_fmember(int starRow, int pagePerSize, String fmember_search);
	
	// 통계
	// 성공 횟수
	public int successCount();
	// 총 프로젝트 등록 횟수
	public int theNumbersOfRegiProject();	
	// 평균 달성률
	public float avgdal();
	// 평균 평점
	public float avgRating();
	
	// for paging
	public int sproject_totalCount(String sproject_search);
	
	// 펀딩 현황 목록
	public List<ProjectDTO> admin_sproject(int starRow, int pagePerSize, String sproject_search);
	
	// Excel Download
	public void sproject_getExcelDown(HttpServletResponse response);
	
	// 거절 된 프로젝트 지워주기 (매주 금요일 저녁 6시에 삭제)
	public void deleteDisagree();

} // end AdminService interface
