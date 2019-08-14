package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.BusinessDTO;
import com.bitcamp.mapper.BusinessMapper;

@Service("businessservice")
public class BusinessServiceImple implements BusinessService {

	@Autowired
	private BusinessMapper mapper;
	
	
	@Override
	public int businessInsert(BusinessDTO dto) {		
		return mapper.businessInsert(dto);
	}

}
