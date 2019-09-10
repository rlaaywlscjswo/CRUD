package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.dto.OptionDTO;
import com.bitcamp.dto.ProjectDTO;
import com.bitcamp.dto.ReplyDTO;

@Mapper
public interface ProjectMapper {
	public int totalCount(HashMap<String, Object> dto); // 검색 결과 리스트페이징 totalcount
	public int categorytotalCount(String sub_category); // 카테고리 결과 리스트페이징 totalcount 
	public List<ProjectDTO> projectList(HashMap<String, Object> dto); // 목록
	public List<ProjectDTO> projectcategoryList(HashMap<String, Object> dto); // 카테고리별 목록
	public int projectInsert(ProjectDTO dto); // 등록
	public ProjectDTO projectDetail(int project_no); // 프로젝트 상세 
	public List<OptionDTO> projectoptionList(int project_no); // 프로젝트 상세 in 옵션 목록
	public int projectsearchno(int category_no); // project_no 찾아서 옵션추가에 넣기 	
	public int projectoptionInsert (Map<String, Object> dto); // 프로젝트 옵션 추가   
	public int viewcnt(int project_no); // 프로젝트 조회수
	///////////////////////////////////////////////////////////////
	// 메인 화면에서 보여주는 프로젝트 list
	public List<ProjectDTO> mainHitList(); // 인기순으로 보여주는 프로젝트 list
	///////////////////////////////////////////////////////////
	// 서명 update !!!!!!!!
	public int sign(HashMap<String, Object> dto);
	public List<ReplyDTO> replyList(int project_no); // 댓글 목록
	public int replyInsert(ReplyDTO dto); // 댓글 등록
	public int replyUpdate(ReplyDTO dto); // 댓글 수정
	public int replyDelete(int reply_no); // 댓글 삭제
	
	// 병훈쓰 인기 프로젝트
	public List<ProjectDTO> popularProject();
	// 병훈쓰 새로운 프로젝트
	public List<ProjectDTO> newProject();
	// 병훈쓰 성공 임박 프로젝트
	public List<ProjectDTO> successApproach();
	
}
