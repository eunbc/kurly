package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.MemberDao;
import com.spring.cjs200809.vo.CouponVo;
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

	@Override
	public List<CouponVo> getMyCouponList(String mMID) {
		return memberDao.getMyCouponList(mMID);
	}

	@Override
	public void subtractEmoney(String mMID, int oEMONEY) {
		memberDao.subtractEmoney(mMID,oEMONEY);
	}

	@Override
	public void useCoupon(String mMID, int cpIDX) {
		memberDao.useCoupon(mMID,cpIDX);
	}

	@Override
	public int getMyEmoney(String mMID) {
		return memberDao.getMyEmoney(mMID);
	}

	@Override
	public String getMyEmailAddress(String mMID) {
		return memberDao.getMyEmailAddress(mMID);
	}


}
