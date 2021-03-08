package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.AdminDao;
import com.spring.cjs200809.dao.MypageDao;
import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.EmoneyVo;
import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.OrderVo;
import com.spring.cjs200809.vo.ReviewVo;
import com.spring.cjs200809.vo.WishlistVo;

@Service
public class MyPageServiceImp implements MypageService{
	@Autowired
	MypageDao mypageDao;

	@Override
	public List<WishlistVo> getMyWishlist(String mMID) {
		return mypageDao.getMyWishlist(mMID);
	}

	@Override
	public void wishDelete(int wIDX) {
		mypageDao.wishDelete(wIDX);
	}

	@Override
	public void addEmoney(String mMID, int ePLUS, String eCONTENT) {
		mypageDao.addEmoney(mMID,ePLUS,eCONTENT);
	}

	@Override
	public void subtractEmoney(String mMID, int oEMONEY, String eCONTENT) {
		mypageDao.subtractEmoney(mMID,oEMONEY,eCONTENT);
	}

	@Override
	public List<OrderVo> getMyOrder(String mMID) {
		return mypageDao.getMyOrder(mMID);
	}

	@Override
	public OrderVo getMyOrderInfo(String oNVOICE) {
		return mypageDao.getMyOrderInfo(oNVOICE);
	}

	@Override
	public List<EmoneyVo> getMyEmoneyList(String mMID) {
		return mypageDao.getMyEmoneyList(mMID);
	}

	@Override
	public List<OrderDetailVo> getOrderDetails(String oNVOICE) {
		return mypageDao.getOrderDetails(oNVOICE);
	}

	@Override
	public List<ReviewVo> getMyReviewList(String mMID) {
		return mypageDao.getMyReviewList(mMID);
	}

	@Override
	public List<CouponVo> getMyCouponList(String mMID) {
		return mypageDao.getMyCouponList(mMID);
	}

	@Override
	public int AvailableCouponCnt(String mMID) {
		return mypageDao.AvailableCouponCnt(mMID);
	}
	


}
