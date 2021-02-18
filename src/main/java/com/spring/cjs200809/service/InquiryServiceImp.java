package com.spring.cjs200809.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.cjs200809.dao.AdminDao;
import com.spring.cjs200809.dao.InquiryDao;
import com.spring.cjs200809.dao.MypageDao;
import com.spring.cjs200809.vo.InquiryReplyVo;
import com.spring.cjs200809.vo.InquiryVo;

@Service
public class InquiryServiceImp implements InquiryService{
	@Autowired
	InquiryDao inquiryDao;

	@Override
	public void writeInquiry(MultipartHttpServletRequest mfile, InquiryVo vo) {
		try {
			List<MultipartFile> fileList = mfile.getFiles("file");
			String oFileNames = ""; 		//원본파일 리스트 누적
			String saveFileNames = ""; 		//서버에 저장되는 파일리스트 누적
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String saveFileName = saveFileName(oFileName);
				
				writeFile(file,saveFileName);
				oFileNames += oFileName + "/";
				saveFileNames += saveFileName + "/";
			}
			vo.setiFNAME(oFileNames);
			vo.setiRFNAME(saveFileNames);
			
			inquiryDao.writeInquiry(vo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	private void writeFile(MultipartFile file, String saveFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		//request.getRealPath("/resources/inquiry/");
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/inquiry/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
		fos.write(data); //서버에 업로드 시킨 파일이 저장된다.
		
		fos.close();
	}

	private String saveFileName(String oFileName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += "_" + oFileName;
		
		return fileName;
	}

	@Override
	public List<InquiryVo> listInquiry(String mMID) {
		return inquiryDao.listInquiry(mMID);
	}

	@Override
	public InquiryVo viewInquiry(int iIDX) {
		return inquiryDao.viewInquiry(iIDX);
	}

	@Override
	public void writeInquiryReply(InquiryReplyVo vo) {
		inquiryDao.writeInquiryReply(vo);
	}

	@Override
	public String viewInquiryReply(int iIDX) {
		return inquiryDao.viewInquiryReply(iIDX);
	}

	@Override
	public void updateReplyStmt(int iIDX) {
		inquiryDao.updateReplyStmt(iIDX);
	}

}
