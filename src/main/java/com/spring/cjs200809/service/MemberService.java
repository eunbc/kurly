package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.MemberVo;

public interface MemberService {

	public MemberVo IdCheck(String mMID);

	public MemberVo EmailCheck(String mEMAIL);

	public void memberJoin(MemberVo vo);

	public MemberVo findId(String mNAME, String mEMAIL);

	public MemberVo findPwd(String mNAME, String mMID, String mEMAIL);

	public void TempPwdChange(String mMID, String encode);

	public void memberUpdate(MemberVo vo);

	public void memberDelete(String mMID);

	public int getMyCartNumber(String mMID);

	public String getMyAddress(String mMID);

	public void addEmoneyMember(String mMID, int addedEmoney);

	public List<CouponVo> getMyCouponList(String mMID);

	public void subtractEmoney(String mMID, int oEMONEY);

	public void useCoupon(String mMID, int cpIDX);

	public int getMyEmoney(String mMID);

	public String getMyEmailAddress(String mMID);




}
