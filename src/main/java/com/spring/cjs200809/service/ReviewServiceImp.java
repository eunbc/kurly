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

import com.spring.cjs200809.dao.ReviewDao;
import com.spring.cjs200809.vo.OrderDetailVo;
import com.spring.cjs200809.vo.ReviewVo;

@Service
public class ReviewServiceImp implements ReviewService{
	@Autowired
	ReviewDao reviewDao;

	@Override
	public void writeReview(MultipartHttpServletRequest mfile, ReviewVo vo) {
		try {
			//여러개의 파일 정보가 넘어오기에 List객체를 이용해서 담아준다.
			List<MultipartFile> fileList = mfile.getFiles("file");
			String oFileNames = ""; 		//원본파일 리스트 누적
			String saveFileNames = ""; 		//서버에 저장되는 파일리스트 누적
			int fileSizes = 0; 				//파일사이즈 누적
			
			System.out.println(fileList);
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String saveFileName = saveFileName(oFileName);
				System.out.println(oFileName);
				//실제 서버에 파일을 저장시킨다. (/resources/review 폴더에 저장)
				writeFile(file,saveFileName);
				oFileNames += oFileName + "/";
				saveFileNames += saveFileName + "/";
				fileSizes += file.getSize();
			}
			vo.setrFNAME(oFileNames);
			vo.setrRFNAME(saveFileNames);
			reviewDao.writeReview(vo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void writeFile(MultipartFile file, String saveFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		//request.getRealPath("/resources/review/");
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/review/");
		
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
	public OrderDetailVo checkMyOrderforReview(int gIDX, String mMID) {
		return reviewDao.checkMyOrderforReview(gIDX,mMID);
	}

	@Override
	public void changeReviewStatus(int gIDX, String oNVOICE) {
		reviewDao.changeReviewStatus(gIDX,oNVOICE);
	}

	@Override
	public List<ReviewVo> getReviewList(int startNo, int pageSize, int gIDX) {
		return reviewDao.getReviewList(startNo,pageSize,gIDX);
	}
		



}
