package com.spring.cjs200809;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.cjs200809.service.MemberService;
import com.spring.cjs200809.vo.MemberVo;


@Controller
@RequestMapping("/member")
public class MemberController {
	String msgFlag;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinGet() {
		return "member/join";
	}

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPost(MemberVo vo) {
	  	// 아이디 중복체크
	  	if(memberService.IdCheck(vo.getMMID()) != null) {
	  		msgFlag = "idCheckNO";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	  	//이메일 중복체크
	  	if(memberService.EmailCheck(vo.getMEMAIL()) != null) {
	  		msgFlag = "emailCheckNO";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	  	vo.setMPWD(bCryptPasswordEncoder.encode(vo.getMPWD()));
		memberService.memberJoin(vo);
		msgFlag = "memberJoinOK";
		return "redirect:/msg/"+msgFlag;
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGet() {
		return "member/login";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPost() {
		msgFlag = "memberJoiOK";
		return "redirect:/msg/"+msgFlag;
	}

	@RequestMapping(value="/find_id", method=RequestMethod.GET)
	public String find_idGet() {
		return "member/find_id";
	}
	
	@RequestMapping(value="/find_pwd", method=RequestMethod.GET)
	public String find_pwdGet() {
		return "member/find_pwd";
	}

	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public String idCheckGet(String mMID) {
	  	String res = "0";
	  	MemberVo vo = memberService.IdCheck(mMID);
	  	if(vo != null) res = "1";
	  	
	  	return res;
	}

	@ResponseBody
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	public String emailCheckGet(String mEMAIL) {
	  	String res = "0";
	  	MemberVo vo = memberService.EmailCheck(mEMAIL);
	  	if(vo != null) res = "1";
	  	
	  	return res;
	}
	
}
