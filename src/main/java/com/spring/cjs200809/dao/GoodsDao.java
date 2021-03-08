package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.CartVo;
import com.spring.cjs200809.vo.GoodsVo;
import com.spring.cjs200809.vo.OrderVo;

public interface GoodsDao {

	public List<GoodsVo> goodsListNew(@Param("startNo")int startNo,@Param("pageSize") int pageSize);

	public List<GoodsVo> goodsListBest(@Param("startNo")int startNo,@Param("pageSize") int pageSize);
	
	public List<GoodsVo> goodsListOnsale(@Param("startNo")int startNo,@Param("pageSize") int pageSize);

	public int goodsTotRecCnt();

	public void addCart(@Param("mMID")String mMID,@Param("gIDX") int gIDX,@Param("cQTY") int cQTY,@Param("goIDX") int goIDX);

	public void addWishlist(@Param("mMID")String mMID,@Param("gIDX") int gIDX);

	public String checkWishlist(@Param("mMID")String mMID,@Param("gIDX") int gIDX);

	public List<CartVo> getMyCart(@Param("mMID") String mMID);

	public List<GoodsVo> mainGoodsListNew();

	public int checkMyCart(@Param("mMID")String mMID,@Param("gIDX") int gIDX,@Param("goIDX") int goIDX);

	public void updateMyCart(@Param("mMID")String mMID,@Param("gIDX") int gIDX,@Param("goIDX") int goIDX,@Param("cQTY") int cQTY);

	public void cartDelete(@Param("cIDX")int cIDX);

	public void addOrderDetail(@Param("ordernumber")String ordernumber,@Param("gIDX") int gIDX,@Param("goIDX") int goIDX,@Param("odQTY") int odQTY);

	public void subtractFromCart(@Param("gIDX")int gIDX,@Param("goIDX") int goIDX,@Param("mMID") String mMID);

	public void decreaseStock(@Param("gIDX")int gIDX,@Param("odQTY") int odQTY);

	public void increaseSales(@Param("gIDX")int gIDX,@Param("odQTY") int odQTY);

	public void addOrder(@Param("vo")OrderVo vo);

	public List<GoodsVo> mainGoodsListHot();

	public List<GoodsVo> mainGoodsListOnsale();


}
