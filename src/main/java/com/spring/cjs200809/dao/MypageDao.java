package com.spring.cjs200809.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.cjs200809.vo.WishlistVo;

public interface MypageDao {

	public List<WishlistVo> getMyWishlist(@Param("mMID") String mMID);

	public void wishDelete(@Param("wIDX") int wIDX);

}
