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

	@Override
	public MemberVo findId(String mNAME, String mEMAIL) {
		return memberDao.findId(mNAME,mEMAIL);
	}

	@Override
	public MemberVo findPwd(String mNAME, String mMID, String mEMAIL) {
		return memberDao.findPwd(mNAME,mMID,mEMAIL);
	}

	@Override
	public void TempPwdChange(String mMID, String encode) {
		memberDao.TempPwdChange(mMID,encode);
	}

	@Override
	public void memberUpdate(MemberVo vo) {
		memberDao.memberUpdate(vo);
	}

	@Override
	public void memberDelete(String mMID) {
		memberDao.memberDelete(mMID);
	}

	@Override
	public int getMyCartNumber(String mMID) {
		return memberDao.getMyCartNumber(mMID);
	}

	@Override
	public String getMyAddress(String mMID) {
		return memberDao.getMyAddress(mMID);
	}

	@Override
	public void addEmoneyMember(String mMID, int addedEmoney) {
		memberDao.addEmoneyMember(mMID,addedEmoney);
	}


}
