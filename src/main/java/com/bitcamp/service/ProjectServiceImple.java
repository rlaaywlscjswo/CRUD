package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.mapper.ProjectMapper;

@Service("service")
public class ProjectServiceImple implements ProjectService {
	@Autowired
	private ProjectMapper mapper;
	
	@Override
	public int totalCount(String search, String searchtxt) {
		HashMap<String, Object> dto = new HashMap<>();
		dto.put("search", search);
		dto.put("searchtxt",searchtxt);
		return mapper.totalCount(dto);
	}

	@Override
	public List<ProjectDTO> projectList(String search, String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> dto = new HashMap<>();
		dto.put("search", search);
		dto.put("searchtxt",searchtxt);
		dto.put("startRow",startRow);
		dto.put("endRow", endRow);
		return mapper.projectList(dto);
	}

	@Override
	public int projectInsert(ProjectDTO dto) {	
		return mapper.projectInsert(dto);
	}

}
