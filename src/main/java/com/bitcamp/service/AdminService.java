package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

public interface AdminService {
	
	// Excel Download
	public void getExcelDown(HttpServletResponse response);

	// 펀딩 회원 관리 1
	public List<HashMap<String, Object>> admin_fmember1();
	
	// 펀딩 회원 관리 2
	public List<HashMap<String, Object>> admin_fmember2();
	
} // end AdminService interface
