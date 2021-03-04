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

import com.spring.cjs200809.service.MemberService;
import com.spring.cjs200809.service.MypageService;
import com.spring.cjs200809.vo.MemberVo;


@Controller
@RequestMapping("/member")
public class MemberController {
	String msgFlag;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinGet() {
		return "member/join";
	}

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPost(MemberVo vo, String recommendId) {

		//아이디 체크해서 존재하는 아이디라면, 적립금 지급하기
		if(memberService.IdCheck(recommendId)!=null) {
			//적립금 지급 내역 추가
			mypageService.addEmoney(vo.getmMID(),5000,"추천인 아이디 적립");
			mypageService.addEmoney(recommendId,5000,"추천인 아이디 적립");
			
			//회원 테이블에서 적립급 컬럼 변경
			memberService.addEmoneyMember(vo.getmMID(),5000);
			memberService.addEmoneyMember(recommendId,5000);
		}
		
		//아이디 중복체크
	  	if(memberService.IdCheck(vo.getmMID()) != null) {
	  		msgFlag = "idCheckNO";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	  	//이메일 중복체크
	  	if(memberService.EmailCheck(vo.getmEMAIL()) != null) {
	  		msgFlag = "emailCheckNO";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	  	vo.setmPWD(bCryptPasswordEncoder.encode(vo.getmPWD()));
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
	public String loginPost(String mMID, String mPWD, String rememberId, HttpSession session,
    		HttpServletResponse response,HttpServletRequest request) {

		MemberVo vo = memberService.IdCheck(mMID);
	  	//로그인시 세션생성
	  	if(vo != null && bCryptPasswordEncoder.matches(mPWD, vo.getmPWD())) {
	  		session.setAttribute("smid" , mMID);
	  		session.setAttribute("sname", vo.getmNAME());
	  		session.setAttribute("slevel", vo.getmLEVEL());
	  		int scart = memberService.getMyCartNumber(mMID);
	  		session.setAttribute("scart", scart);
	  		
	  		//아이디 기억하기 체크시 쿠키생성, 체크 안할시 모든 쿠키 삭제
	  		if(rememberId.equals("YES")) {
	  			Cookie cookie = new Cookie("cmid",mMID);
	  			cookie.setMaxAge(60*60*24);
	  			response.addCookie(cookie);
	  		} else { 
	  			Cookie[] cookies = request.getCookies();
	  			if(cookies!=null) {
	  				for(int i=0;i<cookies.length;i++) {
	  					cookies[i].setMaxAge(0);
	  					response.addCookie(cookies[i]);
	  				}
	  			}
  			}
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
	  		String id_found = vo.getmMID().substring(0,vo.getmMID().length()-3)+"***";
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
	public String updateGet() {
		return "mypage/pwdCheck";
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePost(String mMID, String mPWD) {
	  	MemberVo vo = memberService.IdCheck(mMID);
	  	if(vo != null && bCryptPasswordEncoder.matches(mPWD, vo.getmPWD())) {
	  		msgFlag = "pwdCheckOk";
	  		return "redirect:/location/" + msgFlag;
	  	} else {
	  		msgFlag = "pwdCheckNo";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	}
	
	@RequestMapping(value="/updateForm", method=RequestMethod.GET)
	public String updateFormGet(HttpSession session, Model model) {
		String mMID = (String)session.getAttribute("smid");
  		MemberVo vo = memberService.IdCheck(mMID);
  		model.addAttribute("vo",vo);
		return "member/update";
	}

	@RequestMapping(value="/updateForm", method=RequestMethod.POST)
	public String updateFormPost(MemberVo vo) {
	  	//이메일 중복체크
	  	if(memberService.EmailCheck(vo.getmEMAIL()) != null) {
	  		msgFlag = "emailCheckNO";
	  		return "redirect:/msg/" + msgFlag;
	  	}
	  	vo.setmPWD(bCryptPasswordEncoder.encode(vo.getmPWD()));
		memberService.memberUpdate(vo);
		msgFlag = "memberUpdateOK";
		return "redirect:/msg/"+msgFlag;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteGet(HttpSession session, Model model) {
		String mMID = (String)session.getAttribute("smid");
		memberService.memberDelete(mMID);
		msgFlag = "memberDeleteOK";
		return "redirect:/msg/"+msgFlag;
	}
	
	@ResponseBody
	@RequestMapping(value="/recommendIdCheck", method=RequestMethod.POST)
	public String recommendIdCheckPost(String recommendId) {
	  	String res = "0";
	  	MemberVo vo = memberService.IdCheck(recommendId);
	  	if(vo != null) res = "1";
	  	
	  	return res;
	}

	
	
	
}
