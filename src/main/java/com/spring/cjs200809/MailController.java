package com.spring.cjs200809;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.cjs200809.service.MemberService;

@Controller
@RequestMapping("/mail")
public class MailController {
	String msgFlag = "";
	
	@Autowired
	MemberService memberService;	
	
	@Autowired
	JavaMailSender mailSender;
	
	//비밀번호 분실시에 임시 비밀번호를 반송하기 위한 메일설정 , GET방식이어야 함
	@RequestMapping(value="/pwdConfirmMailForm/{toMail}/{content}/", method=RequestMethod.GET)
	public String PwdConfirmMailFormGet(@PathVariable String toMail, @PathVariable String content){
		String fromMail = "joeunbi0514@gmail.com";
		String title = "[마켓컬리] 비밀번호 찾기 메일입니다.";
		String pwd = content;
		content = "마켓컬리에서 발송된 메일입니다.\n아래 임시 비밀번호를 보내오니 사이트에 접속하셔서 비밀번호를 변경하세요!\n";
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");

			//메일 보관함에 저장
			messageHelper.setFrom(fromMail);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			//메세지 내용과 함께 사진을 전송한다
			content = content.replace("\n", "<br/>");
			content += "<font color=red>"+ pwd + "</font><br>";
			content += "<br><hr><h3>마켓컬리<h3><hr><br>";
			//content += "<p><img src=\"cid:dog3.jpg\" width='250px'></p><hr>";
			content += "<p>오늘도 행복한 시간되세요 :) </p>";
			messageHelper.setText(content, true);
			//FileSystemResource file = new FileSystemResource(new File("C:/Users/Eunbi/Downloads/images/dog3.jpg"));
			//messageHelper.addInline("dog3.jpg", file);
			
			mailSender.send(message); //실제 메일 전송
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		msgFlag = "find_pwdOK_sendEmail";
		return "redirect:/msg/"+msgFlag;
	}

	//비밀번호 분실시에 임시 비밀번호를 반송하기 위한 메일설정 , GET방식이어야 함
	@RequestMapping(value="/orderCompleted/{toMail}/{content}/", method=RequestMethod.GET)
	public String orderCompletedGet(@PathVariable String toMail, @PathVariable String content){
		String fromMail = "joeunbi0514@gmail.com";
		String title = "[마켓컬리] 결제하신 내역을 안내해드립니다.";
		String oNVOICE = content;
		content = "마켓컬리에서 발송된 메일입니다.\n주문해주셔서 대단히 감사드립니다!\n 빠른 시일내에 댁으로 배송해드리겠습니다.";
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");

			//메일 보관함에 저장
			messageHelper.setFrom(fromMail);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			//메세지 내용과 함께 사진을 전송한다
			content = content.replace("\n", "<br/>");
			content += "<br><h3><font color=red>주문번호 :"+ oNVOICE + "</font></h3><br>";
			content += "<br><hr><h3>마켓컬리<h3><hr><br>";
			content += "<p>상세한 주문 내역 및 주문 진행 상태는 마켓컬리에서 확인 가능합니다.</p>";
			content += "<p>오늘도 행복한 시간되세요 :) </p>";
			messageHelper.setText(content, true);
			
			mailSender.send(message); //실제 메일 전송
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		msgFlag = "orderCompleted$oNVOICE="+oNVOICE;
		return "redirect:/location/"+msgFlag;

	}

}
