package com.spring.cjs200809;



import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.pagination.PageVo;
import com.spring.cjs200809.service.BoardService;
import com.spring.cjs200809.service.FaqService;
import com.spring.cjs200809.vo.BoardVo;
import com.spring.cjs200809.vo.FaqVo;


@Controller
@RequestMapping("/goods")
public class GoodsController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	//GoodsService goodsService;

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeBoardGet() {
		return "admin/goods";
	}

}
