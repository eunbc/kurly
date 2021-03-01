package com.spring.cjs200809.service;

import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.QnaVo;

public interface QnaService {

	public void writeQna(QnaVo vo);

	public void writeQnaReply(QnaVo vo);

	public void updateReplyStmt(int qIDX);

	public QnaVo viewQna(int qIDX);

	public String maxLevelOrder(int gIDX);

	public void levelOrderPlusUpdate(QnaVo vo);

	public void qnaPrivateByAdmin(int qIDX);

}
