package com.spring.cjs200809.service;

import java.util.List;

import com.spring.cjs200809.vo.InquiryVo;

public interface AdminService {

	public List<InquiryVo> listInquiry(String iREPLY, int startNo, int pageSize);

}
