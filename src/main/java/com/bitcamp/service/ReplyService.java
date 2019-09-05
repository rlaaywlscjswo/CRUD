package com.bitcamp.service;

import java.util.List;

import com.bitcamp.dto.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> replyList(int project_no); // 댓글 목록
	public int replyInsert(ReplyDTO dto); // 댓글 등록
	public int replyUpdate(ReplyDTO dto); // 댓글 수정
	public int replyDelete(int reply_no); // 댓글 삭제
}
