package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.FaqVo;

public interface FaqService {

	public List<FaqVo> listFaq(int startNo, int pageSize);

	public void writeFaq(FaqVo vo);

	public void deleteFaq(int fIDX);

	public List<FaqVo> listFaqCategory(String fCATEGORY, int startNo, int pageSize);

}
