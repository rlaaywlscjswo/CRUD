package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.CSDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;

@Mapper
public interface AdminMapper {

	// for paging
	public int fmember_totalCount(HashMap<String, Object> hm);

	// 펀딩 회원 관리
	public List<MemberDTO> admin_fmember(HashMap<String, Object> hm);

	// 통계
	
	// 이름 가져오기
	public String getName(int no);
	
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
	
	// 해당하는 내용.pdf 받아오기
	public String getPdf(int project_no);
	
	// 승인 시 권한 변경
	public int agree(int project_no);
	
	// 승인 시 프로젝트 상태 변경 (1로)
	public int psChange(int project_no);
	
	// 거절 시 프로젝트 상태 변경 (2로)
	public int disagree(int project_no);

	// Excel용 Full List
	public List<ProjectDTO> admin_Allsproject();
	
	// 거절 된 프로젝트 지워주기
	public void deleteDisagree();
	
	// 고객 문의
	public List<CSDTO> adminCS();

} // end AdminMapper interface
