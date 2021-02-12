package com.spring.cjs200809.service;

import com.spring.cjs200809.vo.MemberVo;

public interface MemberService {

	public MemberVo IdCheck(String mMID);

	public MemberVo EmailCheck(String mEMAIL);

	public void memberJoin(MemberVo vo);


}
