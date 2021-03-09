package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.CategoryVo;
import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.GoodsOptionVo;
import com.spring.cjs200809.vo.GoodsVo;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.MemberVo;
import com.spring.cjs200809.vo.OrderVo;
import com.spring.cjs200809.vo.QnaVo;
import com.spring.cjs200809.vo.ReviewVo;
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

	public void addGoods(@Param("vo") GoodsVo vo);

	public List<GoodsVo> getGoodsByCategory(@Param("cCODE")String cCODE,@Param("scCODE") String scCODE,@Param("startNo") int startNo,@Param("pageSize") int pageSize);

	public int goodsTotRecCnt(@Param("cCODE")String cCODE,@Param("scCODE") String scCODE);

	public GoodsVo getGoodsDetail(@Param("gIDX")int gIDX);

	public void goodsDelete(@Param("gIDX")int gIDX);

	public void goodsImageDelete(@Param("gIDX") int gIDX);

	public void updateGoods(@Param("vo") GoodsVo vo);

	public void addGoodsOption(@Param("vo") GoodsOptionVo vo);

	public List<GoodsOptionVo> getGoodsOption(@Param("gIDX") int gIDX);

	public void deleteGoodsOption(@Param("goIDX")int goIDX);

	public List<QnaVo> listQna(@Param("qREPLY")String qREPLY,@Param("startNo") int startNo,@Param("pageSize") int pageSize);

	public int qnaTotRecCnt(@Param("partValue")String partValue);

	public String[] findMemberbyLevel(@Param("mLEVEL")String mLEVEL);

	public void createCoupon(@Param("vo")CouponVo vo,@Param("mMID") String mMID);

	public int reviewTotRecCnt();

	public List<ReviewVo> listReview(@Param("startNo")int startNo,@Param("pageSize") int pageSize);

	public void reviewDeleteByAdminPost(@Param("rIDX")int rIDX);

	public int memberTotRecCnt(@Param("partValue")String partValue);

	public List<MemberVo> listMember(@Param("startNo")int startNo,@Param("pageSize") int pageSize,@Param("mDROPOUT") String mDROPOUT);

	public void memberDeleteByAdmin(@Param("mIDX")int mIDX);

	public int getNewMemberCnt();

	public int getOutofStock();

	public int getInquiryCnt();

	public int getOrderCntToday();

	public int orderTotRecCnt();

	public List<OrderVo> listOrder(@Param("startNo")int startNo,@Param("pageSize") int pageSize);

	public List<OrderVo> listOrderRefund();

	public void refundByAdmin(@Param("oIDX")int oIDX);

	public void orderUpdate(@Param("oIDX")int oIDX,@Param("oSTATUS") int oSTATUS);

	public void memberLevelUpdate(@Param("mIDX")int mIDX,@Param("mLEVEL") String mLEVEL);


}
