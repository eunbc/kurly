package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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

	public void addGoodsOption(GoodsOptionVo vo);

	public List<GoodsOptionVo> getGoodsOption(int gIDX);

	public void deleteGoodsOption(int goIDX);

	public List<QnaVo> listQna(String qREPLY, int startNo, int pageSize);

	public String[] findMemberbyLevel(String mLEVEL);

	public void createCoupon(CouponVo vo, String mMID);

	public List<ReviewVo> listReview(int startNo, int pageSize);

	public void reviewDeleteByAdminPost(int rIDX);

	public List<MemberVo> listMember(int startNo, int pageSize, String mDROPOUT);

	public void memberDeleteByAdmin(int mIDX);

	public int getNewMemberCnt();

	public int getOutofStock();

	public int getInquiryCnt();

	public int getOrderCntToday();

	public List<OrderVo> listOrder(int startNo, int pageSize);

	public List<OrderVo> listOrderRefund();

	public void refundByAdmin(int oIDX);

	public void orderUpdate(int oIDX, int oSTATUS);

	public void memberLevelUpdate(int mIDX, String mLEVEL);

}
