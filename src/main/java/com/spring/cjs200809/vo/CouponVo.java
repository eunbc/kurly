package com.spring.cjs200809.vo;

public class CouponVo {
	private int cpIDX;
	private String mMID;
	private String cpNAME;
	private int cpPRICE;
	private int cpMINIMUM;
	private String cpWDATE;
	private String cpSTARTDATE;
	private String cpENDDATE;
	private String cpUSE;
	public int getCpIDX() {
		return cpIDX;
	}
	public void setCpIDX(int cpIDX) {
		this.cpIDX = cpIDX;
	}
	public String getmMID() {
		return mMID;
	}
	public void setmMID(String mMID) {
		this.mMID = mMID;
	}
	public String getCpNAME() {
		return cpNAME;
	}
	public void setCpNAME(String cpNAME) {
		this.cpNAME = cpNAME;
	}
	public int getCpPRICE() {
		return cpPRICE;
	}
	public void setCpPRICE(int cpPRICE) {
		this.cpPRICE = cpPRICE;
	}
	public int getCpMINIMUM() {
		return cpMINIMUM;
	}
	public void setCpMINIMUM(int cpMINIMUM) {
		this.cpMINIMUM = cpMINIMUM;
	}
	public String getCpWDATE() {
		return cpWDATE;
	}
	public void setCpWDATE(String cpWDATE) {
		this.cpWDATE = cpWDATE;
	}
	public String getCpSTARTDATE() {
		return cpSTARTDATE;
	}
	public void setCpSTARTDATE(String cpSTARTDATE) {
		this.cpSTARTDATE = cpSTARTDATE;
	}
	public String getCpENDDATE() {
		return cpENDDATE;
	}
	public void setCpENDDATE(String cpENDDATE) {
		this.cpENDDATE = cpENDDATE;
	}
	public String getCpUSE() {
		return cpUSE;
	}
	public void setCpUSE(String cpUSE) {
		this.cpUSE = cpUSE;
	}
	@Override
	public String toString() {
		return "CouponVo [cpIDX=" + cpIDX + ", mMID=" + mMID + ", cpNAME=" + cpNAME + ", cpPRICE=" + cpPRICE
				+ ", cpMINIMUM=" + cpMINIMUM + ", cpWDATE=" + cpWDATE + ", cpSTARTDATE=" + cpSTARTDATE + ", cpENDDATE="
				+ cpENDDATE + ", cpUSE=" + cpUSE + "]";
	}
}
