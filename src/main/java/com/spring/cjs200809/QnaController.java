package com.spring.cjs200809;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.QnaService;
import com.spring.cjs200809.vo.QnaVo;


@Controller
@RequestMapping("/qna")
public class QnaController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	QnaService qnaService;

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeQnaGet(Model model,int gIDX) {
		model.addAttribute("gIDX",gIDX);
		return "qna/write";
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeQnaPost(QnaVo vo) {
		//페이지랑 카테고리
		
		//1. 현재 상품에 해당하는 문의글의 기존 levelOrder를 가져옴
		String existLevelOrder = qnaService.maxLevelOrder(vo.getgIDX());
		int levelOrder = 0;
		//2. 문의글이 없다면 levelOrder는 0, 있다면 최대값에 +1 더하여 저장
		if(existLevelOrder != null) levelOrder = Integer.parseInt(existLevelOrder) + 1;
		vo.setqLEVELORDER(levelOrder);
		
		qnaService.writeQna(vo);
		msgFlag="writeQnaOK$gIDX="+vo.getgIDX();
		return "redirect:/msg/"+msgFlag;
	}
	
}
