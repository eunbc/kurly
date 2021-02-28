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
import com.spring.cjs200809.service.MypageService;
import com.spring.cjs200809.vo.WishlistVo;


@Controller
@RequestMapping("/mypage")
public class MypageController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	MypageService mypageService;
	
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public String MypageOrderGet() {
		return "mypage/order";
	}

	@RequestMapping(value="/wishlist", method=RequestMethod.GET)
	public String MypageWishlistGet(HttpSession session, Model model) {
		String mMID = (String) session.getAttribute("smid");
		List<WishlistVo> vos = mypageService.getMyWishlist(mMID);
		model.addAttribute("vos",vos);
		return "mypage/wishlist";
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
	
}
