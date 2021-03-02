package com.spring.cjs200809;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cjs200809.service.GoodsService;
import com.spring.cjs200809.vo.GoodsVo;

@Controller
public class HomeController {
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value = {"/","/h"}, method = RequestMethod.GET)
	public String home(Model model) {
		List<GoodsVo> newVos = goodsService.mainGoodsListNew();
		model.addAttribute("newVos",newVos);
		return "home";
	}
	
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {

		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
		  
		String fileName=upload.getOriginalFilename();
		  
	
	    Date date = new Date();
	    SimpleDateFormat imsi = new SimpleDateFormat("yyMMddHHmmssZ");
	    fileName = imsi.format(date)+"_"+fileName;
	    byte[] bytes = upload.getBytes();
		  
	
		String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/ckeditor/images/";
	    OutputStream outStr = new FileOutputStream(new File(uploadPath + fileName));
	
	    outStr.write(bytes);
	    
	    PrintWriter out=response.getWriter();
	    String fileUrl=request.getContextPath()+"/resources/ckeditor/images/"+fileName;
	
	    out.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	    
	    out.flush();
	    outStr.close();
	}
	
	
	
}
