package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.WishlistVo;

public interface MypageService {

	public List<WishlistVo> getMyWishlist(String mMID);

	public void wishDelete(int wIDX);

}
