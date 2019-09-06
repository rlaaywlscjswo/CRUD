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
	public int categorytotalCount(String main_category) {
		return mapper.categorytotalCount(main_category);
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
	public List<ProjectDTO> projectcategoryList(String main_category,int startRow, int endRow) {
		HashMap<String, Object> dto = new HashMap<>();
		dto.put("main_category", main_category);
		dto.put("startRow", startRow);
		dto.put("endRow", endRow);
		return mapper.projectcategoryList(dto);
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

	@Override
	public int projectoptionInsert(List<OptionDTO> optionlist) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("==========================================");
		for(int i=0; i<optionlist.size(); i++) {
			System.out.println(optionlist.get(i).getOption_name());
		}
		
		
		map.put("list", optionlist);

		return mapper.projectoptionInsert(map);
	}

	@Override
	public List<ProjectDTO> mainHitList() {		
		return mapper.mainHitList();
	}

	@Override
	public int sign(String sign, int no) {
		HashMap<String, Object> dto = new HashMap<>();
		dto.put("sign", sign);
		dto.put("no", no);
		return mapper.sign(dto);
	}
	
	// 병훈쓰 인기 프로젝트
	@Override
	public List<ProjectDTO> popularProject() {
		
		return mapper.popularProject();
		
	} // end popularProject method
	
	// 병훈쓰 새로운 프로젝트
	@Override
	public List<ProjectDTO> newProject() {
		
		return mapper.newProject();
		
	} // end newProject method
	
	// 병훈쓰 성공 임박 프로젝트
	@Override
	public List<ProjectDTO> successApproach() {
		
		return mapper.successApproach();
		
	} // end successApproach method

	
}
