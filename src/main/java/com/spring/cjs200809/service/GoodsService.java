package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.CartVo;
import com.spring.cjs200809.vo.GoodsVo;
import com.spring.cjs200809.vo.OrderVo;

public interface GoodsService {

	public List<GoodsVo> goodsListNew(int startNo, int pageSize);

	public List<GoodsVo> goodsListBest(int startNo, int pageSize);
	
	public List<GoodsVo> goodsListOnsale(int startNo, int pageSize);

	public void addCart(String mMID, int gIDX, int cQTY, int goIDX);

	public void addWishlist(String mMID, int gIDX);

	public String checkWishlist(String mMID, int gIDX);

	public List<CartVo> getMyCart(String mMID);

	public List<GoodsVo> mainGoodsListNew();

	public int checkMyCart(String mMID, int gIDX, int goIDX);

	public void updateMyCart(String mMID, int gIDX, int goIDX, int cQTY);

	public void cartDelete(int cIDX);

	public void addOrderDetail(String ordernumber, int gIDX, int goIDX, int odQTY);

	public void subtractFromCart(int gIDX, int goIDX, String mMID);

	public void decreaseStock(int gIDX, int odQTY);

	public void increaseSales(int gIDX, int odQTY);

	public void addOrder(OrderVo vo);

	public List<GoodsVo> mainGoodsListHot();

	public List<GoodsVo> mainGoodsListOnsale();

	public List<GoodsVo> goodsSearch(String strSearch);

	public int goodsSearchCnt(String strSearch);


}
