package com.kh.common;

import lombok.Data;


public class PageDto {
	
	private int curPage;
	private int startPage;
	private int endPage;
	private int total;
	private int maxPage;
	
	
	private boolean prev;
	private boolean next;
	public PageDto() {
		
		
	}
	public PageDto(int total,int curPage) {
		
		this.total=total;
		this.curPage=curPage;
		
		
		endPage=(int) Math.ceil(curPage/10.0)*10;
		startPage=endPage-9;
		
		maxPage=(int) Math.ceil(total/10.0);
		
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		if(endPage<maxPage) {
			next=true;
		}
		if(startPage>1) {
			prev=true;
		}
		
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	@Override
	public String toString() {
		return "PageDto [curPage=" + curPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", maxPage=" + maxPage + ", prev=" + prev + ", next=" + next + "]";
	}
	
	
}
