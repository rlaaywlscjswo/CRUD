package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.ProjectDTO;

public interface ProjectService {
	public int totalCount(String searchtxt);
	public List<ProjectDTO> projectList(String searchtxt,
										int startRow, int endRow); // 목록
	public int projectInsert(ProjectDTO dto); // 등록
}
