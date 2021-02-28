package com.spring.cjs200809.vo;

public class WishlistVo {
	private int wIDX;
	private String mMID;
	private int gIDX;

	private String gNAME;
	private String gSHORT;
	private String cCODE;
	private String scCODE;
	private int gPRICE;
	private int gDISCOUNT;
	private int gSTOCK;
	private String gIMAGE;
	private String gDETAIL;
	private String gWDATE;
	private int gSALES;
	
	public int getwIDX() {
		return wIDX;
	}
	public void setwIDX(int wIDX) {
		this.wIDX = wIDX;
	}
	public String getmMID() {
		return mMID;
	}
	public void setmMID(String mMID) {
		this.mMID = mMID;
	}
	public int getgIDX() {
		return gIDX;
	}
	public void setgIDX(int gIDX) {
		this.gIDX = gIDX;
	}
	public String getgNAME() {
		return gNAME;
	}
	public void setgNAME(String gNAME) {
		this.gNAME = gNAME;
	}
	public String getgSHORT() {
		return gSHORT;
	}
	public void setgSHORT(String gSHORT) {
		this.gSHORT = gSHORT;
	}
	public String getcCODE() {
		return cCODE;
	}
	public void setcCODE(String cCODE) {
		this.cCODE = cCODE;
	}
	public String getScCODE() {
		return scCODE;
	}
	public void setScCODE(String scCODE) {
		this.scCODE = scCODE;
	}
	public int getgPRICE() {
		return gPRICE;
	}
	public void setgPRICE(int gPRICE) {
		this.gPRICE = gPRICE;
	}
	public int getgDISCOUNT() {
		return gDISCOUNT;
	}
	public void setgDISCOUNT(int gDISCOUNT) {
		this.gDISCOUNT = gDISCOUNT;
	}
	public int getgSTOCK() {
		return gSTOCK;
	}
	public void setgSTOCK(int gSTOCK) {
		this.gSTOCK = gSTOCK;
	}
	public String getgIMAGE() {
		return gIMAGE;
	}
	public void setgIMAGE(String gIMAGE) {
		this.gIMAGE = gIMAGE;
	}
	public String getgDETAIL() {
		return gDETAIL;
	}
	public void setgDETAIL(String gDETAIL) {
		this.gDETAIL = gDETAIL;
	}
	public String getgWDATE() {
		return gWDATE;
	}
	public void setgWDATE(String gWDATE) {
		this.gWDATE = gWDATE;
	}
	public int getgSALES() {
		return gSALES;
	}
	public void setgSALES(int gSALES) {
		this.gSALES = gSALES;
	}
	
	@Override
	public String toString() {
		return "WishlistVo [wIDX=" + wIDX + ", mMID=" + mMID + ", gIDX=" + gIDX + ", gNAME=" + gNAME + ", gSHORT="
				+ gSHORT + ", cCODE=" + cCODE + ", scCODE=" + scCODE + ", gPRICE=" + gPRICE + ", gDISCOUNT=" + gDISCOUNT
				+ ", gSTOCK=" + gSTOCK + ", gIMAGE=" + gIMAGE + ", gDETAIL=" + gDETAIL + ", gWDATE=" + gWDATE
				+ ", gSALES=" + gSALES + "]";
	}	
	
}
