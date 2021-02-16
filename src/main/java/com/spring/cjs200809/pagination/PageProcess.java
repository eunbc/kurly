package com.spring.cjs200809.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.BoardDao;
import com.spring.cjs200809.dao.FaqDao;

@Service
public class PageProcess {
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	FaqDao faqDao;
	
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

}
