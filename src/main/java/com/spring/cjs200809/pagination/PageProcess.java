package com.spring.cjs200809.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.AdminDao;
import com.spring.cjs200809.dao.BoardDao;
import com.spring.cjs200809.dao.FaqDao;
import com.spring.cjs200809.dao.GoodsDao;
import com.spring.cjs200809.dao.QnaDao;

@Service
public class PageProcess {
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	FaqDao faqDao;
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	GoodsDao goodsDao;
	
	@Autowired
	QnaDao qnaDao;
	
	
	public PageVo pagination(int pag, int pageSize, String partFlag) {
		int totRecCnt = 0;
		int blockSize = 3;
		PageVo pageVo = new PageVo();
		
		if(partFlag.equals("board")) {
			totRecCnt = boardDao.bListTotRecCnt(); 
		} 
		else if(partFlag.equals("faq")) {
			totRecCnt = faqDao.fListTotRecCnt(); 
		} 
		else if(partFlag.equals("회원문의")) {
			totRecCnt = faqDao.fListTotRecCntCategory("회원문의"); 
		} 
		else if(partFlag.equals("주문/결제")) {
			totRecCnt = faqDao.fListTotRecCntCategory("주문/결제"); 
		} 
		else if(partFlag.equals("취소/교환/반품")) {
			totRecCnt = faqDao.fListTotRecCntCategory("취소/교환/반품"); 
		} 
		else if(partFlag.equals("배송문의")) {
			totRecCnt = faqDao.fListTotRecCntCategory("배송문의"); 
		} 
		else if(partFlag.equals("서비스 이용 및 기타")) {
			totRecCnt = faqDao.fListTotRecCntCategory("서비스 이용 및 기타"); 
		} 
		
		
		int totPage = (totRecCnt % pageSize)==0? totRecCnt/pageSize : (int) (totRecCnt/pageSize) +1;
		int startNo = (pag -1) * pageSize;
		int curScrNo = totRecCnt - startNo;
		
		pageVo.setPag(pag);
		pageVo.setPageSize(pageSize);
		pageVo.setBlockSize(blockSize);
		pageVo.setTotRecCnt(totRecCnt);
		pageVo.setTotPage(totPage);
		pageVo.setStartNo(startNo);
		pageVo.setCurScrNo(curScrNo);
		
		return pageVo;
	}

	public PageVo pagination(int pag, int pageSize, String partFlag, String partValue) {
		int totRecCnt = 0;
		int blockSize = 3;
		PageVo pageVo = new PageVo();
		
		if(partFlag.equals("board")) {
			totRecCnt = boardDao.bListTotRecCnt(); 
		} 
		else if(partFlag.equals("faq")) {
			totRecCnt = faqDao.fListTotRecCnt(); 
		} 
		else if(partFlag.equals("회원문의")) {
			totRecCnt = faqDao.fListTotRecCntCategory("회원문의"); 
		} 
		else if(partFlag.equals("주문/결제")) {
			totRecCnt = faqDao.fListTotRecCntCategory("주문/결제"); 
		} 
		else if(partFlag.equals("취소/교환/반품")) {
			totRecCnt = faqDao.fListTotRecCntCategory("취소/교환/반품"); 
		} 
		else if(partFlag.equals("배송문의")) {
			totRecCnt = faqDao.fListTotRecCntCategory("배송문의"); 
		} 
		else if(partFlag.equals("서비스 이용 및 기타")) {
			totRecCnt = faqDao.fListTotRecCntCategory("서비스 이용 및 기타"); 
		} 
		else if(partFlag.equals("inquiry")) {
			totRecCnt = adminDao.inquiryTotRecCnt(partValue); 
		} 
		else if(partFlag.equals("qna")) {
			totRecCnt = adminDao.qnaTotRecCnt(partValue); 
		} 
		else if(partFlag.equals("goods") && partValue != "") {
			totRecCnt = adminDao.goodsTotRecCnt(partValue.substring(0,3),partValue.substring(3)); 
		} 
		else if(partFlag.equals("goods") && partValue == "") {
			totRecCnt = adminDao.goodsTotRecCnt("",""); 
		} 
		else if(partFlag.equals("goodsList") && partValue == "new") {
			totRecCnt = goodsDao.goodsTotRecCnt();  
		} 
		else if(partFlag.equals("qnaList")) {
			totRecCnt = qnaDao.qnaTotRecCnt(partValue);  
		} 
		
		
		int totPage = (totRecCnt % pageSize)==0? totRecCnt/pageSize : (int) (totRecCnt/pageSize) +1;
		int startNo = (pag -1) * pageSize;
		int curScrNo = totRecCnt - startNo;
		
		pageVo.setPag(pag);
		pageVo.setPageSize(pageSize);
		pageVo.setBlockSize(blockSize);
		pageVo.setTotRecCnt(totRecCnt);
		pageVo.setTotPage(totPage);
		pageVo.setStartNo(startNo);
		pageVo.setCurScrNo(curScrNo);
		
		return pageVo;
	}

}
