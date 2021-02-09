package com.spring.cjs200809.pagination;

public class PageVo {
	private int pag;
	private int pageSize;
	private int blockSize;
	private int totRecCnt;
	private int totPage;
	private int startNo;
	private int curScrNo;
	
	public int getPag() {
		return pag;
	}
	public void setPag(int pag) {
		this.pag = pag;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getTotRecCnt() {
		return totRecCnt;
	}
	public void setTotRecCnt(int totRecCnt) {
		this.totRecCnt = totRecCnt;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getCurScrNo() {
		return curScrNo;
	}
	public void setCurScrNo(int curScrNo) {
		this.curScrNo = curScrNo;
	}
	
	@Override
	public String toString() {
		return "PageVo [pag=" + pag + ", pageSize=" + pageSize + ", blockSize=" + blockSize + ", totRecCnt=" + totRecCnt
				+ ", totPage=" + totPage + ", startNo=" + startNo + ", curScrNo=" + curScrNo + "]";
	}
	
	
}
