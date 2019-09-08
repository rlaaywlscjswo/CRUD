package com.bitcamp.dto;

public class PagingDTO {

	private int currPage; // 현재 페이지
	private int startRow; // 첫째 줄
	private int pagePerSize; // 페이지 당 자료의 개수
	private int totalCount; // 자료의 총 개수

	private int blockPerSize; // 블럭 당 페이지 개수
	private int firstPageOfBlock; // 블럭의 첫 페이지
	private int lastPageOfBlock; // 블럭의 마지막 페이지

	private boolean prev; // 이전
	private boolean next; // 다음

	public PagingDTO(int currPage, int totalCount, int pagePerSize, int blockPerSize) {

		this.currPage = currPage;
		this.totalCount = totalCount;
		this.pagePerSize = pagePerSize;
		this.blockPerSize = blockPerSize;
		
		calPaging();

	} // end constructor
	
	// 페이징 알고리즘
	private void calPaging() {

		startRow = (currPage - 1) * pagePerSize; 
		
		firstPageOfBlock = ((currPage - 1) / blockPerSize) * blockPerSize + 1; 
		lastPageOfBlock = firstPageOfBlock + (blockPerSize - 1);
		
		int totalPage = totalCount / pagePerSize;
		// 98 / 10 = 9 + 1 (o)
		// 100 / 10 = 10 + 1 (x)
		
		if (totalCount % pagePerSize != 0) {
			totalPage = totalCount / pagePerSize + 1;
		} else if (totalCount % pagePerSize == 0) {
			totalPage = totalCount / pagePerSize;
		}
		
		if (lastPageOfBlock > totalPage) {
			lastPageOfBlock = totalPage;
		}
		
		prev = (firstPageOfBlock == 1) ? false : true; 
		next = (lastPageOfBlock < totalPage) ? true : false;
		
	} // end calPaging method

	public int getStartRow() {
		return startRow;
	}

	public int getFirstPageOfBlock() {
		return firstPageOfBlock;
	}

	public int getLastPageOfBlock() {
		return lastPageOfBlock;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	
	

} // end PagingDTO class
