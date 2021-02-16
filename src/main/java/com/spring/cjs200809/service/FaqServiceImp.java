package com.spring.cjs200809.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.BoardDao;
import com.spring.cjs200809.dao.FaqDao;
import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.FaqVo;

@Service
public class FaqServiceImp implements FaqService{
	@Autowired
	FaqDao faqDao;

	@Override
	public List<FaqVo> listFaq(int startNo, int pageSize) {
		return faqDao.listFaq(startNo,pageSize);
	}

	@Override
	public void writeFaq(FaqVo vo) {
		faqDao.writeFaq(vo);
	}

	@Override
	public void deleteFaq(int fIDX) {
		faqDao.deleteFaq(fIDX);
	}

	@Override
	public List<FaqVo> listFaqCategory(String fCATEGORY, int startNo, int pageSize) {
		return faqDao.listFaqCategory(fCATEGORY,startNo,pageSize);
	}
	


}
