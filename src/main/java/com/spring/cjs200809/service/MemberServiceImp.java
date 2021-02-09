package com.spring.cjs200809.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.MemberDao;
import com.spring.cjs200809.vo.MemberVo;

@Service
public class MemberServiceImp implements MemberService{
	@Autowired
	MemberDao memberDao;

	@Override
	public MemberVo getIdCheck(String mid) {
		return memberDao.getIdCheck(mid);
	}

	@Override
	public MemberVo getemailCheck(String email) {
		return memberDao.getemailCheck(email);
	}

	@Override
	public void memberJoin(MemberVo vo) {
		memberDao.memberJoin(vo);
	}
}
