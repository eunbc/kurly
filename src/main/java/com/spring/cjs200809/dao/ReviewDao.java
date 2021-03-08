package com.spring.cjs200809.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.ReviewVo;

public interface ReviewDao {

	public void writeReview(@Param("vo")ReviewVo vo);

	public OrderDetailVo checkMyOrderforReview(@Param("gIDX")int gIDX,@Param("mMID") String mMID);

	public void changeReviewStatus(@Param("gIDX")int gIDX,@Param("oNVOICE") String oNVOICE);

}
