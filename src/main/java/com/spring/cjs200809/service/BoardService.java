package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.BoardVo;

public interface BoardService {

	public void writeBoard(BoardVo vo);

	public void imgCheck(String content, String uploadPath, int position_number);

	public List<BoardVo> bList(int startNo, int pageSize);

	public BoardVo viewBoard(int idx);

	public void addViewCnt(int idx);

}
