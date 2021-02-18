package com.spring.cjs200809.vo;

public class MailVo {
	private String toMail;
	private String title;
	private String content;
	
	private String mMID;	//mid와 pwd는 비밀번호 분실시 새로 발생하여 메일로 보내기위해 추가선언
	private String mPWD;
	
	public String getToMail() {
		return toMail;
	}
	public void setToMail(String toMail) {
		this.toMail = toMail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	@Override
	public String toString() {
		return "MailVo [toMail=" + toMail + ", title=" + title + ", content=" + content + ", mMID=" + mMID + ", mPWD="
				+ mPWD + "]";
	}
}
