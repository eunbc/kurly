package com.spring.cjs200809.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.QnaVo;

public interface QnaDao {

	public void writeQna(@Param("vo")QnaVo vo);

	public int qnaTotRecCnt(@Param("partValue")String partValue);

}
