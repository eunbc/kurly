package com.spring.cjs200809.vo;

public class OrderDetailVo {
	private int odIDX;
	private String oNVOICE;
	private int gIDX;
	private int goIDX;
	private int odQTY;
	private String odREVIEW;
	
	//goods
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
	
	//goods_option
	private String goNAME;
	private int goPRICE;
	public int getOdIDX() {
		return odIDX;
	}
	public void setOdIDX(int odIDX) {
		this.odIDX = odIDX;
	}
	public String getoNVOICE() {
		return oNVOICE;
	}
	public void setoNVOICE(String oNVOICE) {
		this.oNVOICE = oNVOICE;
	}
	public int getgIDX() {
		return gIDX;
	}
	public void setgIDX(int gIDX) {
		this.gIDX = gIDX;
	}
	public int getGoIDX() {
		return goIDX;
	}
	public void setGoIDX(int goIDX) {
		this.goIDX = goIDX;
	}
	public int getOdQTY() {
		return odQTY;
	}
	public void setOdQTY(int odQTY) {
		this.odQTY = odQTY;
	}
	public String getOdREVIEW() {
		return odREVIEW;
	}
	public void setOdREVIEW(String odREVIEW) {
		this.odREVIEW = odREVIEW;
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
	public String getGoNAME() {
		return goNAME;
	}
	public void setGoNAME(String goNAME) {
		this.goNAME = goNAME;
	}
	public int getGoPRICE() {
		return goPRICE;
	}
	public void setGoPRICE(int goPRICE) {
		this.goPRICE = goPRICE;
	}
	
	@Override
	public String toString() {
		return "OrderDetailVo [odIDX=" + odIDX + ", oNVOICE=" + oNVOICE + ", gIDX=" + gIDX + ", goIDX=" + goIDX
				+ ", odQTY=" + odQTY + ", odREVIEW=" + odREVIEW + ", gNAME=" + gNAME + ", gSHORT=" + gSHORT + ", cCODE="
				+ cCODE + ", scCODE=" + scCODE + ", gPRICE=" + gPRICE + ", gDISCOUNT=" + gDISCOUNT + ", gSTOCK="
				+ gSTOCK + ", gIMAGE=" + gIMAGE + ", gDETAIL=" + gDETAIL + ", gWDATE=" + gWDATE + ", gSALES=" + gSALES
				+ ", goNAME=" + goNAME + ", goPRICE=" + goPRICE + "]";
	}	

}
