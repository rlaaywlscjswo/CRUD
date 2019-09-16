package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;

@Mapper
public interface AdminMapper {

	// for paging
	public int fmember_totalCount(HashMap<String, Object> hm);

	// 펀딩 회원 관리
	public List<MemberDTO> admin_fmember(HashMap<String, Object> hm);

	// 통계
	// 성공 횟수
	public int successCount(int no);

	// 총 프로젝트 등록 횟수
	public int theNumbersOfRegiProject(int no);

	// 평균 달성률
	public float avgdal(int no);

	// 평균 평점
	public float avgRating(int no);

	// Excel용 Full List
	public List<HashMap<String, Object>> admin_Allfmember();

	// for paging
	public int sproject_totalCount(HashMap<String, Object> hm);

	// 펀딩 현황 목록
	public List<ProjectDTO> admin_sproject(HashMap<String, Object> hm);

	// Excel용 Full List
	public List<ProjectDTO> admin_Allsproject();
	
	// 거절 된 프로젝트 지워주기
	public void deleteDisagree();

} // end AdminMapper interface
