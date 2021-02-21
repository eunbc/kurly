package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.CategoryVo;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.SubcategoryVo;

public interface AdminService {

	public List<InquiryVo> listInquiry(String iREPLY, int startNo, int pageSize);

	public void addCategory(String cCODE, String cNAME);

	public CategoryVo CategoryCheck(String cCODE);

	public List<CategoryVo> getCategoryList();

	public List<SubcategoryVo> getSubcategoryList(String cCODE);

	public String getcNAME(String cCODE);

	public SubcategoryVo subcategoryCheck(String cCODE, String scCODE);

	public void addSubcategory(String cCODE, String scCODE, String scNAME);

	public void deleteCategory(String cCODE);

	public void deleteSubcategory(String cCODE, String scCODE);

}
