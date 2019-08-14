package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;

@Mapper
public interface ProjectMapper {
	public int totalCount(HashMap<String, Object> dto);
	public List<ProjectDTO> projectList(HashMap<String, Object> dto); // 목록
	public List<ProjectDTO> projectcategoryList(String main_category); // 카테고리별 목록
	public int projectInsert(ProjectDTO dto); // 등록
	public ProjectDTO projectDetail(int project_no); // 프로젝트 상세 
	public List<OptionDTO> projectoptionList(int project_no); // 프로젝트 상세 in 옵션 목록
	public int viewcnt(int project_no); // 프로젝트 조회수
}
