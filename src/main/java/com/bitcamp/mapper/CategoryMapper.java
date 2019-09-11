package com.bitcamp.mapper;

import java.util.List;

import com.bitcamp.dto.CategoryDTO;

public interface CategoryMapper {
	public List<CategoryDTO> maincategoryList(); // 대분류
	public List<CategoryDTO> subcategoryList(String main_category); // 소분류
	
}
