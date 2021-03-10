package com.spring.cjs200809;



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

import com.spring.cjs200809.dao.ReviewDao;
import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.MemberService;
import com.spring.cjs200809.service.MypageService;
import com.spring.cjs200809.service.ReviewService;
import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.ReviewVo;


@Controller
@RequestMapping("/review")
public class ReviewController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	ReviewService reviewService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeReviewGet(Model model,int gIDX,HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		//기존에 해당 상품을 구입한 이력이 있는지를 확인 --같은 상품을 구매했을 경우 다수의 vo가 넘어옴
		OrderDetailVo vo = reviewService.checkMyOrderforReview(gIDX,mMID);
		
		if(vo!=null) {
			String oNVOICE = vo.getoNVOICE();
			model.addAttribute("oNVOICE",oNVOICE);
			model.addAttribute("gIDX",gIDX);
			return "review/write";
		}else {
			msgFlag="deniedByEmptyOrder$gIDX="+gIDX;
			return "redirect:/msg/"+msgFlag; 
		}
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeReviewPost(MultipartHttpServletRequest file,ReviewVo vo,HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		reviewService.writeReview(file,vo);
		
		//적립금지금
		memberService.addEmoneyMember(mMID, 100);
		mypageService.addEmoney(mMID, 100, "후기 작성 적립금 지급");
		
		//주문 상세 내역의 리뷰 작성여부 컬럼을 N에서 Y로 바꿈
		reviewService.changeReviewStatus(vo.getgIDX(),vo.getoNVOICE());
		msgFlag="writeReviewOK";
		return "redirect:/msg/"+msgFlag; 
	}

	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model,HttpServletRequest request) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int gIDX = Integer.parseInt(request.getParameter("gIDX"));
		String strgIDX = gIDX+"";
	
		com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"reviewList",strgIDX);
		List<ReviewVo> rVos = reviewService.getReviewList(pageVo.getStartNo(),pageVo.getPageSize(),gIDX);
		int curScrNo = pageVo.getCurScrNo();
		
		model.addAttribute("gIDX",gIDX);
		model.addAttribute("pag",pag);
		model.addAttribute("p",pageVo);
		model.addAttribute("rVos",rVos);
		model.addAttribute("curScrNo",curScrNo);
		
		return "review/list";
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String viewReviewGet(int rIDX,Model model) {
		ReviewVo vo = reviewService.viewReview(rIDX);
		model.addAttribute("vo",vo);
		return "review/view";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/addReviewViewCnt", method=RequestMethod.POST)
	public String addReviewViewCntPost(int rIDX) {
		reviewService.addReviewViewCnt(rIDX);
		return "";
	}

	@ResponseBody
	@RequestMapping(value="/addHelpCnt", method=RequestMethod.POST)
	public String addHelpCntPost(HttpSession session, int rIDX) {
		String mMID = (String) session.getAttribute("smid");
		String res ="";
		if(mMID!=null) {
			reviewService.addHelpCnt(rIDX);
			res = "1";
		} else {
			res = "0";
		}
		return res;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteReviewGet(int rIDX) {
		reviewService.deleteReview(rIDX);
		
		msgFlag="deleteReviewOK";
		return "redirect:/msg/"+msgFlag; 
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateReviewGet(Model model,int rIDX) {
		ReviewVo vo = reviewService.viewReview(rIDX);
		
		model.addAttribute("vo",vo);
		return "redirect:/msg/"+msgFlag; 
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	public void deleteFileGet(HttpServletRequest request) {
		
/*		int rIDX = Integer.parseInt(request.getParameter("rIDX"));
		String fnames = request.getParameter("fnames");    // vo.fname에서 받아옴(업로드 파일명들)
		String rfnames = request.getParameter("rfnames");  // vo.rfname에서 받아옴(실제 서버에 저장된 파일명들)
		String fname = request.getParameter("fname");
		String rfname = request.getParameter("rfname");
		
		
		// 파일 삭제처리 루틴
		ServletContext application = request.getServletContext();
		String directory = application.getRealPath("/data/pds/");
		new File(directory + rfname).delete();  // 선택한 파일을 서버에서 삭제처리한다.
		
		// DB에서 삭제한 파일 정보를 다시 지워준다.(fnames, rfnames)
		ReviewVo vo = new ReviewVo();
		vo.setrIDX(rIDX);
		vo.setrFNAME(fnames.substring(0, fnames.lastIndexOf(fname+"/"))+fnames.substring(fnames.lastIndexOf(fname+"/")+(fname.length()+1)));
		vo.setrRFNAME(rfnames.replace(rfname+"/", ""));
		
		response.getWriter().write(updFileDel(vo));
		
		// 삭제된 파일의 정보를 DB에서 제거(Update)시키는 작업처리
		private String updFileDel(ReviewVo vo) {
			ReviewDao dao = new ReviewDao();
			dao.updFileDel(vo);
			return vo.getFname();
		}	
		model.addAttribute("vo",vo);
		return "redirect:/msg/"+msgFlag; 
	*/
	}
}
