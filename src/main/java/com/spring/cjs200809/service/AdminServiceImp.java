package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.AdminDao;
import com.spring.cjs200809.vo.CategoryVo;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.SubcategoryVo;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	AdminDao adminDao;

	@Override
	public List<InquiryVo> listInquiry(String iREPLY, int startNo, int pageSize) {
		return adminDao.listInquiry(iREPLY,startNo,pageSize);
	}

	@Override
	public void addCategory(String cCODE, String cNAME) {
		adminDao.addCategory(cCODE,cNAME);
	}

	@Override
	public CategoryVo CategoryCheck(String cCODE) {
		return adminDao.CategoryCheck(cCODE);
	}

	@Override
	public List<CategoryVo> getCategoryList() {
		return adminDao.getCategoryList();
	}

	@Override
	public List<SubcategoryVo> getSubcategoryList(String cCODE) {
		return adminDao.getSubcategoryList(cCODE);
	}

	@Override
	public String getcNAME(String cCODE) {
		return adminDao.getcNAME(cCODE);
	}

	@Override
	public SubcategoryVo subcategoryCheck(String cCODE, String scCODE) {
		return adminDao.subcategoryCheck(cCODE,scCODE);
	}

	@Override
	public void addSubcategory(String cCODE, String scCODE, String scNAME) {
		adminDao.addSubcategory(cCODE,scCODE,scNAME);
	}

	@Override
	public void deleteCategory(String cCODE) {
		adminDao.deleteCategory(cCODE);
	}

	@Override
	public void deleteSubcategory(String cCODE, String scCODE) {
		adminDao.deleteSubcategory(cCODE,scCODE);
	}
	


}
