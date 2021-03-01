package com.spring.cjs200809.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.QnaDao;
import com.spring.cjs200809.vo.QnaVo;

@Service
public class QnaServiceImp implements QnaService{
	@Autowired
	QnaDao qnaDao;

	@Override
	public void writeQna(QnaVo vo) {
		qnaDao.writeQna(vo);
	}




}
