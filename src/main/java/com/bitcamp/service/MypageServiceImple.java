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
	public int mySupport_totalCount(String support_search, String email) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("support_search", support_search);
		hm.put("email", email);

		return mypageMapper.mySupport_totalCount(hm);

	} // end totalCount method

	// 마이 페이지 - 내 정보 설정
	@Override
	public List<MemberDTO> mypageInfoList() {

		return mypageMapper.mypageInfoList();

	} // end myPageList method

	// 마이 페이지 - 내 후원 내역
	@Override
	public List<SupportDTO> mySupport_list(int startRow, int pagePerSize, String support_search, String email) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pagePerSize", pagePerSize);
		hm.put("support_search", support_search);
		hm.put("email", email);
		System.out.println("서비스 pagePerSize : " + pagePerSize);

		return mypageMapper.mySupport_list(hm);

	} // end mypageSupportList method

	// 마이 페이지 - 내가 만든 프로젝트
	
	// 내가 만든 프로젝트 개수
	@Override
	public int theNumbersOfMyProject(String email) {

		return mypageMapper.theNumbersOfMyProject(email);
		
	} // end theNumbersOfMyProject method
	
	@Override
	public int myProject_totalCount(String project_search, String email) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("project_search", project_search);
		hm.put("email", email);
		
		return mypageMapper.myProject_totalCount(hm);
		
	} // end myProject_totalCount method
	
	// 다..
	@Override
	public List<ProjectDTO> mypage_myProject(int startRow, int pagePerSize, String project_search, String email) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pagePerSize", pagePerSize);
		hm.put("project_search", project_search);
		hm.put("email", email);
		
		return mypageMapper.mypage_myProject(hm);
		
	} // end mypage_myProject method
	
	
	
	
	
	
	
	
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
