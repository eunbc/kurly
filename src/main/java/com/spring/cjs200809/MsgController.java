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
		else if(msgFlag.equals("memberUpdateOK")) {
			model.addAttribute("msg","회원정보가 수정되었습니다.");
			model.addAttribute("url","member/updateForm");
		}
		else if(msgFlag.equals("memberDeleteOK")) {
			session.invalidate();
			model.addAttribute("msg","탈퇴되었습니다.\\n 30일동안 같은 아이디로 회원가입이 불가합니다.");
			model.addAttribute("url","h");
		}
		else if(msgFlag.equals("loginOK")) {
			model.addAttribute("msg","로그인 성공");
			model.addAttribute("url","h");
		}
		else if(msgFlag.equals("loginNO")) {
			model.addAttribute("msg","로그인 실패.\\n아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url","member/login");
		}
		else if(msgFlag.equals("pwdCheckNo")) {
			model.addAttribute("msg","아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url","member/update");
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
		else if(msgFlag.equals("find_idNO")) {
			model.addAttribute("msg","해당 이메일로 가입된 내역이 없습니다.");
			model.addAttribute("url","member/find_id");
		}	
		else if(msgFlag.equals("find_pwdNO")) {
			model.addAttribute("msg","일치하는 정보가 존재하지 않습니다.");
			model.addAttribute("url","member/find_pwd");
		}	
		else if(msgFlag.equals("find_pwdOK_sendEmail")) {
			model.addAttribute("msg","해당 이메일로 안내 메일이 발송되었습니다.");
			model.addAttribute("url","member/login");
		}	
		else if(msgFlag.equals("categoryOverlap")) {
			model.addAttribute("msg","이미 존재하는 대분류 코드입니다.");
			model.addAttribute("url","admin/category");
		}	
		else if(msgFlag.equals("addGoodsOK")) {
			model.addAttribute("msg","상품이 등록되었습니다.");
			model.addAttribute("url","admin/goods");
		}	
		else if(msgFlag.equals("NeedtoLogin")) {
			model.addAttribute("msg","본 서비스는 로그인 후 이용가능합니다.");
			model.addAttribute("url","member/login");
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
		else if(msgFlag.substring(0,13).equals("goodsUpdateOK")) {
			model.addAttribute("msg","상품 정보가 수정되었습니다.");
			model.addAttribute("url","admin/goodsDetail?"+msgFlag.substring(14));
		}
		else if(msgFlag.substring(0,10).equals("writeQnaOK")) {
			model.addAttribute("msg","상품 문의가 등록되었습니다.");
			model.addAttribute("url","goods/goodsDetail?"+msgFlag.substring(11));
		}
		
		return "include/msg";
	}
}
