package com.bitcamp.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SupportDTO;
import com.bitcamp.mapper.MypageMapper;

@Service("mypageService")
public class MypageServiceImple implements MypageService {

	@Inject
	private MypageMapper mypageMapper;

	@Override
	public List<MemberDTO> mypageInfoList() {

		return mypageMapper.mypageInfoList();

	} // end myPageList method

	@Override
	public List<SupportDTO> mypageSupportList() {

		return mypageMapper.mypageSupportList();
		
	} // end mypageSupportList method

} // end MypageServiceImple class
