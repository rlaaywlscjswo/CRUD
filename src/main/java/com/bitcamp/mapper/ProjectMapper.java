package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.ProjectDTO;

@Mapper
public interface ProjectMapper {
	public int totalCount(HashMap<String, Object> dto);
	public List<ProjectDTO> projectList(HashMap<String, Object> dto); // 목록
	public int projectInsert(ProjectDTO dto); // 등록
}
