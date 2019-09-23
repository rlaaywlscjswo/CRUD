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
	public String getName(String email);
	
	// 성공 횟수
	public int successCount(String email);

	// 총 프로젝트 등록 횟수
	public int theNumbersOfRegiProject(String email);

	// 평균 달성률
	public float avgdal(String email);

	// 평균 평점
	public float avgRating(String email);

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
	
	// 거절 된 프로젝트 지워주기 (매주 금요일 저녁 6시에 삭제)
	public void deleteDisagree();
	
	// 남은 날이 -1보다 작으면 지난 프로젝트로 변경 (매일 밤 11시 59분에 변경)
	public void updateStatus();
	
	// 고객 문의
	public List<CSDTO> adminCS();
	
	// 고객 문의 답변 작성
	public int answerCS(HashMap<String, Object> hm);

} // end AdminMapper interface
