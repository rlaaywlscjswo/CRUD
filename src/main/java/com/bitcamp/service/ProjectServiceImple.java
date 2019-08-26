package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.mapper.ProjectMapper;

@Service("service")
public class ProjectServiceImple implements ProjectService {
	@Autowired
	private ProjectMapper mapper;

	@Override
	public int totalCount(String searchtxt) {
		HashMap<String, Object> dto = new HashMap<>();

		dto.put("searchtxt", searchtxt);
		return mapper.totalCount(dto);
	}

	@Override
	public List<ProjectDTO> projectList(String searchtxt, int startRow, int endRow) {
		HashMap<String, Object> dto = new HashMap<>();

		dto.put("searchtxt", searchtxt);
		dto.put("startRow", startRow);
		dto.put("endRow", endRow);
		return mapper.projectList(dto);
	}

	@Override
	public int projectInsert(ProjectDTO dto) {
		return mapper.projectInsert(dto);
	}

	@Override
	public List<ProjectDTO> projectcategoryList(String main_category) {
		return mapper.projectcategoryList(main_category);
	}

	@Override
	public ProjectDTO projectDetail(int project_no) {
		return mapper.projectDetail(project_no);
	}

	@Override
	public List<OptionDTO> projectoptionList(int project_no) {
		return mapper.projectoptionList(project_no);
	}

	@Override
	public int viewcnt(int project_no) {
		return mapper.viewcnt(project_no);
	}

	@Override
	public int projectsearchno(int category_no) {
		return mapper.projectsearchno(category_no);
	}

	// 여기서부터 ㅎ해보자 다시

	@Override
	public int projectoptionInsert(List<OptionDTO> optionlist) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", optionlist);

		return mapper.projectoptionInsert(map);
	}
}
