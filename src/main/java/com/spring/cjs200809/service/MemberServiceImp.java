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
	public MemberVo IdCheck(String mMID) {
		return memberDao.IdCheck(mMID);
	}

	@Override
	public MemberVo EmailCheck(String mEMAIL) {
		return memberDao.EmailCheck(mEMAIL);
	}

	@Override
	public void memberJoin(MemberVo vo) {
		memberDao.memberJoin(vo);
	}

}
