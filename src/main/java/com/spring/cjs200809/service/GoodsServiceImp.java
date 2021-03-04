package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.GoodsDao;
import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.CartVo;
import com.spring.cjs200809.vo.GoodsVo;

@Service
public class GoodsServiceImp implements GoodsService{
	@Autowired
	GoodsDao goodsDao;

	@Override
	public List<BoardVo> goodsListNew(int startNo, int pageSize) {
		return goodsDao.goodsListNew(startNo,pageSize);
	}

	@Override
	public void addCart(String mMID, int gIDX, int cQTY, int goIDX) {
		goodsDao.addCart(mMID,gIDX,cQTY,goIDX);
	}

	@Override
	public void addWishlist(String mMID, int gIDX) {
		goodsDao.addWishlist(mMID,gIDX);
	}

	@Override
	public String checkWishlist(String mMID, int gIDX) {
		return goodsDao.checkWishlist(mMID,gIDX);
	}

	@Override
	public List<CartVo> getMyCart(String mMID) {
		return goodsDao.getMyCart(mMID);
	}

	@Override
	public List<GoodsVo> mainGoodsListNew() {
		return goodsDao.mainGoodsListNew();
	}

	@Override
	public int checkMyCart(String mMID, int gIDX, int goIDX) {
		return goodsDao.checkMyCart(mMID,gIDX,goIDX);
	}

	@Override
	public void updateMyCart(String mMID, int gIDX, int goIDX, int cQTY) {
		goodsDao.updateMyCart(mMID,gIDX,goIDX,cQTY);
	}

	@Override
	public void cartDelete(int cIDX) {
		goodsDao.cartDelete(cIDX);
	}

	


}
