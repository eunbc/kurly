package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.AdminDao;
import com.spring.cjs200809.dao.MypageDao;
import com.spring.cjs200809.vo.WishlistVo;

@Service
public class MyPageServiceImp implements MypageService{
	@Autowired
	MypageDao mypageDao;

	@Override
	public List<WishlistVo> getMyWishlist(String mMID) {
		return mypageDao.getMyWishlist(mMID);
	}

	@Override
	public void wishDelete(int wIDX) {
		mypageDao.wishDelete(wIDX);
	}

	@Override
	public void addEmoney(String mMID, int ePLUS, String eCONTENT) {
		mypageDao.addEmoney(mMID,ePLUS,eCONTENT);
	}
	


}
