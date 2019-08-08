package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SupportDTO;

public interface MypageService {

	public List<MemberDTO> mypageInfoList();

	public List<SupportDTO> mypageSupportList();
	
} // end MypageService interface
