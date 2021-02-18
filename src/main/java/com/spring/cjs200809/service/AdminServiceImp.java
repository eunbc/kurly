package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.AdminDao;
import com.spring.cjs200809.vo.InquiryVo;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	AdminDao adminDao;

	@Override
	public List<InquiryVo> listInquiry(String iREPLY, int startNo, int pageSize) {
		return adminDao.listInquiry(iREPLY,startNo,pageSize);
	}
	


}
