package com.spring.cjs200809.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.BoardDao;

@Service
public class PageProcess {
	@Autowired
	BoardDao boardDao;
	
	public PageVo pagination(int pag, int pageSize, String partFlag) {
		int totRecCnt = 0;
		int blockSize = 3;
		PageVo pageVo = new PageVo();
		
		if(partFlag.equals("board")) {
			totRecCnt = boardDao.bListTotRecCnt(); 
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
	
	public PageVo pagination2(int pag, String partFlag) {
		int totRecCnt = 0;
		int blockSize = 3;
		int pageSize = 10;
		PageVo pageVo = new PageVo();
		
		if(partFlag.equals("board")) {
			totRecCnt = boardDao.bListTotRecCnt(); 
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
