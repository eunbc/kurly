package com.spring.cjs200809;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.MypageService;


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

	@RequestMapping(value="/destination", method=RequestMethod.GET)
	public String MypageDestinationGet() {
		return "mypage/destination";
	}

	
}
