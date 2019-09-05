package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

public interface AdminService {

	// Excel Download
	public void getExcelDown(HttpServletResponse response, int starRow, int pagePerSize, String fmember_search);
	
	// for paging
	public int fmember_totalCount(String fmember_search);

	// 펀딩 회원 관리 1
	public List<HashMap<String, Object>> admin_fmember(int starRow, int pagePerSize, String fmember_search);

/*	// 펀딩 회원 관리 2
	public List<HashMap<String, Object>> admin_fmember2(int starRow, int pagePerSize, String fmember_search);*/
	
	// 통계
	// 성공 횟수
	public int successCount();
	// 총 프로젝트 등록 횟수
	public int theNumbersOfRegiProject();	
	// 평균 달성률
	public float avgdal();
	// 평균 평점
	public float avgRating();

} // end AdminService interface
