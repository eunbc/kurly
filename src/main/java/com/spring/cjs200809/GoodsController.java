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

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.pagination.PageVo;
import com.spring.cjs200809.service.AdminService;
import com.spring.cjs200809.service.GoodsService;
import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.CartVo;
import com.spring.cjs200809.vo.GoodsOptionVo;
import com.spring.cjs200809.vo.GoodsVo;


@Controller
@RequestMapping("/goods")
public class GoodsController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	AdminService adminService;

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeBoardGet() {
		return "admin/goods";
	}

	@RequestMapping(value="/goodsNew", method=RequestMethod.GET)
	public String goodsNewGet(Model model, HttpServletRequest request) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 9 : Integer.parseInt(request.getParameter("pageSize"));
		
		com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"goodsList","new");
		List<BoardVo> vos = goodsService.goodsListNew(pageVo.getStartNo(),pageVo.getPageSize());
		model.addAttribute("pag",pag);
		model.addAttribute("p",pageVo);
		model.addAttribute("vos",vos);
		return "shop/goods/goodsNew";
	}
	
	@RequestMapping(value="/goodsDetail", method=RequestMethod.GET)
	public String goodsDetailGet(int gIDX,Model model, HttpServletRequest request, PageVo pageVo) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		
		GoodsVo vo = adminService.getGoodsDetail(gIDX);
		List<GoodsOptionVo> goVos = adminService.getGoodsOption(gIDX);
		
		model.addAttribute("goVos",goVos);
		model.addAttribute("vo",vo);
		model.addAttribute("pag",pag);
		return "shop/goods/goodsDetail";
	}

	//장바구니에 추가(상품옵션번호 넣기)
	@ResponseBody
	@RequestMapping(value="/addCart", method=RequestMethod.POST)
	public String addCartPost(HttpSession session, int gIDX, int cQTY, int goIDX) {
		//세션이 끊길 때를 방지
		String mMID = (String)session.getAttribute("smid");
		 
		if(mMID != null) {
			goodsService.addCart(mMID,gIDX,cQTY,goIDX);
			return "1";
		} else {
			return "0";
		}
	}
	
	//장바구니에 추가(상품옵션번호 넣기)
	@ResponseBody
	@RequestMapping(value="/addCart2", method=RequestMethod.POST)
	public String addCart2Post(HttpSession session, 
			@RequestParam(value = "chbox[]") List<String> chArr, int cQTY, int goIDX) {
		//세션이 끊길 때를 방지
		String mMID = (String)session.getAttribute("smid");
		int gIDX = 0;
		 
		if(mMID != null) {
			for(String i : chArr) {   
				gIDX = Integer.parseInt(i);
				goodsService.addCart(mMID,gIDX,cQTY,goIDX);
			}   
			return "1";
		} else {
			return "0";
		}
	}

	//늘사는것에 추가
	@ResponseBody
	@RequestMapping(value="/addWishlist", method=RequestMethod.POST)
	public String addWishlistPost(HttpSession session, int gIDX) {
		//세션이 끊길 때를 방지
		String mMID = (String)session.getAttribute("smid");
		 
		if(mMID != null) {
			//중복 확인
			String checkRes = goodsService.checkWishlist(mMID,gIDX);
			if(checkRes != null) {
				return "2"; //이미 추가
			} else {
				goodsService.addWishlist(mMID,gIDX);
				return "1"; //새로 추가
			}
		} else {
			return "0"; //로그인 안된 상태
		}
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String viewMyCartGet(Model model,HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		List<CartVo> vos = goodsService.getMyCart(mMID);
		model.addAttribute("vos",vos);
		return "shop/cart/cart";
	}

	

}
