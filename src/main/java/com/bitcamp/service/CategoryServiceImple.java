package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.CategoryDTO;
import com.bitcamp.mapper.CategoryMapper;

@Service("categoryservice")
public class CategoryServiceImple implements CategoryService {

	@Autowired
	private CategoryMapper mapper;

	@Override
	public List<CategoryDTO> maincategoryList() {	
		return mapper.maincategoryList();
	}

	@Override
	public List<CategoryDTO> subcategoryList(String main_category) {		
		return mapper.subcategoryList(main_category);
	}
	
	


}
