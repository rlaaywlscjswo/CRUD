package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.mapper.MypageMapper;

@Service("mypageService")
public class MypageServiceImple implements MypageService {

	@Inject
	private MypageMapper mypageMapper;

	// for paging
	@Override
	public int totalCount(String support_search, String email) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("support_search", support_search);
		hm.put("email", email);

		return mypageMapper.totalCount(hm);

	} // end totalCount method

	// 마이 페이지 - 내 정보 설정
	@Override
	public List<MemberDTO> mypageInfoList() {

		return mypageMapper.mypageInfoList();

	} // end myPageList method

	// 마이 페이지 - 내 후원 내역
	@Override
	public List<SupportDTO> mypageSupportList(int startRow, int pagePerSize, String support_search, String email) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pagePerSize", pagePerSize);
		hm.put("support_search", support_search);
		hm.put("email", email);
		System.out.println("서비스 pagePerSize : " + pagePerSize);

		return mypageMapper.mypageSupportList(hm);

	} // end mypageSupportList method

	// 마이 페이지 - 내가 만든 프로젝트
	
	// 프로젝트 번호를 받아오자
	@Override
	public List<ProjectDTO> getProject_no(String email) {

		return mypageMapper.getProject_no(email);
		
	} // end getProject_no method
	
	
	
	
	
	
	
	/*@Override
	public int theNumbersOfMyProject() {

		return mypageMapper.theNumbersOfMyProject();

	} // end theNumbersOfMyProject method

	@Override
	public List<ProjectDTO> theNumberOfMyProject() {

		return mypageMapper.theNumberOfMyProject();

	} // end myProjectList method

	@Override
	public List<OptionDTO> propropro() {

		return mypageMapper.propropro();

	} // end allOfSupport method

	@Override
	public int remainingDays() {

		return mypageMapper.remainingDays();
	}

	@Override
	public List<MemberDTO> myProjectList() {

		return mypageMapper.myProjectList();
	}

	@Override
	public int achievePercent() {

		return mypageMapper.achievePercent();
	}*/

} // end MypageServiceImple class
