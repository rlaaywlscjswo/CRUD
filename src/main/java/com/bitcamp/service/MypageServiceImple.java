package com.bitcamp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.mapper.MypageMapper;

@Service("mypageService")
public class MypageServiceImple implements MypageService {

	@Resource
	private MypageMapper mypageMapper;

	@Override
	public List<MemberDTO> myPageList() {

		return mypageMapper.myPageList();

	} // end myPageList method

} // end MypageServiceImple class
