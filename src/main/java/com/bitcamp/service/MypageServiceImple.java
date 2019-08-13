package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;


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
	public int totalCount(String search) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);
		
		return mypageMapper.totalCount(hm);
		
	} // end totalCount method

	@Override
	public List<MemberDTO> mypageInfoList() {

		return mypageMapper.mypageInfoList();

	} // end myPageList method

	@Override
	public List<SupportDTO> mypageSupportList(int startRow, int pagePerSize, String search) {
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("pagePerSize", pagePerSize);
		hm.put("search", search);
		
		System.out.println("★★★★★★★★★★ service - search : " + search);
		
		return mypageMapper.mypageSupportList(hm);
		
	} // end mypageSupportList method

} // end MypageServiceImple class
