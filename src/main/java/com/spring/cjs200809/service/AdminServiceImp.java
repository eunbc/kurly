package com.spring.cjs200809.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.AdminDao;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	AdminDao adminDao;
	


}
