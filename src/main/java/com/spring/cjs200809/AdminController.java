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
import com.spring.cjs200809.service.AdminService;
import com.spring.cjs200809.service.InquiryService;
import com.spring.cjs200809.vo.CategoryVo;
import com.spring.cjs200809.vo.InquiryReplyVo;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.SubcategoryVo;


@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	InquiryService inquiryService;

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainAdminGet() {
		return "admin/main";
	}

	@RequestMapping(value="/inquiry", method=RequestMethod.GET)
	public String InquiryAdminGet(Model model,HttpServletRequest request) {
		String iREPLY = request.getParameter("iREPLY")==null? "전체":request.getParameter("iREPLY");
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		
		com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"inquiry",iREPLY);
		List<InquiryVo> vos = adminService.listInquiry(iREPLY,pageVo.getStartNo(),pageVo.getPageSize());
		int curScrNo = pageVo.getCurScrNo();
		
		model.addAttribute("iREPLY",iREPLY);
		model.addAttribute("curScrNo",curScrNo);
		model.addAttribute("p",pageVo);
		model.addAttribute("vos",vos);
		return "admin/inquiry";
	}
	
	@RequestMapping(value="/inquiryReply", method=RequestMethod.GET)
	public String inquiryReplyGet(int iIDX,Model model,HttpServletRequest request) {
		InquiryVo vo = inquiryService.viewInquiry(iIDX);
		String irCONTENT = inquiryService.viewInquiryReply(iIDX);
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		model.addAttribute("irCONTENT",irCONTENT);
		model.addAttribute("pag",pag);
		model.addAttribute("vo",vo);
		return "admin/inquiryReply";
	}
	
	@ResponseBody
	@RequestMapping(value="/writeInquiryReply", method=RequestMethod.GET)
	public String writeInquiryReplyGet(InquiryReplyVo vo) {
		//답변글 저장
		inquiryService.writeInquiryReply(vo);
		//답변 상태 변경
		inquiryService.updateReplyStmt(vo.getiIDX());
		return "1";
	}

	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String CategoryAdminGet(Model model) {
		List<CategoryVo> vos = adminService.getCategoryList();
		model.addAttribute("vos",vos);
		return "admin/category";
	}
	
	@ResponseBody
	@RequestMapping(value="/addCategory", method=RequestMethod.POST)
	public String AddCategoryPost(String cCODE,String cNAME) {
	  	String res = "";
		CategoryVo vo = adminService.CategoryCheck(cCODE);
	  	if(vo != null) {
	  		res = "0";
	  	} else {
	  		adminService.addCategory(cCODE,cNAME);
	  		res = "1";
	  	}
  		return res;
	}

	@RequestMapping(value="/subcategory", method=RequestMethod.GET)
	public String subcategoryAdminGet(Model model, String cCODE) {
		List<CategoryVo> cVos = adminService.getCategoryList();
		List<SubcategoryVo> scVos = adminService.getSubcategoryList(cCODE);
		String cNAME = adminService.getcNAME(cCODE);
		model.addAttribute("cVos",cVos);
		model.addAttribute("scVos",scVos);
		model.addAttribute("cCODE",cCODE);
		model.addAttribute("cNAME",cNAME);
		return "admin/subcategory";
	}

	@ResponseBody
	@RequestMapping(value="/addSubcategory", method=RequestMethod.POST)
	public String AddSubcategoryPost(String cCODE,String scCODE,String scNAME) {
	  	String res = "";
		SubcategoryVo vo = adminService.subcategoryCheck(cCODE,scCODE);
	  	if(vo != null) {
	  		res = "0";
	  	} else {
	  		adminService.addSubcategory(cCODE,scCODE,scNAME);
	  		res = "1";
	  	}
  		return res;
	}

	@ResponseBody
	@RequestMapping(value="/deleteCategory", method=RequestMethod.GET)
	public String deleteCategoryGet(String cCODE) {
		adminService.deleteCategory(cCODE);
		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteSubcategory", method=RequestMethod.GET)
	public String deleteSubcategoryGet(String cCODE,String scCODE) {
		adminService.deleteSubcategory(cCODE,scCODE);
		return "1";
	}
	
}
