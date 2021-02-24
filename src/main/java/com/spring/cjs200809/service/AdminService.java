package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs200809.vo.CategoryVo;
import com.spring.cjs200809.vo.GoodsVo;
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

	public void imgCheck(String gDETAIL, String uploadPath, int position_number);

	public void addGoods(MultipartFile file, GoodsVo vo);

	public List<GoodsVo> getGoodsByCategory(String cCODE, String scCODE, int startNo, int pageSize);

	public GoodsVo getGoodsDetail(int gIDX);

	public void goodsDelete(int gIDX);

	public void imgBackup(String gDETAIL, String uploadPath);

	public void goodsImageDelete(int gIDX);

	public void imgDelete(String originalCONTENT, String uploadPath);

	public void updateGoods(MultipartFile file, GoodsVo vo);

}
