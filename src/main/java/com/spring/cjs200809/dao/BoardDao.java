package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.BoardVo;

public interface BoardDao {

	public void writeBoard(@Param("vo") BoardVo vo);

	public int bListTotRecCnt();

	public List<BoardVo> bList(@Param("startNo") int startNo,@Param("pageSize") int pageSize);

	public BoardVo viewBoard(@Param("idx") int idx);

	public void addViewCnt(@Param("idx") int idx);

}
