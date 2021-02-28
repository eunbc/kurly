package com.spring.cjs200809.vo;

public class GoodsOptionVo {
	private int goIDX;
	private int gIDX;
	private String goNAME;
	private int goPRICE;
	public int getGoIDX() {
		return goIDX;
	}
	public void setGoIDX(int goIDX) {
		this.goIDX = goIDX;
	}
	public int getgIDX() {
		return gIDX;
	}
	public void setgIDX(int gIDX) {
		this.gIDX = gIDX;
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
		return "GoodOptionVo [goIDX=" + goIDX + ", gIDX=" + gIDX + ", goNAME=" + goNAME + ", goPRICE=" + goPRICE + "]";
	}
	
}
