package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.ReplyDTO;
import com.bitcamp.mapper.ProjectMapper;

@Service
public class ReplyServiceImple implements ReplyService {

	@Autowired
	private ProjectMapper mapper;
	
	@Override
	public List<ReplyDTO> replyList(int project_no) {		
		return mapper.replyList(project_no);
	}
	
	@Override
	public int replyInsert(ReplyDTO dto) {		
		return mapper.replyInsert(dto);
	}

	

}
