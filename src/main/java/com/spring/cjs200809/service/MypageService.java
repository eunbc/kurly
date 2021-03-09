package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.EmoneyVo;
import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.OrderVo;
import com.spring.cjs200809.vo.ReviewVo;
import com.spring.cjs200809.vo.WishlistVo;

public interface MypageService {

	public List<WishlistVo> getMyWishlist(String mMID);

	public void wishDelete(int wIDX);

	public void addEmoney(String mMID, int ePLUS, String eCONTENT);

	public void subtractEmoney(String mMID, int oEMONEY, String eCONTENT);

	public List<OrderVo> getMyOrder(String mMID);

	public OrderVo getMyOrderInfo(String oNVOICE);

	public List<EmoneyVo> getMyEmoneyList(String mMID);

	public List<OrderDetailVo> getOrderDetails(String oNVOICE);

	public List<ReviewVo> getMyReviewList(String mMID);

	public List<CouponVo> getMyCouponList(String mMID);

	public int AvailableCouponCnt(String mMID);

	public void purchaseConfirm(int oIDX);

	public void cancelOrder(int oIDX);

}
