package com.spring.cjs200809;


import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cjs200809.service.MemberService;
import com.spring.cjs200809.vo.MailVo;
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
	  	//아이디 중복체크
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
	public String loginGet(HttpServletRequest request, Model model) {
    	//아이디 기억하기
	    Cookie[] cookies = request.getCookies(); 
    	for(int i=0; i<cookies.length; i++) {
    		String str = cookies[i].getName();
    		if(str.equals("cmid")) {
    			model.addAttribute("cmid",cookies[i].getValue());
    			break;
    		}
    	} 		
		return "member/login";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPost(String mMID, String mPWD, HttpSession session,
    		HttpServletResponse response, String rememberId) {
	  	MemberVo vo = memberService.IdCheck(mMID);
	  	//로그인시 세션생성
	  	if(vo != null && bCryptPasswordEncoder.matches(mPWD, vo.getMPWD())) {
	  		session.setAttribute("smid" , mMID);
	  		session.setAttribute("sname", vo.getMNAME());
	  		session.setAttribute("slevel", vo.getMLEVEL());
	  		
	  		//아이디 기억하기 체크시 쿠키생성
	  		if(rememberId.equals("YES")) {
	  			Cookie cookie = new Cookie("cmid",mMID);
	  			cookie.setMaxAge(60*60*24);
	  			response.addCookie(cookie);
	  		}
			/*
			 * else if(rememberId.equals("NO")) { System.out.println("나는 아이디 기억 안하겠다"); }
			 */
	  		msgFlag = "loginOK";
	  		return "redirect:/location/" + msgFlag;
	  	}
	  	else {
	  		msgFlag = "loginNO";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	}
    
	@RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logoutGet() {
	    msgFlag = "logoutOK";
	    return "redirect:/msg/"+msgFlag;
    }
	
	@RequestMapping(value="/find_id", method=RequestMethod.GET)
	public String find_idGet() {
		return "member/find_id";
	}

	@RequestMapping(value="/find_id", method=RequestMethod.POST)
    public String find_idPost(String mNAME,String mEMAIL,Model model) {
	  	MemberVo vo = memberService.findId(mNAME,mEMAIL);
	 	 
	  	if(vo!=null) {
	  		String id_found = vo.getMMID().substring(0,vo.getMMID().length()-3)+"***";
	  		model.addAttribute("id_found",id_found);
	  		model.addAttribute("mNAME",mNAME);
	  		return "member/id_found";
	  	} 
	  	else {
	  		msgFlag = "find_idNO";
	  		return "redirect:/msg/"+msgFlag;
	  	}
    }
	
	
	@RequestMapping(value="/find_pwd", method=RequestMethod.GET)
	public String find_pwdGet() {
		return "member/find_pwd";
	}
	
	@RequestMapping(value="/find_pwd", method=RequestMethod.POST)
	public String mPwdSearchPost(String mNAME, String mMID, String mEMAIL) {
		String pwd = "";
		
		MemberVo vo = memberService.findPwd(mNAME,mMID,mEMAIL);
		
		if(vo != null) {
			//임시비밀번호를 발급한다
			UUID uid = UUID.randomUUID();
			pwd = uid.toString().substring(0,6);
			memberService.TempPwdChange(mMID, bCryptPasswordEncoder.encode(pwd)); //암호화 시킨 비밀번호를 저장
			String toMail = mEMAIL;
			String content = pwd;
			return "redirect:/mail/pwdConfirmMailForm/"+toMail+"/"+content+"/"; 
		}
		else {
			msgFlag = "find_pwdNO";
			return "redirect:/msg/"+msgFlag;
		}
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
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateGet(HttpSession session, Model model) {
		String mMID = (String)session.getAttribute("smid");
		//MemberVo vo = memberService.getMemberInfo(mMID);
		//model.addAttribute("vo",vo);
		return "mypage/pwdCheck";
	}

	
	
	
}
