package com.spring.cjs200809;



import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.cjs200809.pagination.PageProcess;
import com.spring.cjs200809.service.BoardService;
import com.spring.cjs200809.vo.BoardVo;


@Controller
@RequestMapping("/board")
public class BoardController {
	String msgFlag;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listGet(Model model,HttpServletRequest request) {
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		
		com.spring.cjs200809.pagination.PageVo pageVo = pageProcess.pagination(pag,pageSize,"board");
		List<BoardVo> vos = boardService.bList(pageVo.getStartNo(),pageVo.getPageSize());
		int curScrNo = pageVo.getCurScrNo();
		
		model.addAttribute("p",pageVo);
		model.addAttribute("vos",vos);
		model.addAttribute("curScrNo",curScrNo);
		
		return "board/list";
	}

	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeBoardGet() {
		return "board/write";
	}

	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeBoardPost(BoardVo vo) {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest(); 
		@SuppressWarnings("deprecation")
		String uploadPath = request.getRealPath("/resources/ckeditor/images/"); //ckeditor를 통해 서버에 저장되는 그림파일의 경로
		
		//실제 업로드하는 경로
		vo.setbCONTENT(vo.getbCONTENT().replace("/resources/ckeditor/images/", "/resources/ckeditor/images/src/"));
		
		//이미지를 발췌해서 'src'폴더로 복사처리
		boardService.imgCheck(vo.getbCONTENT(), uploadPath, 46);
		
		//경로 변경한 vo를 데이터베이스에 저장
		boardService.writeBoard(vo);
		msgFlag = "writeBoardOK";
		return "redirect:/msg/"+msgFlag;
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String viewBoardGet(Model model, HttpServletRequest request) {
		int bIDX = Integer.parseInt(request.getParameter("bIDX"));
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		
		boardService.addViewCnt(bIDX);
		BoardVo vo = boardService.viewBoard(bIDX);
		//BoardVo vo2 = boardService.prevAndnext(bIDX);
		
		model.addAttribute("vo",vo);
		//model.addAttribute("vo2",vo2);
		model.addAttribute("pag",pag);

		return "board/view";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateBoardGet(HttpServletRequest request, Model model) {
		int bIDX = Integer.parseInt(request.getParameter("bIDX"));
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));

		BoardVo vo = boardService.viewBoard(bIDX);
		//내용물중에 그림파일이 있다면 db수정 작업 전에 기존 src폴더에 들어있는 파일을 images폴더로 복사시킨다.
		String uploadPath = request.getRealPath("/resources/ckeditor/images/");
		boardService.imgBackup(vo.getbCONTENT(),uploadPath);

		model.addAttribute("vo",vo);
		model.addAttribute("pag",pag);
		return "board/update";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateBoardPost(BoardVo vo,HttpServletRequest request) {
		//기존의 내용을 변경시켰고, content안에 'src'태그속성이 있다면 그림파일이 변경처리되어 있다고 가정하여, images방의 그림파일을 src폴더로 복사처리함
		if(!vo.getOriginalCONTENT().equals(vo.getbCONTENT()) && vo.getbCONTENT().indexOf("src=\"/") != -1) { //내용 수정, 그림이 있을 때 (그림 안바꾸어도 글자 하나만 바뀌면 새로 업로드함)
			//앞에서(수정처리를 위해 bUpdateGet메소드 수행후) 이미지의 위치가 src폴더에서 images로 복사된다.
			//따라서 db에 저장된 실제 그림의 경로도 변경시켜줘야 한다.
			vo.setbCONTENT(vo.getbCONTENT().replace("/resources/ckeditor/images/src/", "/resources/ckeditor/images/"));
			
			//현재 서버에 저장(위치: '/src/')되어 있는 이미지를 삭제처리한다.
			String uploadPath = request.getRealPath("/resources/ckeditor/images/src/");
			boardService.imgDelete(vo.getOriginalCONTENT(),uploadPath); //이미지 삭제처리
			
			//새롭게 업로드를 위한 이미지를 'src'폴더에 재등록한다.
			uploadPath = request.getRealPath("/resources/ckeditor/images/");
			boardService.imgCheck(vo.getbCONTENT(), uploadPath, 42); //content필드안의 그림파일들을 모두 src폴더로 복사
			vo.setbCONTENT(vo.getbCONTENT().replace("/resources/ckeditor/images/","/resources/ckeditor/images/src/"));
		}
		
		//잘 정비된 vo자료를 db에 update 시켜준다.
		boardService.updateBoard(vo);
		
		int pag = Integer.parseInt(request.getParameter("pag"));
		msgFlag = "updateBoardOK$bIDX="+vo.getbIDX()+"&pag="+pag;
		return "redirect:/msg/"+msgFlag;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET) 
	public String bDeleteGet(HttpServletRequest request,int bIDX,int pag) {
		BoardVo vo = boardService.viewBoard(bIDX);
		
		//실제 서버에 저장된 그림파일을 삭제처리
		String uploadPath = request.getRealPath("/resources/ckeditor/images/src/");
		boardService.imgDelete(vo.getbCONTENT(),uploadPath);
		
		//DB에서 실제 게시글을 삭제처리한다
		boardService.deleteBoard(bIDX);
		msgFlag = "deleteBoardOK$pag="+pag;
		return "redirect:/msg/"+msgFlag;
	}
	
	
	

}
