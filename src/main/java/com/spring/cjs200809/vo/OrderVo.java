package com.spring.cjs200809.vo;

public class OrderVo {
	private int oIDX;
	private String mMID;
	private String oDATE;
	private String oNAME;
	private String oPHONE;
	private String oADDRESS;
	private int oAMOUNT;
	private int oEMONEY;
	private int cIDX;
	private String oPAYMENT;
	private String nNVOICE;
	private String oSTATUS;
	public int getoIDX() {
		return oIDX;
	}
	public void setoIDX(int oIDX) {
		this.oIDX = oIDX;
	}
	public String getmMID() {
		return mMID;
	}
	public void setmMID(String mMID) {
		this.mMID = mMID;
	}
	public String getoDATE() {
		return oDATE;
	}
	public void setoDATE(String oDATE) {
		this.oDATE = oDATE;
	}
	public String getoNAME() {
		return oNAME;
	}
	public void setoNAME(String oNAME) {
		this.oNAME = oNAME;
	}
	public String getoPHONE() {
		return oPHONE;
	}
	public void setoPHONE(String oPHONE) {
		this.oPHONE = oPHONE;
	}
	public String getoADDRESS() {
		return oADDRESS;
	}
	public void setoADDRESS(String oADDRESS) {
		this.oADDRESS = oADDRESS;
	}
	public int getoAMOUNT() {
		return oAMOUNT;
	}
	public void setoAMOUNT(int oAMOUNT) {
		this.oAMOUNT = oAMOUNT;
	}
	public int getoEMONEY() {
		return oEMONEY;
	}
	public void setoEMONEY(int oEMONEY) {
		this.oEMONEY = oEMONEY;
	}
	public int getcIDX() {
		return cIDX;
	}
	public void setcIDX(int cIDX) {
		this.cIDX = cIDX;
	}
	public String getoPAYMENT() {
		return oPAYMENT;
	}
	public void setoPAYMENT(String oPAYMENT) {
		this.oPAYMENT = oPAYMENT;
	}
	public String getnNVOICE() {
		return nNVOICE;
	}
	public void setnNVOICE(String nNVOICE) {
		this.nNVOICE = nNVOICE;
	}
	public String getoSTATUS() {
		return oSTATUS;
	}
	public void setoSTATUS(String oSTATUS) {
		this.oSTATUS = oSTATUS;
	}
	
	@Override
	public String toString() {
		return "OrderVo [oIDX=" + oIDX + ", mMID=" + mMID + ", oDATE=" + oDATE + ", oNAME=" + oNAME + ", oPHONE="
				+ oPHONE + ", oADDRESS=" + oADDRESS + ", oAMOUNT=" + oAMOUNT + ", oEMONEY=" + oEMONEY + ", cIDX=" + cIDX
				+ ", oPAYMENT=" + oPAYMENT + ", nNVOICE=" + nNVOICE + ", oSTATUS=" + oSTATUS + "]";
	}
	
	
}
