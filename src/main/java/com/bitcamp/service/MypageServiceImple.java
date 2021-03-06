package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.mapper.MypageMapper;

@Service("mypageService")
public class MypageServiceImple implements MypageService {

	@Inject
	private MypageMapper mypageMapper;

	// 마이 페이지 - 내 프로필
	@Override
	public MemberDTO myProfile(String email) {

		return mypageMapper.myProfile(email);

	} // end myProfile method

	
	
	@Override
	public String updatePhoto(String email, String photo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("photo", photo);		
		return mypageMapper.updatePhoto(map);
	} // end updatePhoto method
	
	// 전화 번호 수정
	@Override
	public int updatePhone(String email, MemberDTO dto) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("email", email);
		hm.put("phone", dto.getPhone());
		System.out.println("서비스 전화 번호 : " + dto.getPhone());
		
		return mypageMapper.updatePhone(hm);
		
	} // end updatePassword method
	
	// 권한부터 삭제해주고 
	@Override
	public int deleteAuth(String email) {
		
		return mypageMapper.deleteAuth(email);
		
	} // end deleteAuth method
	
	// 후에 회원 삭제
	@Override
	public int deleteMember(String email) {
		
		return mypageMapper.deleteMember(email);
		
	} // end deleteMember method
	
	
	// 마이 페이지 - 내가 만든 프로젝트

	// 내가 만든 프로젝트 개수
	@Override
	public int theNumbersOfMyProject(String email) {

		return mypageMapper.theNumbersOfMyProject(email);

	} // end theNumbersOfMyProject method

	// for paging
	@Override
	public int myProject_totalCount(String project_search, String email) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("project_search", project_search);
		hm.put("email", email);

		return mypageMapper.myProject_totalCount(hm);

	} // end myProject_totalCount method

	// 목록
	@Override
	public List<ProjectDTO> myProject_list(int startRow, int pagePerSize, String project_search, String email) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pagePerSize", pagePerSize);
		hm.put("project_search", project_search);
		hm.put("email", email);

		return mypageMapper.myProject_list(hm);

	} // end mypage_myProject method

	// 마이 페이지 - 내 후원 내역

	// for paging
	@Override
	public int mySupport_totalCount(String support_search, String email) {

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("support_search", support_search);
		hm.put("email", email);

		return mypageMapper.mySupport_totalCount(hm);

	} // end totalCount method

	// 목록
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

	

	

} // end MypageServiceImple class
