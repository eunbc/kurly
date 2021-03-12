package com.spring.cjs200809;



import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.InquiryService;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.ReviewVo;


@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	InquiryService inquiryService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model,HttpServletRequest request,HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		List<InquiryVo> vos = inquiryService.listInquiry(mMID);
		model.addAttribute("vos",vos);
		return "inquiry/list";
	}

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeInquiryGet(Model model, String oNVOICE) {
		model.addAttribute("oNVOICE",oNVOICE);
		return "inquiry/write";
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeInquiryPost(MultipartHttpServletRequest file,InquiryVo vo) {
		inquiryService.writeInquiry(file,vo);
		msgFlag="writeInquiryOK";
		return "redirect:/msg/"+msgFlag;
	}

	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String viewInquiryGet(int iIDX,Model model) {
		InquiryVo vo = inquiryService.viewInquiry(iIDX);
		String irCONTENT = inquiryService.viewInquiryReply(iIDX);
		model.addAttribute("irCONTENT",irCONTENT);
		model.addAttribute("vo",vo);
		return "inquiry/view";
	}
	
}
