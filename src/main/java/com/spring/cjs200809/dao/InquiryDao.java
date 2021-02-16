package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.InquiryVo;

public interface InquiryDao {

	public void writeInquiry(@Param("vo") InquiryVo vo);

	public List<InquiryVo> listInquiry(@Param("mMID") String mMID);

	public InquiryVo viewInquiry(@Param("iIDX") int iIDX);

}
