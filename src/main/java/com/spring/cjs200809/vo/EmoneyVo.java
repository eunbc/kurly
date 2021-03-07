package com.spring.cjs200809.vo;

public class EmoneyVo {
	private int eIDX;
	private String mMID;
	private int ePLUS;
	private int eMINUS;
	private String eDATE;
	private String eCONTENT;
	public int geteIDX() {
		return eIDX;
	}
	public void seteIDX(int eIDX) {
		this.eIDX = eIDX;
	}
	public String getmMID() {
		return mMID;
	}
	public void setmMID(String mMID) {
		this.mMID = mMID;
	}
	public int getePLUS() {
		return ePLUS;
	}
	public void setePLUS(int ePLUS) {
		this.ePLUS = ePLUS;
	}
	public int geteMINUS() {
		return eMINUS;
	}
	public void seteMINUS(int eMINUS) {
		this.eMINUS = eMINUS;
	}
	public String geteDATE() {
		return eDATE;
	}
	public void seteDATE(String eDATE) {
		this.eDATE = eDATE;
	}
	public String geteCONTENT() {
		return eCONTENT;
	}
	public void seteCONTENT(String eCONTENT) {
		this.eCONTENT = eCONTENT;
	}
	@Override
	public String toString() {
		return "EmoneyVo [eIDX=" + eIDX + ", mMID=" + mMID + ", ePLUS=" + ePLUS + ", eMINUS=" + eMINUS + ", eDATE="
				+ eDATE + ", eCONTENT=" + eCONTENT + "]";
	}
	
}
