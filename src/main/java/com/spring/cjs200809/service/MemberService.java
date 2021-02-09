package com.spring.cjs200809.service;

import com.spring.cjs200809.vo.MemberVo;

public interface MemberService {

	public MemberVo getIdCheck(String mid);

	public MemberVo getemailCheck(String email);

	public void memberJoin(MemberVo vo);

}
