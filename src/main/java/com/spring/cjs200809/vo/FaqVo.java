package com.spring.cjs200809.vo;

public class FaqVo {
	private int fIDX;
	private String fCATEGORY;
	private String fTITLE;
	private String fCONTENT;
	public int getfIDX() {
		return fIDX;
	}
	public void setfIDX(int fIDX) {
		this.fIDX = fIDX;
	}
	public String getfCATEGORY() {
		return fCATEGORY;
	}
	public void setfCATEGORY(String fCATEGORY) {
		this.fCATEGORY = fCATEGORY;
	}
	public String getfTITLE() {
		return fTITLE;
	}
	public void setfTITLE(String fTITLE) {
		this.fTITLE = fTITLE;
	}
	public String getfCONTENT() {
		return fCONTENT;
	}
	public void setfCONTENT(String fCONTENT) {
		this.fCONTENT = fCONTENT;
	}
	@Override
	public String toString() {
		return "FaqVo [fIDX=" + fIDX + ", fCATEGORY=" + fCATEGORY + ", fTITLE=" + fTITLE + ", fCONTENT=" + fCONTENT
				+ "]";
	}
	
	
}
