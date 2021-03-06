package com.spring.cjs200809.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cjs200809.vo.InquiryReplyVo;
import com.spring.cjs200809.vo.InquiryVo;

public interface InquiryService {

	public void writeInquiry(MultipartHttpServletRequest file, InquiryVo vo);

	public List<InquiryVo> listInquiry(String mMID);

	public InquiryVo viewInquiry(int iIDX);

	public void writeInquiryReply(InquiryReplyVo vo);

	public String viewInquiryReply(int iIDX);

	public void updateReplyStmt(int iIDX);

}
