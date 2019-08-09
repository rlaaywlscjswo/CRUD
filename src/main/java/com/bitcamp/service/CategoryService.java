package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.CategoryDTO;

public interface CategoryService {
	public List<CategoryDTO>  maincategoryList();
	public List<CategoryDTO> subcategoryList(String main_categry);
}
