package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.CartVo;

public interface GoodsDao {

	public List<BoardVo> goodsListNew(@Param("startNo")int startNo,@Param("pageSize") int pageSize);

	public int goodsTotRecCnt();

	public void addCart(@Param("mMID")String mMID,@Param("gIDX") int gIDX,@Param("cQTY") int cQTY,@Param("goIDX") int goIDX);

	public void addWishlist(@Param("mMID")String mMID,@Param("gIDX") int gIDX);

	public String checkWishlist(@Param("mMID")String mMID,@Param("gIDX") int gIDX);

	public List<CartVo> getMyCart(@Param("mMID") String mMID);

}
