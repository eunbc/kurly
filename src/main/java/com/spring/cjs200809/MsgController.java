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
		String strLevel = session.getAttribute("sStrLevel") == null? "" : (String) session.getAttribute("sStrLevel");
		
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
		
		//예) msgFlag = "imgDeleteOk$fileCnt="+fileCnt;
		//앞의 예에서 특정 매개변수에 추가로 매개값이 넘어왔을 때는 아래와 같이 처리한다.
		else if(msgFlag.substring(0,11).equals("imgDeleteOk")) {
			model.addAttribute("msg","게시판의 임시그림파일("+msgFlag.substring(12)+")이 모두 삭제되었습니다.");
			model.addAttribute("url","admin/file/tempDelete");
		}
		
		return "include/msg";
	}
}
