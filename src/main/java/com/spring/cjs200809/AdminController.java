package com.spring.cjs200809;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.AdminService;
import com.spring.cjs200809.service.InquiryService;
import com.spring.cjs200809.vo.CategoryVo;
import com.spring.cjs200809.vo.GoodsOptionVo;
import com.spring.cjs200809.vo.GoodsVo;
import com.spring.cjs200809.vo.InquiryReplyVo;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.QnaVo;
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
	
	@RequestMapping(value="/goods", method=RequestMethod.GET)
	public String addGoodsGet(Model model) {
		List<CategoryVo> cVos = adminService.getCategoryList();
		model.addAttribute("cVos",cVos);
		return "admin/goods";
	}

	//대분류 선택시 중분류 목록 가져오는 ajax
	@ResponseBody
	@RequestMapping(value="getSubcategory",method=RequestMethod.POST)
	public List<SubcategoryVo> getSubcategoryPost(String cCODE){
		List<SubcategoryVo> vos = adminService.getSubcategoryList(cCODE);
		return vos;
	}
	
	//상품 등록
	@RequestMapping(value="/goods", method=RequestMethod.POST)
	public String addGoodsPost(MultipartFile file, GoodsVo vo) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest(); 
		@SuppressWarnings("deprecation")
		String uploadPath = request.getRealPath("/resources/ckeditor/images/"); //ckeditor를 통해 서버에 저장되는 그림파일의 경로
		
		//실제 업로드하는 경로
		vo.setgDETAIL(vo.getgDETAIL().replace("/resources/ckeditor/images/", "/resources/ckeditor/images/src/"));
		
		//이미지를 발췌해서 'src'폴더로 복사처리
		adminService.imgCheck(vo.getgDETAIL(), uploadPath, 46);
		
		adminService.addGoods(file,vo);
		msgFlag = "addGoodsOK";
		return "redirect:/msg/"+msgFlag;
	}

	@RequestMapping(value="/goodsList", method=RequestMethod.GET)
	public String goodsListGet(Model model,HttpServletRequest request) {
		com.spring.cjs200809.pagination.PageVo pageVo;
		//대분류 불러오기
		List<CategoryVo> cVos = adminService.getCategoryList();
		model.addAttribute("cVos",cVos);

		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		
		//분류별 상품 목록 불러오기, 분류 선택 없으면 전체 불러오기
		String cCODE = request.getParameter("cCODE")==null? "" : request.getParameter("cCODE");
		String scCODE = request.getParameter("scCODE")==null? "" : request.getParameter("scCODE");
		
		//분류 선택 안했을때
		if((cCODE=="")&&(scCODE=="")) {
			pageVo = pageProcess.pagination(pag,pageSize,"goods","");
		}
		//분류 선택 했을때
		else {
			pageVo = pageProcess.pagination(pag,pageSize,"goods",cCODE.toString()+scCODE.toString());
			//본래 있던 대분류의 중분류 목록 불러오기
			List<SubcategoryVo> scVos = adminService.getSubcategoryList(cCODE);
			model.addAttribute("scVos",scVos);
		}
		List<GoodsVo> gVos = adminService.getGoodsByCategory(cCODE,scCODE,pageVo.getStartNo(),pageVo.getPageSize());
		model.addAttribute("pag",pag);
		model.addAttribute("p",pageVo);
		model.addAttribute("gVos",gVos);
		model.addAttribute("cCODE",cCODE);
		model.addAttribute("scCODE",scCODE);
		return "admin/goodsList";
	}
	
	@RequestMapping(value="/goodsDetail", method=RequestMethod.GET)
	public String goodsDetailGet(Model model,HttpServletRequest request) {
		int gIDX = Integer.parseInt(request.getParameter("gIDX"));
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));

		GoodsVo vo = adminService.getGoodsDetail(gIDX);
		model.addAttribute("vo",vo);
		model.addAttribute("pag",pag);
		return "admin/goodsDetail";
	}
	
	@RequestMapping(value="/goodsUpdate", method=RequestMethod.GET)
	public String goodsUpdateGet(Model model,HttpServletRequest request) {
		int gIDX = Integer.parseInt(request.getParameter("gIDX"));
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		List<CategoryVo> cVos = adminService.getCategoryList();
		
		//전체 내용 받기
		GoodsVo vo = adminService.getGoodsDetail(gIDX);
		//내용물중에 그림파일이 있다면 db수정 작업 전에 기존 src폴더에 들어있는 파일을 images폴더로 복사시킨다.
		String uploadPath = request.getRealPath("/resources/ckeditor/images/");
		adminService.imgBackup(vo.getgDETAIL(),uploadPath);
		
		//본래 있던 대분류의 중분류 목록 불러오기
		List<SubcategoryVo> scVos = adminService.getSubcategoryList(vo.getcCODE());
		model.addAttribute("scVos",scVos);
		model.addAttribute("cVos",cVos);
		model.addAttribute("vo",vo);
		model.addAttribute("pag",pag);
		return "admin/goodsUpdate";
	}

	@RequestMapping(value="/goodsUpdate", method=RequestMethod.POST)
	public String goodsUpdatePost(MultipartFile file,GoodsVo vo,HttpServletRequest request) {
		System.out.println("여기다@@@@@@@@@@ 여기 안와요 ㅠㅠㅠㅠㅠ 흑흑");
		//기존의 내용을 변경시켰고, content안에 'src'태그속성이 있다면 그림파일이 변경처리되어 있다고 가정하여, images방의 그림파일을 src폴더로 복사처리함
		if(!vo.getOriginalCONTENT().equals(vo.getgDETAIL()) && vo.getgDETAIL().indexOf("src=\"/") != -1) { //내용 수정, 그림이 있을 때 (그림 안바꾸어도 글자 하나만 바뀌면 새로 업로드함)
			//앞에서(수정처리를 위해 bUpdateGet메소드 수행후) 이미지의 위치가 src폴더에서 images로 복사된다.
			//따라서 db에 저장된 실제 그림의 경로도 변경시켜줘야 한다.
			vo.setgDETAIL(vo.getgDETAIL().replace("/resources/ckeditor/images/src/", "/resources/ckeditor/images/"));
			
			//현재 서버에 저장(위치: '/src/')되어 있는 이미지를 삭제처리한다.
			String uploadPath = request.getRealPath("/resources/ckeditor/images/src/");
			adminService.imgDelete(vo.getOriginalCONTENT(),uploadPath); //이미지 삭제처리
			
			//새롭게 업로드를 위한 이미지를 'src'폴더에 재등록한다.
			uploadPath = request.getRealPath("/resources/ckeditor/images/");
			adminService.imgCheck(vo.getgDETAIL(), uploadPath, 42); //content필드안의 그림파일들을 모두 src폴더로 복사
			vo.setgDETAIL(vo.getgDETAIL().replace("/resources/ckeditor/images/","/resources/ckeditor/images/src/"));
		}
		
		//잘 정비된 vo자료를 db에 update 시켜준다. 변경된 파일이 있다면 file로, 변경하지 않았다면 gIMAGE 로 온다.
		adminService.updateGoods(file,vo);
		
		int pag = Integer.parseInt(request.getParameter("pag"));
		msgFlag = "goodsUpdateOK$gIDX="+vo.getgIDX()+"&pag="+pag;
		return "redirect:/msg/"+msgFlag;

	}

	//상품 개별 삭제
	@RequestMapping(value="/goodsDelete", method=RequestMethod.GET)
	public String goodsDeleteGet(HttpServletRequest request) {
		int gIDX = Integer.parseInt(request.getParameter("gIDX"));
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		
		adminService.goodsDelete(gIDX);
		
  		msgFlag = "goodsDeleteOK$pag="+pag;
  		return "redirect:/location/" + msgFlag;
	}
	
	//선택 항목 일괄 삭제
	@ResponseBody
	@RequestMapping(value="/goodsDelete", method=RequestMethod.POST)
	public int goodsDeletePost(HttpSession session,
		     @RequestParam(value = "chbox[]") List<String> chArr) {
		//세션이 끊길 때를 방지
		String mid = (String)session.getAttribute("smid");
		 
		int result = 0;
		int gIDX = 0;
		 
		if(mid != null) {
			for(String i : chArr) {   
				gIDX = Integer.parseInt(i);
				adminService.goodsDelete(gIDX);
			}   
			result = 1;
		}  
		return result;  
	}
	
	@RequestMapping(value="/goodsOption", method=RequestMethod.GET)
	public String goodsOptionGet(Model model,int gIDX) {
		List<GoodsOptionVo> vos = adminService.getGoodsOption(gIDX);
		model.addAttribute("vos",vos);
		model.addAttribute("gIDX",gIDX);
		return "admin/goodsOption";
	}
	
	@ResponseBody
	@RequestMapping(value="/addGoodsOption", method=RequestMethod.POST)
	public String addGoodsOptionPost(GoodsOptionVo vo) {
		adminService.addGoodsOption(vo);
  		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteGoodsOption", method=RequestMethod.POST)
	public String deleteGoodsOptionPost(int goIDX) {
		adminService.deleteGoodsOption(goIDX);
  		return "";
	}
	
	@RequestMapping(value="/qna", method=RequestMethod.GET)
	public String QnaListAdminGet(Model model,HttpServletRequest request) {
		String qREPLY = request.getParameter("qREPLY")==null? "전체":request.getParameter("qREPLY");
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		
		com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"qna",qREPLY);
		List<QnaVo> vos = adminService.listQna(qREPLY,pageVo.getStartNo(),pageVo.getPageSize());
		int curScrNo = pageVo.getCurScrNo();
		
		model.addAttribute("qREPLY",qREPLY);
		model.addAttribute("curScrNo",curScrNo);
		model.addAttribute("p",pageVo);
		model.addAttribute("vos",vos);
		return "admin/inquiry";
	}
	

}
