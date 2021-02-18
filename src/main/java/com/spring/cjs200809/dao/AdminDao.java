package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.InquiryVo;

public interface AdminDao {

	public int inquiryTotRecCnt(@Param("partValue") String partValue);

	public List<InquiryVo> listInquiry(@Param("iREPLY") String iREPLY,@Param("startNo") int startNo,@Param("pageSize") int pageSize);

}
