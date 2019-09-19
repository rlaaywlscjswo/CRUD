package com.bitcamp.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.bitcamp.dto.CSDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ProjectDTO;

public interface AdminService {

	// Excel Download
	public void getExcelDown(HttpServletResponse response);
	
	// for paging
	public int fmember_totalCount(String fmember_search);

	// 펀딩 회원 관리
	public List<MemberDTO> admin_fmember(int starRow, int pagePerSize, String fmember_search);
	
	// 통계
	//이름 가져오기
	public String getName(int no);
	// 성공 횟수
	public int successCount(int no);
	// 총 프로젝트 등록 횟수
	public int theNumbersOfRegiProject(int no);	
	// 평균 달성률
	public float avgdal(int no);
	// 평균 평점
	public float avgRating(int no);
	
	// for paging
	public int sproject_totalCount(String sproject_search);
	
	// 펀딩 현황 목록
	public List<ProjectDTO> admin_sproject(int starRow, int pagePerSize, String sproject_search);
	
	// 해당하는 내용.pdf 받아오기
	public String getPdf(int project_no);
	
	// 승인 시 권한 변경
	public int agree(int project_no);
	
	// 승인 시 프로젝트 상태 변경 (1로)
	public int psChange(int project_no);
	
	// 거절 시 프로젝트 상태 변경 (2로)
	public int disagree(int project_no);
	
	// Excel Download
	public void sproject_getExcelDown(HttpServletResponse response);
	
	// 거절 된 프로젝트 지워주기 (매주 금요일 저녁 6시에 삭제)
	public void deleteDisagree();
	
	// 고객 문의
	public List<CSDTO> adminCS();
	
	// 고객 문의 답변 작성
	public int answerCS(String service_reply, int service_no);

} // end AdminService interface
