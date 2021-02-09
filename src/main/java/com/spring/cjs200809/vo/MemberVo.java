package com.spring.cjs200809.vo;

public class MemberVo {
	private int member_idx;
	private String mid;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private String birthday;
	private String joinday;
	private int point;
	private String level;
	private String receiveAd;
	private String dropout;
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getJoinday() {
		return joinday;
	}
	public void setJoinday(String joinday) {
		this.joinday = joinday;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getReceiveAd() {
		return receiveAd;
	}
	public void setReceiveAd(String receiveAd) {
		this.receiveAd = receiveAd;
	}
	public String getDropout() {
		return dropout;
	}
	public void setDropout(String dropout) {
		this.dropout = dropout;
	}
	@Override
	public String toString() {
		return "MemberVo [member_idx=" + member_idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", email="
				+ email + ", phone=" + phone + ", address=" + address + ", gender=" + gender + ", birthday=" + birthday
				+ ", joinday=" + joinday + ", point=" + point + ", level=" + level + ", receiveAd=" + receiveAd
				+ ", dropout=" + dropout + "]";
	}
	
}
