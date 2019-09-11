package com.bitcamp.service;

import java.util.List;
import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;

public interface ProjectService {
	public int totalCount(String searchtxt); // 검색 결과 리스트페이징 totalcount	
	public List<ProjectDTO> projectList(String searchtxt,
										int startRow, int endRow); // 목록
	public int categorytotalCount(String sub_category); // 카테고리 결과 리스트페이징 totalcount 
	public List<ProjectDTO> projectcategoryList(String sub_category,
										int startRow, int endRow); // 카테고리별 목록
	public int projectInsert(ProjectDTO dto); // 등록
	public ProjectDTO projectDetail(int project_no); // 프로젝트 상세 
	public List<OptionDTO> projectoptionList(int project_no); // 프로젝트 상세 in 옵션 목록
	public int projectsearchno(int category_no); // project_no 찾아서 옵션추가에 넣기 
	public int projectoptionInsert(List<OptionDTO> optionlist); // 프로젝트 옵션 추가
	public int viewcnt(int project_no); // 프로젝트 조회수	
	// 서명 업댓!!!!!!!!!!!!!!!!!!!!!!!
	public int sign(String sign, int no); // 사인 파일명 , 회원 번호
	
	// 병훈쓰 인기 프로젝트
	public List<ProjectDTO> popularProject();
	// 병훈쓰 새로운 프로젝트
	public List<ProjectDTO> newProject();
	// 병훈쓰 성공 임박 프로젝트
	public List<ProjectDTO> successApproach();
}
