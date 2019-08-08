package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.ProjectDTO;

public interface ProjectService {
	public int totalCount(String search, String searchtxt);
	public List<ProjectDTO> projectList(String search, String searchtxt,
										int startRow, int endRow); // 목록 
}