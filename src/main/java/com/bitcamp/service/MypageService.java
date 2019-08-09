package com.bitcamp.service;

import java.util.List;

import com.bitcamp.app.CategoryDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SupportDTO;

public interface MypageService {

	public List<MemberDTO> mypageInfoList();

	public List<SupportDTO> mypageSupportList();

	public List<CategoryDTO> category_test();
	
} // end MypageService interface
