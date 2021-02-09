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
		
		if(msgFlag.equals("writeBoardOk")) {
			model.addAttribute("msg","공지사항 작성이 완료되었습니다.");
			model.addAttribute("url","board/list");
		}
		else if(msgFlag.equals("fileUploadNo")) {
			model.addAttribute("msg","파일 업로드 실패.");
			model.addAttribute("url","study/fileUpload");
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
