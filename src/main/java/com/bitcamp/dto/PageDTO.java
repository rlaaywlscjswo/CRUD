package com.bitcamp.dto;

public class PageDTO {
	private int currPage; //
	private int totalCount; //
	private int pageSize; //
	private int blockSize; //

	private int startRow; //
	private int endRow; //
	private int startBlock; // 
	private int endBlock; // 
	private boolean next; // 
	private boolean prev; // 

	public PageDTO(int currPage, int totalCount, int pageSize, int blockSize) {
		this.currPage = currPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		calData();
	}

	//
	private void calData() {
		startRow = (currPage - 1) * pageSize + 1;
		endRow = startRow + pageSize - 1;
		if (endRow > totalCount) {
			endRow = totalCount;
		}

		startBlock = (((currPage - 1) / blockSize) * blockSize) + 1;
		endBlock = startBlock + blockSize - 1;

		int totalPage = (int) Math.ceil(totalCount / (double) pageSize);
		if (endBlock > totalPage) {
			endBlock = totalPage;
		}

		prev = (startBlock == 1) ? false : true;
		next = (endBlock < totalPage) ? true : false; // ���ų� ������ false;

	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public int getCurrPage() {
		return currPage;
	}
}
