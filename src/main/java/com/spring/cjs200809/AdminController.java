package com.spring.cjs200809;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	AdminService adminService;

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainAdminGet() {
		return "admin/main";
	}


}
