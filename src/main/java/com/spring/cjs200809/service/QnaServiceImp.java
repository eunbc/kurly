package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.QnaDao;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.QnaVo;

@Service
public class QnaServiceImp implements QnaService{
	@Autowired
	QnaDao qnaDao;

	@Override
	public void writeQna(QnaVo vo) {
		qnaDao.writeQna(vo);
	}

	@Override
	public void writeQnaReply(QnaVo vo) {
		qnaDao.writeQnaReply(vo);
	}

	@Override
	public void updateReplyStmt(int qIDX) {
		qnaDao.updateReplyStmt(qIDX);
	}

	@Override
	public QnaVo viewQna(int qIDX) {
		return qnaDao.viewQna(qIDX);
	}

	@Override
	public String maxLevelOrder(int gIDX) {
		return qnaDao.maxLevelOrder(gIDX);
	}

	@Override
	public void levelOrderMinusUpdate(QnaVo vo) {
		qnaDao.levelOrderMinusUpdate(vo);
	}

	@Override
	public void qnaPrivateByAdmin(int qIDX) {
		qnaDao.qnaPrivateByAdmin(qIDX);
	}

	@Override
	public List<QnaVo> getQnaList(int startNo, int pageSize, int gIDX) {
		return qnaDao.getQnaList(startNo,pageSize,gIDX);
	}




}
