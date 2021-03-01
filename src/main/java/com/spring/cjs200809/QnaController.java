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
		//페이지랑 카테고리, 상품 고유번호가져오기
		qnaService.writeQna(vo);
		msgFlag="writeQnaOK$gIDX="+vo.getgIDX();
		return "redirect:/msg/"+msgFlag;
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.GET) 
	public int fDeleteGet(HttpServletRequest request,int fIDX,int pag,String fCATEGORY) {
		//qnaService.deleteFaq(fIDX);
		return 1;
	}
	
}
