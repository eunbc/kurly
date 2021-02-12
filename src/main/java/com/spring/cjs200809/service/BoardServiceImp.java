package com.spring.cjs200809.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.cjs200809.dao.BoardDao;
import com.spring.cjs200809.vo.BoardVo;

@Service
public class BoardServiceImp implements BoardService{
	@Autowired
	BoardDao boardDao;
	
	@Override
	public void writeBoard(BoardVo vo) {
		boardDao.writeBoard(vo);
	}
	
	//이미지 파일 업로드
	@Override
	public void imgCheck(String content, String uploadPath, int position_number) {
		if(content.indexOf("src=\"/") == -1) return; //content안에 그림파일이 없으면 작업 수행x
		
		//            0         1         2         3         4         5         6
		//            0123456789012345678901234567890123456789012345678901234567890123                
		//<img alt="" src="/cjs200809/resources/ckeditor/images/src/210201063928+0900_1.JPG" style="height:250px; width:400px" />
		
		int position = position_number;
		boolean sw = true;
		
		String nextImg = content.substring(content.indexOf("src=\"")+position);

		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\"")); //순수한 그림파일만 가져온다.
			String oriFilePath = uploadPath + imgFile; //원본파일이 있는 경로명과 파일명
			String copyFilePath = uploadPath +"src/" +imgFile; //복사될 파일이 있는 경로명과 파일명
			
			fileCopyCheck(oriFilePath, copyFilePath);	//images폴더에서 images/src폴더로 파일 복사작업 처리
			
			//nextImg 변수안에 또다른 'src="/'문구가 있는지를 검색하여, 있다면 다시 앞의 작업을 반복수행한다.
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/")+position);
			}
		}
	}
	
	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		
		try {
			FileInputStream fis = new FileInputStream(oriFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			
			byte[] buffer = new byte[1024];
			int readCnt = 0;
			while((readCnt=fis.read(buffer)) != -1) {
				fos.write(buffer,0,readCnt);
			}
			fos.flush();
			fis.close();
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BoardVo> bList(int startNo, int pageSize) {
		return boardDao.bList(startNo, pageSize);
	}

	@Override
	public BoardVo viewBoard(int idx) {
		return boardDao.viewBoard(idx);
	}

	@Override
	public void addViewCnt(int idx) {
		boardDao.addViewCnt(idx);
	}


}
