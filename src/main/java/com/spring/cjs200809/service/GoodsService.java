package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.BoardVo;

public interface GoodsService {

	public List<BoardVo> goodsListNew(int startNo, int pageSize);

	public void addCart(String mMID, int gIDX, int cQTY, int goIDX);

	public void addWishlist(String mMID, int gIDX);

	public String checkWishlist(String mMID, int gIDX);

}
