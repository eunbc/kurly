package com.spring.cjs200809.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.QnaVo;

public interface QnaDao {

	public void writeQna(@Param("vo")QnaVo vo);

	public void writeQnaReply(@Param("vo")QnaVo vo);

	public void updateReplyStmt(@Param("qIDX")int qIDX);

	public QnaVo viewQna(@Param("qIDX") int qIDX);

	public String maxLevelOrder(@Param("gIDX")int gIDX);

	public void levelOrderPlusUpdate(@Param("vo") QnaVo vo);

	public void qnaPrivateByAdmin(@Param("qIDX")int qIDX);

}
