package com.spring.cjs200809;



import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.pagination.PageVo;
import com.spring.cjs200809.service.BoardService;
import com.spring.cjs200809.service.FaqService;
import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.FaqVo;


@Controller
@RequestMapping("/faq")
public class FaqController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	FaqService faqService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model,HttpServletRequest request) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		String fCATEGORY = request.getParameter("fCATEGORY")==null? "":request.getParameter("fCATEGORY");
		
		List<FaqVo> vos;
		PageVo pageVo;
		if(fCATEGORY=="") {
			pageVo = pageProcess.pagination(pag,pageSize,"faq");
			vos = faqService.listFaq(pageVo.getStartNo(),pageVo.getPageSize());
		}else {
			pageVo = pageProcess.pagination(pag,pageSize,fCATEGORY);
			vos = faqService.listFaqCategory(fCATEGORY,pageVo.getStartNo(),pageVo.getPageSize());
		}
		int curScrNo = pageVo.getCurScrNo();
		
		model.addAttribute("p",pageVo);
		model.addAttribute("vos",vos);
		model.addAttribute("curScrNo",curScrNo);
		model.addAttribute("fCATEGORY",fCATEGORY);
		
		return "faq/list";
	}

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeBoardGet() {
		return "faq/write";
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeBoardPost(FaqVo vo) {
		faqService.writeFaq(vo);
		msgFlag="writeFaqOK";
		return "redirect:/location/"+msgFlag;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET) 
	public String bDeleteGet(HttpServletRequest request,int fIDX,int pag) {
		faqService.deleteFaq(fIDX);
		msgFlag = "deleteFaqOK$pag="+pag;
		return "redirect:/msg/"+msgFlag;
	}
	
}
