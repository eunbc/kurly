package com.spring.cjs200809.vo;

public class BoardVo {
	private int bIDX;
	private String mMID;
	private String bNAME;
	private String bTITLE;
	private String bWDATE;
	private int bVIEWCNT;
	private String bCONTENT;
	private String bTOP;
	private String originalCONTENT;
	
	private int prevIDX; //이전글 번호
	private int nextIDX; //다음글 번호
	private String prevTITLE;
	private String nextTITLE;
	public int getbIDX() {
		return bIDX;
	}
	public void setbIDX(int bIDX) {
		this.bIDX = bIDX;
	}
	public String getmMID() {
		return mMID;
	}
	public void setmMID(String mMID) {
		this.mMID = mMID;
	}
	public String getbNAME() {
		return bNAME;
	}
	public void setbNAME(String bNAME) {
		this.bNAME = bNAME;
	}
	public String getbTITLE() {
		return bTITLE;
	}
	public void setbTITLE(String bTITLE) {
		this.bTITLE = bTITLE;
	}
	public String getbWDATE() {
		return bWDATE;
	}
	public void setbWDATE(String bWDATE) {
		this.bWDATE = bWDATE;
	}
	public int getbVIEWCNT() {
		return bVIEWCNT;
	}
	public void setbVIEWCNT(int bVIEWCNT) {
		this.bVIEWCNT = bVIEWCNT;
	}
	public String getbCONTENT() {
		return bCONTENT;
	}
	public void setbCONTENT(String bCONTENT) {
		this.bCONTENT = bCONTENT;
	}
	public String getbTOP() {
		return bTOP;
	}
	public void setbTOP(String bTOP) {
		this.bTOP = bTOP;
	}
	public String getOriginalCONTENT() {
		return originalCONTENT;
	}
	public void setOriginalCONTENT(String originalCONTENT) {
		this.originalCONTENT = originalCONTENT;
	}
	public int getPrevIDX() {
		return prevIDX;
	}
	public void setPrevIDX(int prevIDX) {
		this.prevIDX = prevIDX;
	}
	public int getNextIDX() {
		return nextIDX;
	}
	public void setNextIDX(int nextIDX) {
		this.nextIDX = nextIDX;
	}
	public String getPrevTITLE() {
		return prevTITLE;
	}
	public void setPrevTITLE(String prevTITLE) {
		this.prevTITLE = prevTITLE;
	}
	public String getNextTITLE() {
		return nextTITLE;
	}
	public void setNextTITLE(String nextTITLE) {
		this.nextTITLE = nextTITLE;
	}
	@Override
	public String toString() {
		return "BoardVo [bIDX=" + bIDX + ", mMID=" + mMID + ", bNAME=" + bNAME + ", bTITLE=" + bTITLE + ", bWDATE="
				+ bWDATE + ", bVIEWCNT=" + bVIEWCNT + ", bCONTENT=" + bCONTENT + ", bTOP=" + bTOP + ", originalCONTENT="
				+ originalCONTENT + ", prevIDX=" + prevIDX + ", nextIDX=" + nextIDX + ", prevTITLE=" + prevTITLE
				+ ", nextTITLE=" + nextTITLE + "]";
	}
	
}
