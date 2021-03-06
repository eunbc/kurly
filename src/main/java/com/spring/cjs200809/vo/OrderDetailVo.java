package com.spring.cjs200809.vo;

public class OrderDetailVo {
	private int odIDX;
	private String oNVOICE;
	private int gIDX;
	private int goIDX;
	private int odQTY;
	private String odREVIEW;
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
	@Override
	public String toString() {
		return "OrderDetailVo [odIDX=" + odIDX + ", oNVOICE=" + oNVOICE + ", gIDX=" + gIDX + ", goIDX=" + goIDX
				+ ", odQTY=" + odQTY + ", odREVIEW=" + odREVIEW + "]";
	}
	
}
