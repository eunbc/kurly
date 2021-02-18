package com.spring.cjs200809.vo;

public class InquiryReplyVo {
	private int irIDX;
	private int iIDX;
	private String irWDATE;
	private String irCONTENT;
	public int getIrIDX() {
		return irIDX;
	}
	public void setIrIDX(int irIDX) {
		this.irIDX = irIDX;
	}
	public int getiIDX() {
		return iIDX;
	}
	public void setiIDX(int iIDX) {
		this.iIDX = iIDX;
	}
	public String getIrWDATE() {
		return irWDATE;
	}
	public void setIrWDATE(String irWDATE) {
		this.irWDATE = irWDATE;
	}
	public String getIrCONTENT() {
		return irCONTENT;
	}
	public void setIrCONTENT(String irCONTENT) {
		this.irCONTENT = irCONTENT;
	}
	@Override
	public String toString() {
		return "InquiryReplyVo [irIDX=" + irIDX + ", iIDX=" + iIDX + ", irWDATE=" + irWDATE + ", irCONTENT=" + irCONTENT
				+ "]";
	}
	
}
