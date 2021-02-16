package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.FaqVo;

public interface FaqDao {

	public List<FaqVo> listFaq(@Param("startNo")int startNo,@Param("pageSize")int pageSize);

	public void writeFaq(@Param("vo")FaqVo vo);

	public void deleteFaq(@Param("fIDX")int fIDX);

	public int fListTotRecCnt();

	public List<FaqVo> listFaqCategory(@Param("fCATEGORY") String fCATEGORY,@Param("startNo") int startNo,@Param("pageSize") int pageSize);

	public int fListTotRecCntCategory(@Param("fCATEGORY") String fCATEGORY);

}
