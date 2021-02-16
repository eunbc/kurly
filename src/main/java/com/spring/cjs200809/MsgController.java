package com.spring.cjs200809;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MsgController {
	@RequestMapping(value="/msg/{msgFlag}",method=RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model,HttpSession session) {
		String nickname = session.getAttribute("snickname") == null? "" : (String) session.getAttribute("snickname");
		
		if(msgFlag.equals("idCheckNO")) {
			model.addAttribute("msg","사용중인 아이디입니다.");
			model.addAttribute("url","member/join");
		}
		else if(msgFlag.equals("emailCheckNO")) {
			model.addAttribute("msg","사용중인 이메일입니다.");
			model.addAttribute("url","member/join");
		}
		else if(msgFlag.equals("memberJoinOK")) {
			model.addAttribute("msg","회원가입이 완료되었습니다. \\n로그인 후 이용해주세요.");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("loginOK")) {
			model.addAttribute("msg","로그인 성공");
			model.addAttribute("url","h");
		}
		else if(msgFlag.equals("loginNO")) {
			model.addAttribute("msg","로그인 실패.\\n아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("logoutOK")) {
			session.invalidate();
			model.addAttribute("msg","로그아웃 되었습니다.");
			model.addAttribute("url","h");
		}
		else if(msgFlag.equals("writeBoardOK")) {
			model.addAttribute("msg","공지사항을 등록하였습니다.");
			model.addAttribute("url","board/list");
		}		
		else if(msgFlag.equals("writeInquiryOK")) {
			model.addAttribute("msg","1:1문의를 등록하였습니다.");
			model.addAttribute("url","inquiry/list");
		}		
		
		//예) msgFlag = "imgDeleteOk$fileCnt="+fileCnt;
		//앞의 예에서 특정 매개변수에 추가로 매개값이 넘어왔을 때는 아래와 같이 처리한다.
		else if(msgFlag.substring(0,13).equals("updateBoardOK")) {
			model.addAttribute("msg","공지글이 수정되었습니다.");
			model.addAttribute("url","board/view?"+msgFlag.substring(14));
		}
		else if(msgFlag.substring(0,13).equals("deleteBoardOK")) {
			model.addAttribute("msg","공지글이 삭제되었습니다.");
			model.addAttribute("url","board/list?"+msgFlag.substring(14));
		}
		
		return "include/msg";
	}
}
