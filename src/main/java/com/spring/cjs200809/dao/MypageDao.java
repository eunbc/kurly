package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.EmoneyVo;
import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.OrderVo;
import com.spring.cjs200809.vo.ReviewVo;
import com.spring.cjs200809.vo.WishlistVo;

public interface MypageDao {

	public List<WishlistVo> getMyWishlist(@Param("mMID") String mMID);

	public void wishDelete(@Param("wIDX") int wIDX);

	public void addEmoney(@Param("mMID")String mMID,@Param("ePLUS") int ePLUS,@Param("eCONTENT") String eCONTENT);

	public void subtractEmoney(@Param("mMID")String mMID,@Param("oEMONEY") int oEMONEY,@Param("eCONTENT") String eCONTENT);

	public List<OrderVo> getMyOrder(@Param("mMID")String mMID);

	public OrderVo getMyOrderInfo(@Param("oNVOICE")String oNVOICE);

	public List<EmoneyVo> getMyEmoneyList(@Param("mMID")String mMID);

	public List<OrderDetailVo> getOrderDetails(@Param("oNVOICE")String oNVOICE);

	public List<ReviewVo> getMyReviewList(@Param("mMID")String mMID);

	public List<CouponVo> getMyCouponList(@Param("mMID")String mMID);

	public int AvailableCouponCnt(@Param("mMID")String mMID);

}
