package com.spring.cjs200809.service;

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



}
