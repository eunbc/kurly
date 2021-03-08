package com.spring.cjs200809.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.ReviewVo;

public interface ReviewService {

	public void writeReview(MultipartHttpServletRequest file, ReviewVo vo);

	public OrderDetailVo checkMyOrderforReview(int gIDX, String mMID);

	public void changeReviewStatus(int gIDX, String oNVOICE);

}
