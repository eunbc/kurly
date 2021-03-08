package com.spring.cjs200809;



import java.util.List;

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
import com.spring.cjs200809.service.MemberService;
import com.spring.cjs200809.service.MypageService;
import com.spring.cjs200809.service.ReviewService;
import com.spring.cjs200809.vo.InquiryReplyVo;
import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.QnaVo;
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
		//기존에 해당 상품을 구입한 이력이 있는지를 확인
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
	

	
}
