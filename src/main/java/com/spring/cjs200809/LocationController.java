package com.spring.cjs200809;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LocationController {
	@RequestMapping(value="/location/{msgFlag}",method=RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model,HttpSession session) {
		String nickname = session.getAttribute("snickname") == null? "" : (String) session.getAttribute("snickname");
		
		if(msgFlag.equals("writeFaqOK")) {
			model.addAttribute("url","faq/list");
		}
		else if(msgFlag.equals("loginOK")) {
			model.addAttribute("url","h");
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
		
		return "include/location";
	}
}
