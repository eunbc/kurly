package com.spring.cjs200809;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
import com.spring.cjs200809.service.MemberService;
import com.spring.cjs200809.service.MypageService;
import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.CartVo;
import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.GoodsOptionVo;
import com.spring.cjs200809.vo.GoodsVo;
import com.spring.cjs200809.vo.MemberVo;
import com.spring.cjs200809.vo.OrderVo;
import com.spring.cjs200809.vo.SubcategoryVo;


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
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MypageService mypageService;

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeBoardGet() {
		return "admin/goods";
	}

	@RequestMapping(value="/goodsSearch", method=RequestMethod.GET)
	public String goodsSearchGet(Model model, HttpServletRequest request) {
		String strSearch = request.getParameter("strSearch")==null? "" : request.getParameter("strSearch");
		
		List<GoodsVo> vos = goodsService.goodsSearch(strSearch);
		int cntSearch = goodsService.goodsSearchCnt(strSearch);
		
		model.addAttribute("strSearch",strSearch);
		model.addAttribute("cntSearch",cntSearch);
		model.addAttribute("vos",vos);
		return "shop/goods/goodsSearch";
	}
	
	@RequestMapping(value="/goodsNew", method=RequestMethod.GET)
	public String goodsNewGet(Model model, HttpServletRequest request) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 9 : Integer.parseInt(request.getParameter("pageSize"));
		
		com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"goodsList","new");
		List<GoodsVo> vos = goodsService.goodsListNew(pageVo.getStartNo(),pageVo.getPageSize());
		model.addAttribute("pag",pag);
		model.addAttribute("p",pageVo);
		model.addAttribute("vos",vos);
		return "shop/goods/goodsNew";
	}

	@RequestMapping(value="/goodsBest", method=RequestMethod.GET)
	public String goodsBestGet(Model model, HttpServletRequest request) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 9 : Integer.parseInt(request.getParameter("pageSize"));
		
		com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"goodsList","new");
		List<GoodsVo> vos = goodsService.goodsListBest(pageVo.getStartNo(),pageVo.getPageSize());
		model.addAttribute("pag",pag);
		model.addAttribute("p",pageVo);
		model.addAttribute("vos",vos);
		return "shop/goods/goodsBest";
	}

	@RequestMapping(value="/goodsOnsale", method=RequestMethod.GET)
	public String goodsOnsaleGet(Model model, HttpServletRequest request) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 9 : Integer.parseInt(request.getParameter("pageSize"));
		
		com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"goodsList","new");
		List<GoodsVo> vos = goodsService.goodsListOnsale(pageVo.getStartNo(),pageVo.getPageSize());
		model.addAttribute("pag",pag);
		model.addAttribute("p",pageVo);
		model.addAttribute("vos",vos);
		return "shop/goods/goodsOnsale";
	}
	
	@RequestMapping(value="/goodsList", method=RequestMethod.GET)
	public String goodsListGet(Model model, HttpServletRequest request) {
		com.spring.cjs200809.pagination.PageVo pageVo;
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 9 : Integer.parseInt(request.getParameter("pageSize"));
		String cCODE = request.getParameter("cCODE")==null? "" : request.getParameter("cCODE");
		String scCODE = request.getParameter("scCODE")==null? "" : request.getParameter("scCODE");
		
		//대분류 하위 중분류 불러오기
		List<SubcategoryVo> scVos = adminService.getSubcategoryList(cCODE);
		model.addAttribute("scVos",scVos);
		String cNAME = adminService.getcNAME(cCODE);
		
		//대분류 선택시 
		if(cCODE!=""&&scCODE=="") {
			pageVo = pageProcess.pagination(pag,pageSize,"goods",cCODE);
		}
		//대분류&중분류 선택시
		else {
			pageVo = pageProcess.pagination(pag,pageSize,"goods",cCODE.toString()+scCODE.toString());
		}		

		List<GoodsVo> vos = adminService.getGoodsByCategory(cCODE,scCODE,pageVo.getStartNo(),pageVo.getPageSize());
		
		model.addAttribute("p",pageVo);
		model.addAttribute("cNAME",cNAME);
		model.addAttribute("cCODE",cCODE);
		model.addAttribute("scCODE",scCODE);
		model.addAttribute("vos",vos);
		model.addAttribute("pag",pag);
		return "shop/goods/goodsList";
	}
	
	@RequestMapping(value="/goodsDetail", method=RequestMethod.GET)
	public String goodsDetailGet(int gIDX,Model model, HttpServletRequest request, PageVo pageVo) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int curScrNo = pageVo.getCurScrNo();
		
		model.addAttribute("p",pageVo);
		model.addAttribute("curScrNo",curScrNo);
		
		GoodsVo vo = adminService.getGoodsDetail(gIDX);
		List<GoodsOptionVo> goVos = adminService.getGoodsOption(gIDX);
		model.addAttribute("goVos",goVos);
		model.addAttribute("vo",vo);
		model.addAttribute("pag",pag);
		return "shop/goods/goodsDetail";
	}

	//System.out.println(cart);
	//장바구니에 상품 추가
	@ResponseBody
	@RequestMapping(value="/addtoCart", method=RequestMethod.POST)
	public String addtoCartPost(@RequestParam String cart,int gIDX,HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		String result = "";
		
		if (mMID!=null) {
			try {
				JSONParser jsonParse = new JSONParser();
				JSONArray itemArray = (JSONArray) jsonParse.parse(cart);
				
				for(int i=0; i<itemArray.size(); i++) {
					JSONObject itemObject = (JSONObject) itemArray.get(i);
					int cQTY = Integer.parseInt(String.valueOf(itemObject.get("cQTY")));
					int goIDX = Integer.parseInt(String.valueOf(itemObject.get("goIDX")));
					
					//이미 존재하는 상품이라면, 수량만 증가하도록
					if(goodsService.checkMyCart(mMID,gIDX,goIDX)>0) {
						goodsService.updateMyCart(mMID,gIDX,goIDX,cQTY);
						result = "2";
					} else {
						//장바구니에 추가
						goodsService.addCart(mMID, gIDX, cQTY, goIDX);
						
						//장바구니 세션값 변경
						int scart = memberService.getMyCartNumber(mMID);
						session.setAttribute("scart", scart);
						result = "1";
					}
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			result = "0";
		}
		return result;
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
		String mADDRESS = memberService.getMyAddress(mMID);
		
		model.addAttribute("vos",vos);
		model.addAttribute("mADDRESS",mADDRESS);
		return "shop/cart/cart";
	}
	
	//선택 항목 일괄 삭제
	@ResponseBody
	@RequestMapping(value="/cartDelete", method=RequestMethod.POST)
	public int cartDeletePost(HttpSession session,
		     @RequestParam(value = "chbox[]") List<String> chArr) {
		//세션이 끊길 때를 방지
		String mid = (String)session.getAttribute("smid");
		 
		int result = 0;
		int cIDX = 0;
		 
		if(mid != null) {
			for(String i : chArr) {   
				cIDX = Integer.parseInt(i);
				goodsService.cartDelete(cIDX);
			}   
			//장바구니 세션값 변경
			int scart = memberService.getMyCartNumber(mid);
			session.setAttribute("scart", scart);
			result = 1;
		}  
		return result;  
	}
	
	@RequestMapping(value="/orderForm", method=RequestMethod.GET)
	public String orderFormGet(Model model,HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		MemberVo mVo = memberService.IdCheck(mMID);
		List<CouponVo> cpVos = memberService.getMyCouponList(mMID);
		
		model.addAttribute("cpVos",cpVos);
		model.addAttribute("mVo",mVo);
		return "shop/order/orderForm";
	}
	
	//주문 테이블에 추가
	@RequestMapping(value="/orderForm", method=RequestMethod.POST)
	public String orderFormPost(HttpSession session, OrderVo vo) {
		String mMID = (String) session.getAttribute("smid");
		String toMail="";
		String content="";
		if (mMID!=null) {
			//적립금 삭감
			if(vo.getoEMONEY()!=0) {
				memberService.subtractEmoney(mMID,vo.getoEMONEY());
				mypageService.subtractEmoney(mMID, vo.getoEMONEY(), "상품구매시 적립금 사용");
			}
			//쿠폰 사용처리
			if(vo.getCpIDX()!=0) {
				memberService.useCoupon(mMID,vo.getCpIDX());
			}
			//주문 테이블에 추가
			goodsService.addOrder(vo);
	
			//메일 보내기
			toMail = memberService.getMyEmailAddress(mMID);
			content = vo.getoNVOICE();
			return "redirect:/mail/orderCompleted/"+toMail+"/"+content+"/"; 
		} else {
			msgFlag="NeedtoLogin";
			return "redirect:/msg/"+msgFlag;
		}
	}	
	
	//System.out.println(order);
	//주문 상세 목록에 추가
	@ResponseBody
	@RequestMapping(value="/addtoOrderDetail", method=RequestMethod.POST)
	public String addtoOrderPost(@RequestParam String order,String ordernumber,HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		String result = "";
		
		if (mMID!=null) {
			try {
				JSONParser jsonParse = new JSONParser();
				JSONArray itemArray = (JSONArray) jsonParse.parse(order);
				
				for(int i=0; i<itemArray.size(); i++) {
					JSONObject itemObject = (JSONObject) itemArray.get(i);
					int gIDX = Integer.parseInt(String.valueOf(itemObject.get("gIDX")));
					int goIDX = Integer.parseInt(String.valueOf(itemObject.get("goIDX")));
					int odQTY = Integer.parseInt(String.valueOf(itemObject.get("odQTY")));
					
					//주문 상세 리스트 생성
					goodsService.addOrderDetail(ordernumber,gIDX,goIDX,odQTY);
					//장바구니 목록에서 삭제
					goodsService.subtractFromCart(gIDX,goIDX,mMID);
					//상품 재고 감소,판매량 증가시키기
					goodsService.decreaseStock(gIDX,odQTY);
					goodsService.increaseSales(gIDX,odQTY);
				}	
			//장바구니 세션값 변경
			int scart = memberService.getMyCartNumber(mMID);
			session.setAttribute("scart", scart);

			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			result = "0";
		} 
		return result; 
	}	

	@RequestMapping(value="/orderCompleted", method=RequestMethod.GET)
	public String orderCompletedGet(String oNVOICE,Model model,HttpSession session) {
		String mMID = (String) session.getAttribute("smid");
		if(mMID!=null) {
			model.addAttribute("oNVOICE",oNVOICE);
		}
		return "shop/order/orderCompleted";
	}


	
}
