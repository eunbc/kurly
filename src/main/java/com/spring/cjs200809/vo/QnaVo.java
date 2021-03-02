package com.spring.cjs200809.vo;

public class QnaVo {
	private int qIDX;
	private int gIDX;
	private String qNAME;
	private String mMID;
	private String qTITLE;
	private String qCONTENT;
	private String qSECRET;
	private String qWDATE;
	private String qPUBLIC;
	private String qREPLY;
	private int qLEVEL;
	private int qLEVELORDER;
	
	public int getqIDX() {
		return qIDX;
	}
	public void setqIDX(int qIDX) {
		this.qIDX = qIDX;
	}
	public int getgIDX() {
		return gIDX;
	}
	public void setgIDX(int gIDX) {
		this.gIDX = gIDX;
	}
	public String getqNAME() {
		return qNAME;
	}
	public void setqNAME(String qNAME) {
		this.qNAME = qNAME;
	}
	public String getmMID() {
		return mMID;
	}
	public void setmMID(String mMID) {
		this.mMID = mMID;
	}
	public String getqTITLE() {
		return qTITLE;
	}
	public void setqTITLE(String qTITLE) {
		this.qTITLE = qTITLE;
	}
	public String getqCONTENT() {
		return qCONTENT;
	}
	public void setqCONTENT(String qCONTENT) {
		this.qCONTENT = qCONTENT;
	}
	public String getqSECRET() {
		return qSECRET;
	}
	public void setqSECRET(String qSECRET) {
		this.qSECRET = qSECRET;
	}
	public String getqWDATE() {
		return qWDATE;
	}
	public void setqWDATE(String qWDATE) {
		this.qWDATE = qWDATE;
	}
	public String getqPUBLIC() {
		return qPUBLIC;
	}
	public void setqPUBLIC(String qPUBLIC) {
		this.qPUBLIC = qPUBLIC;
	}
	public String getqREPLY() {
		return qREPLY;
	}
	public void setqREPLY(String qREPLY) {
		this.qREPLY = qREPLY;
	}
	public int getqLEVEL() {
		return qLEVEL;
	}
	public void setqLEVEL(int qLEVEL) {
		this.qLEVEL = qLEVEL;
	}
	public int getqLEVELORDER() {
		return qLEVELORDER;
	}
	public void setqLEVELORDER(int qLEVELORDER) {
		this.qLEVELORDER = qLEVELORDER;
	}
	
	@Override
	public String toString() {
		return "QnaVo [qIDX=" + qIDX + ", gIDX=" + gIDX + ", qNAME=" + qNAME + ", mMID=" + mMID + ", qTITLE=" + qTITLE
				+ ", qCONTENT=" + qCONTENT + ", qSECRET=" + qSECRET + ", qWDATE=" + qWDATE + ", qPUBLIC=" + qPUBLIC
				+ ", qREPLY=" + qREPLY + ", qLEVEL=" + qLEVEL + ", qLEVELORDER=" + qLEVELORDER + "]";
	}
}
