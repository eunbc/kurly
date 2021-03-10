package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.ReviewVo;

public interface ReviewDao {

	public void writeReview(@Param("vo")ReviewVo vo);

	public OrderDetailVo checkMyOrderforReview(@Param("gIDX")int gIDX,@Param("mMID") String mMID);

	public void changeReviewStatus(@Param("gIDX")int gIDX,@Param("oNVOICE") String oNVOICE);

	public int reviewTotRecCnt(@Param("partValue")String partValue);

	public List<ReviewVo> getReviewList(@Param("startNo")int startNo,@Param("pageSize") int pageSize,@Param("gIDX") int gIDX);

	public void addReviewViewCnt(@Param("rIDX")int rIDX);

	public void addHelpCnt(@Param("rIDX")int rIDX);

	public ReviewVo viewReview(@Param("rIDX")int rIDX);

	public void deleteReview(@Param("rIDX")int rIDX);

}
