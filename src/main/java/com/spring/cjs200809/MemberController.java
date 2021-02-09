package com.spring.cjs200809;


import org.springframework.beans.factory.annotation.Autowired;

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
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinGet() {
		return "member/join";
	}

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPost(MemberVo vo) {
		
	  	// 아이디 중복체크
	  	if(memberService.getIdCheck(vo.getMid()) != null) {
	  		msgFlag = "mInputNo";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	  	//닉네임 중복체크
	  	if(memberService.getemailCheck(vo.getEmail()) != null) {
	  		msgFlag = "mInputNo";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	  	
		memberService.memberJoin(vo);
		msgFlag = "memberJoinOk";
		return "redirect:/msg/"+msgFlag;
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGet() {
		return "member/login";
	}

	@RequestMapping(value="/find_id", method=RequestMethod.GET)
	public String find_idGet() {
		return "member/find_id";
	}
	
	@RequestMapping(value="/find_pwd", method=RequestMethod.GET)
	public String find_pwdGet() {
		return "member/find_pwd";
	}

	//아이디 중복확인(ajax)
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public String idCheckGet(String mid) {
	  	String res = "0";
	  	MemberVo vo = memberService.getIdCheck(mid);
	  	if(vo != null) res = "1";
	  	
	  	return res;
	}

	//이메일 중복확인
	@ResponseBody
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	public String emailCheckGet(String email) {
	  	String res = "0";
	  	MemberVo vo = memberService.getemailCheck(email);
	  	if(vo != null) res = "1";
	  	
	  	return res;
	}
	
}
