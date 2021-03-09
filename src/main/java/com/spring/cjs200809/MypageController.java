package com.spring.cjs200809;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.MemberService;
import com.spring.cjs200809.service.MypageService;
import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.EmoneyVo;
import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.OrderVo;
import com.spring.cjs200809.vo.ReviewVo;
import com.spring.cjs200809.vo.WishlistVo;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public String MypageOrderGet(Model model, HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		List<OrderVo> vos = mypageService.getMyOrder(mMID);

		int currentEmoney = memberService.getMyEmoney(mMID);
		model.addAttribute("currentEmoney",currentEmoney);
		int couponCnt = mypageService.AvailableCouponCnt(mMID);
		model.addAttribute("couponCnt",couponCnt);
		
		model.addAttribute("vos",vos);
		return "mypage/order";
	}

	@RequestMapping(value="/wishlist", method=RequestMethod.GET)
	public String MypageWishlistGet(HttpSession session, Model model) {
		String mMID = (String) session.getAttribute("smid");
		List<WishlistVo> vos = mypageService.getMyWishlist(mMID);
		model.addAttribute("vos",vos);
		
		int currentEmoney = memberService.getMyEmoney(mMID);
		model.addAttribute("currentEmoney",currentEmoney);
		int couponCnt = mypageService.AvailableCouponCnt(mMID);
		model.addAttribute("couponCnt",couponCnt);
		
		return "mypage/wishlist";
	}
	
	@RequestMapping(value="/coupon", method=RequestMethod.GET)
	public String MypageCouponGet(Model model, HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		List<CouponVo> vos = mypageService.getMyCouponList(mMID);
		model.addAttribute("vos",vos);
		int currentEmoney = memberService.getMyEmoney(mMID);
		model.addAttribute("currentEmoney",currentEmoney);
		int couponCnt = mypageService.AvailableCouponCnt(mMID);
		model.addAttribute("couponCnt",couponCnt);

		return "mypage/coupon";
	}

	@RequestMapping(value="/emoney", method=RequestMethod.GET)
	public String MypageEmoneyGet(Model model, HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		List<EmoneyVo> vos = mypageService.getMyEmoneyList(mMID);
		int currentEmoney = memberService.getMyEmoney(mMID);
		model.addAttribute("vos",vos);
		model.addAttribute("currentEmoney",currentEmoney);
		int couponCnt = mypageService.AvailableCouponCnt(mMID);
		model.addAttribute("couponCnt",couponCnt);
		
		return "mypage/emoney";
	}
	
	@RequestMapping(value="/review", method=RequestMethod.GET)
	public String MypageReviewGet(Model model, HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		List<ReviewVo> vos = mypageService.getMyReviewList(mMID);
		model.addAttribute("vos",vos);
		int currentEmoney = memberService.getMyEmoney(mMID);
		model.addAttribute("currentEmoney",currentEmoney);
		int couponCnt = mypageService.AvailableCouponCnt(mMID);
		model.addAttribute("couponCnt",couponCnt);

		return "mypage/review";
	}
	
	//선택 항목 일괄 삭제
	@ResponseBody
	@RequestMapping(value="/wishDelete", method=RequestMethod.POST)
	public int goodsDeletePost(HttpSession session,
		     @RequestParam(value = "chbox[]") List<String> chArr) {
		//세션이 끊길 때를 방지
		String mid = (String)session.getAttribute("smid");
		 
		int result = 0;
		int wIDX = 0;
		 
		if(mid != null) {
			for(String i : chArr) {   
				wIDX = Integer.parseInt(i);
				mypageService.wishDelete(wIDX);
			}   
			result = 1;
		}  
		return result;  
	}
	
	@RequestMapping(value="/orderDetail", method=RequestMethod.GET)
	public String MypageOrderGet(String oNVOICE,Model model,HttpSession session) {
		OrderVo oVo = mypageService.getMyOrderInfo(oNVOICE);
		String mMID = (String)session.getAttribute("smid");
		
		List<OrderDetailVo> vos = mypageService.getOrderDetails(oNVOICE);
		int currentEmoney = memberService.getMyEmoney(mMID);
		model.addAttribute("currentEmoney",currentEmoney);
		int couponCnt = mypageService.AvailableCouponCnt(mMID);
		model.addAttribute("couponCnt",couponCnt);
		model.addAttribute("vos",vos);
		model.addAttribute("oVo",oVo);
		return "mypage/orderDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/purchaseConfirm", method=RequestMethod.POST)
	public String purchaseConfirmPost(HttpSession session,int oIDX,int oAMOUNT) {
		String mMID = (String)session.getAttribute("smid");
		String slevel = (String)session.getAttribute("slevel"); 
		int emoney = 0;
		int percent = 0;
		
		if(mMID != null) {
			//주문 상태 변경
			mypageService.purchaseConfirm(oIDX);
			
			//적립금 적립
			switch (slevel) {
				case "일반":
					percent = 1;
					break;
				case "화이트":
					percent = 3;
					break;
				case "라벤더":
					percent = 5;
					break;
				case "퍼플":
					percent = 10;
					break;
				default:
					break;
			}
			System.out.println(percent);
			
			emoney = (int) Math.round(oAMOUNT * percent * 0.01); 
			mypageService.addEmoney(mMID, emoney, "구매확정 적립");
			memberService.addEmoneyMember(mMID, emoney);
		}  
		return "";  
	}
	
	@ResponseBody
	@RequestMapping(value="/cancelOrder", method=RequestMethod.POST)
	public String cancelOrderPost(HttpSession session,int oIDX) {
		String mid = (String)session.getAttribute("smid");
		 
		if(mid != null) {
			mypageService.cancelOrder(oIDX);
		}  
		return "";  
	}
	
}
