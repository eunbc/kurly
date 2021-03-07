package com.spring.cjs200809;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.QnaService;
import com.spring.cjs200809.service.ReviewService;
import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.QnaVo;


@Controller
@RequestMapping("/review")
public class ReviewController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	ReviewService reviewService;

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeQnaGet(Model model,int gIDX) {
		model.addAttribute("gIDX",gIDX);
		return "review/write";
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeQnaPost(QnaVo vo) {
		
		msgFlag="writeQnaOK$gIDX="+vo.getgIDX();
		return "redirect:/msg/"+msgFlag;
	}

	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model,HttpServletRequest request) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int gIDX = Integer.parseInt(request.getParameter("gIDX"));
		String strgIDX = gIDX+"";
	
		//com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"qnaList",strgIDX);
		//List<QnaVo> qVos = qnaService.getQnaList(pageVo.getStartNo(),pageVo.getPageSize(),gIDX);
		//int curScrNo = pageVo.getCurScrNo();
		
		model.addAttribute("pag",pag);
		//model.addAttribute("p",pageVo);
		//model.addAttribute("qVos",qVos);
		//model.addAttribute("curScrNo",curScrNo);
		
		return "qna/list";
	}
	
}
