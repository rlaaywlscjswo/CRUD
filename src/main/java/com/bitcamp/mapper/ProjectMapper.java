package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;

@Mapper
public interface ProjectMapper {
	public int totalCount(HashMap<String, Object> dto); // 검색 결과 리스트페이징 totalcount
	public int categorytotalCount(String main_category); // 카테고리 결과 리스트페이징 totalcount 
	public List<ProjectDTO> projectList(HashMap<String, Object> dto); // 목록
	public List<ProjectDTO> projectcategoryList(HashMap<String, Object> dto); // 카테고리별 목록
	public int projectInsert(ProjectDTO dto); // 등록
	public ProjectDTO projectDetail(int project_no); // 프로젝트 상세 
	public List<OptionDTO> projectoptionList(int project_no); // 프로젝트 상세 in 옵션 목록
	public int projectsearchno(int category_no); // project_no 찾아서 옵션추가에 넣기 	
	public int projectoptionInsert (Map<String, Object> dto); // 프로젝트 옵션 추가   
	public int viewcnt(int project_no); // 프로젝트 조회수
	///////////////////////////////////////////////////////////////
	// 메인 화면에서 보여주는 프로젝트 list
	public List<ProjectDTO> mainHitList(); // 인기순으로 보여주는 프로젝트 list
}
