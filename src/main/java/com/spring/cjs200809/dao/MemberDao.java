package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.MemberVo;

public interface MemberDao {

	public MemberVo IdCheck(@Param("mMID") String mMID);

	public MemberVo EmailCheck(@Param("mEMAIL") String mEMAIL);

	public void memberJoin(@Param("vo") MemberVo vo);

	public MemberVo findId(@Param("mNAME") String mNAME,@Param("mEMAIL") String mEMAIL);

	public MemberVo findPwd(@Param("mNAME") String mNAME,@Param("mMID") String mMID,@Param("mEMAIL") String mEMAIL);

	public void TempPwdChange(@Param("mMID") String mMID,@Param("encode") String encode);

	public void memberUpdate(@Param("vo") MemberVo vo);

	public void memberDelete(@Param("mMID") String mMID);

	public int getMyCartNumber(@Param("mMID") String mMID);

	public String getMyAddress(@Param("mMID")String mMID);

	public void addEmoneyMember(@Param("mMID")String mMID,@Param("addedEmoney") int addedEmoney);

	public List<CouponVo> getMyCouponList(@Param("mMID")String mMID);

	public void subtractEmoney(@Param("mMID")String mMID,@Param("oEMONEY") int oEMONEY);

	public void useCoupon(@Param("mMID")String mMID,@Param("cpIDX") int cpIDX);


}
