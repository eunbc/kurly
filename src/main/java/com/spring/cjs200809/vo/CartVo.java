package com.spring.cjs200809.vo;

public class CartVo {
	private int cIDX;
	private String mMID;
	private int gIDX;
	private int cQTY;
	private int goIDX;
	private String cDATE;
	
	public int getcIDX() {
		return cIDX;
	}
	public void setcIDX(int cIDX) {
		this.cIDX = cIDX;
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
	public int getcQTY() {
		return cQTY;
	}
	public void setcQTY(int cQTY) {
		this.cQTY = cQTY;
	}
	public int getGoIDX() {
		return goIDX;
	}
	public void setGoIDX(int goIDX) {
		this.goIDX = goIDX;
	}
	public String getcDATE() {
		return cDATE;
	}
	public void setcDATE(String cDATE) {
		this.cDATE = cDATE;
	}
	@Override
	public String toString() {
		return "CartVo [cIDX=" + cIDX + ", mMID=" + mMID + ", gIDX=" + gIDX + ", cQTY=" + cQTY + ", goIDX=" + goIDX
				+ ", cDATE=" + cDATE + "]";
	}
}
