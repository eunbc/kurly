package com.spring.cjs200809.vo;

import lombok.Data;

public class MemberVo {
	private int mIDX;
	private String mMID;
	private String mPWD;
	private String mNAME;
	private String mEMAIL;
	private String mPHONE;
	private String mADDRESS;
	private String mGENDER;
	private String mBDAY;
	private String mJOINDAY;
	private int mEMONEY;
	private String mLEVEL;
	private String mRECEIVEAD;
	private String mDROPOUT;
	
	public int getmIDX() {
		return mIDX;
	}
	public void setmIDX(int mIDX) {
		this.mIDX = mIDX;
	}
	public String getmMID() {
		return mMID;
	}
	public void setmMID(String mMID) {
		this.mMID = mMID;
	}
	public String getmPWD() {
		return mPWD;
	}
	public void setmPWD(String mPWD) {
		this.mPWD = mPWD;
	}
	public String getmNAME() {
		return mNAME;
	}
	public void setmNAME(String mNAME) {
		this.mNAME = mNAME;
	}
	public String getmEMAIL() {
		return mEMAIL;
	}
	public void setmEMAIL(String mEMAIL) {
		this.mEMAIL = mEMAIL;
	}
	public String getmPHONE() {
		return mPHONE;
	}
	public void setmPHONE(String mPHONE) {
		this.mPHONE = mPHONE;
	}
	public String getmADDRESS() {
		return mADDRESS;
	}
	public void setmADDRESS(String mADDRESS) {
		this.mADDRESS = mADDRESS;
	}
	public String getmGENDER() {
		return mGENDER;
	}
	public void setmGENDER(String mGENDER) {
		this.mGENDER = mGENDER;
	}
	public String getmBDAY() {
		return mBDAY;
	}
	public void setmBDAY(String mBDAY) {
		this.mBDAY = mBDAY;
	}
	public String getmJOINDAY() {
		return mJOINDAY;
	}
	public void setmJOINDAY(String mJOINDAY) {
		this.mJOINDAY = mJOINDAY;
	}
	public int getmEMONEY() {
		return mEMONEY;
	}
	public void setmEMONEY(int mEMONEY) {
		this.mEMONEY = mEMONEY;
	}
	public String getmLEVEL() {
		return mLEVEL;
	}
	public void setmLEVEL(String mLEVEL) {
		this.mLEVEL = mLEVEL;
	}
	public String getmRECEIVEAD() {
		return mRECEIVEAD;
	}
	public void setmRECEIVEAD(String mRECEIVEAD) {
		this.mRECEIVEAD = mRECEIVEAD;
	}
	public String getmDROPOUT() {
		return mDROPOUT;
	}
	public void setmDROPOUT(String mDROPOUT) {
		this.mDROPOUT = mDROPOUT;
	}
	@Override
	public String toString() {
		return "MemberVo [mIDX=" + mIDX + ", mMID=" + mMID + ", mPWD=" + mPWD + ", mNAME=" + mNAME + ", mEMAIL="
				+ mEMAIL + ", mPHONE=" + mPHONE + ", mADDRESS=" + mADDRESS + ", mGENDER=" + mGENDER + ", mBDAY=" + mBDAY
				+ ", mJOINDAY=" + mJOINDAY + ", mEMONEY=" + mEMONEY + ", mLEVEL=" + mLEVEL + ", mRECEIVEAD="
				+ mRECEIVEAD + ", mDROPOUT=" + mDROPOUT + "]";
	}
	
}
