package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	
	// for paging
	public int fmember_totalCount(HashMap<String, Object> hm);

	// 펀딩 회원 관리 1
	public List<HashMap<String, Object>> admin_fmember1(HashMap<String, Object> hm);
	
	// 펀딩 회원 관리 2
	public List<HashMap<String, Object>> admin_fmember2(HashMap<String, Object> hm);
	
	// 통계
	// 성공 횟수
	public int successCount();
	// 총 프로젝트 등록 횟수
	public int theNumbersOfRegiProject();
	// 평균 달성률
	public float avgdal();
	// 평균 평점
	public float avgRating();

} // end AdminMapper interface
