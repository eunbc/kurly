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
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
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
		vo.setContent(vo.getContent().replace("/resources/ckeditor/images/", "/resources/ckeditor/images/src/"));
		
		//이미지를 발췌해서 'src'폴더로 복사처리
		boardService.imgCheck(vo.getContent(), uploadPath, 46);
		
		//경로 변경한 vo를 데이터베이스에 저장
		boardService.writeBoard(vo);
		msgFlag = "writeBoardOk";
		return "redirect:/msg/"+msgFlag;
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String viewBoardGet(Model model, HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null? 1 : Integer.parseInt(request.getParameter("pag"));
		
		boardService.addViewCnt(idx);
		BoardVo vo = boardService.viewBoard(idx);
		
		model.addAttribute("vo",vo);
		model.addAttribute("pag",pag);

		return "board/view";
	}
	
	

}
