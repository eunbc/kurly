package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.CategoryVo;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.SubcategoryVo;

public interface AdminDao {

	public int inquiryTotRecCnt(@Param("partValue") String partValue);

	public List<InquiryVo> listInquiry(@Param("iREPLY") String iREPLY,@Param("startNo") int startNo,@Param("pageSize") int pageSize);

	public void addCategory(@Param("cCODE")String cCODE,@Param("cNAME") String cNAME);

	public CategoryVo CategoryCheck(@Param("cCODE")String cCODE);

	public List<CategoryVo> getCategoryList();

	public List<SubcategoryVo> getSubcategoryList(@Param("cCODE") String cCODE);

	public String getcNAME(@Param("cCODE") String cCODE);

	public SubcategoryVo subcategoryCheck(@Param("cCODE")String cCODE,@Param("scCODE") String scCODE);

	public void addSubcategory(@Param("cCODE")String cCODE,@Param("scCODE") String scCODE,@Param("scNAME") String scNAME);

	public void deleteCategory(@Param("cCODE") String cCODE);

	public void deleteSubcategory(@Param("cCODE")String cCODE,@Param("scCODE") String scCODE);

}
