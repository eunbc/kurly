package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.BoardVo;

public interface BoardService {

	public void writeBoard(BoardVo vo);

	public void imgCheck(String bCONTENT, String uploadPath, int position_number);

	public List<BoardVo> bList(int startNo, int pageSize);

	public BoardVo viewBoard(int bIDX);

	public void addViewCnt(int bIDX);

	public void imgBackup(String bCONTENT, String uploadPath);

	public void imgDelete(String originalCONTENT, String uploadPath);

	public void updateBoard(BoardVo vo);

	public void deleteBoard(int bIDX);

	public List<BoardVo> bListTop();

	//public BoardVo prevAndnext(int bIDX);
	

}
