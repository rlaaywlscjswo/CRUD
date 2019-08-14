package com.bitcamp.service;

import java.util.List;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;

public interface MypageService {

	public int totalCount(String support_search);
	
	public List<MemberDTO> mypageInfoList();

	public List<SupportDTO> mypageSupportList(int startRow, int pagePerSize, String support_search);

	public int theNumbersOfMyProject();

	public List<ProjectDTO> theNumberOfMyProject();
	
	public List<OptionDTO> propropro();
	
} // end MypageService interface
