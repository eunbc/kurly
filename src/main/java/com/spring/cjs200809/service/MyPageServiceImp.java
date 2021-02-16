package com.spring.cjs200809.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.AdminDao;
import com.spring.cjs200809.dao.MypageDao;

@Service
public class MyPageServiceImp implements MypageService{
	@Autowired
	MypageDao mypageDao;
	


}
