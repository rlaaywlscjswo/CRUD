package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.SupportDTO;

@Mapper
public interface MypageMapper {

	// 마이 페이지 - 내 프로필
	public MemberDTO myProfile(String email);

	// 프로필사진 수정
	public String updatePhoto(HashMap<String, Object> update);
	
	// 전화 번호 수정
	public int updatePhone(HashMap<String, Object> hm);
	
	// 회원 탈퇴
	
	// 권한부터 삭제해주고 
	public int deleteAuth(String email);
	
	// 후에 회원 삭제
	public int deleteMember(String email);
	
	// 마이 페이지 - 내가 만든 프로젝트

	// 내가 만든 프로젝트 개수
	public int theNumbersOfMyProject(String email);

	// for paging
	public int myProject_totalCount(HashMap<String, Object> hm);

	// 목록
	public List<ProjectDTO> myProject_list(HashMap<String, Object> hm);

	// 마이 페이지 - 내 후원 내역

	// 필터링
	// 진행 중인 프로젝트
	public List<ProjectDTO> filter_ing(String email);
	
	// for paging
	public int mySupport_totalCount(HashMap<String, Object> hm);

	// 목록
	public List<SupportDTO> mySupport_list(HashMap<String, Object> hm);

} // end MypageMapper interface
