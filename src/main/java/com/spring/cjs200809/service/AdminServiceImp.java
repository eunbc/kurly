package com.spring.cjs200809.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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

import com.spring.cjs200809.dao.AdminDao;
import com.spring.cjs200809.vo.CategoryVo;
import com.spring.cjs200809.vo.CouponVo;
import com.spring.cjs200809.vo.GoodsOptionVo;
import com.spring.cjs200809.vo.GoodsVo;
import com.spring.cjs200809.vo.InquiryVo;
import com.spring.cjs200809.vo.QnaVo;
import com.spring.cjs200809.vo.ReviewVo;
import com.spring.cjs200809.vo.SubcategoryVo;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	AdminDao adminDao;

	@Override
	public List<InquiryVo> listInquiry(String iREPLY, int startNo, int pageSize) {
		return adminDao.listInquiry(iREPLY,startNo,pageSize);
	}

	@Override
	public void addCategory(String cCODE, String cNAME) {
		adminDao.addCategory(cCODE,cNAME);
	}

	@Override
	public CategoryVo CategoryCheck(String cCODE) {
		return adminDao.CategoryCheck(cCODE);
	}

	@Override
	public List<CategoryVo> getCategoryList() {
		return adminDao.getCategoryList();
	}

	@Override
	public List<SubcategoryVo> getSubcategoryList(String cCODE) {
		return adminDao.getSubcategoryList(cCODE);
	}

	@Override
	public String getcNAME(String cCODE) {
		return adminDao.getcNAME(cCODE);
	}

	@Override
	public SubcategoryVo subcategoryCheck(String cCODE, String scCODE) {
		return adminDao.subcategoryCheck(cCODE,scCODE);
	}

	@Override
	public void addSubcategory(String cCODE, String scCODE, String scNAME) {
		adminDao.addSubcategory(cCODE,scCODE,scNAME);
	}

	@Override
	public void deleteCategory(String cCODE) {
		adminDao.deleteCategory(cCODE);
	}

	@Override
	public void deleteSubcategory(String cCODE, String scCODE) {
		adminDao.deleteSubcategory(cCODE,scCODE);
	}

	//이미지 파일 업로드
	@Override
	public void imgCheck(String gDETAIL, String uploadPath, int position_number) {
		if(gDETAIL.indexOf("src=\"/") == -1) return; //bCONTENT안에 그림파일이 없으면 작업 수행x
		
		//            0         1         2         3         4         5         6
		//            0123456789012345678901234567890123456789012345678901234567890123                
		//<img alt="" src="/cjs200809/resources/ckeditor/images/src/210201063928+0900_1.JPG" style="height:250px; width:400px" />
		
		int position = position_number;
		boolean sw = true;
		
		String nextImg = gDETAIL.substring(gDETAIL.indexOf("src=\"")+position);

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
	public void addGoods(MultipartFile file, GoodsVo vo) {
		try {
			String oFileName = file.getOriginalFilename(); 	
			String saveFileName = saveFileName(oFileName);
			writeFile(file,saveFileName);
			vo.setgIMAGE(saveFileName);
			adminDao.addGoods(vo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void writeFile(MultipartFile file, String saveFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		//request.getRealPath("/resources/inquiry/");
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/goods/");
		
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
	public List<GoodsVo> getGoodsByCategory(String cCODE, String scCODE, int startNo, int pageSize) {
		return adminDao.getGoodsByCategory(cCODE,scCODE,startNo,pageSize);
	}

	@Override
	public GoodsVo getGoodsDetail(int gIDX) {
		return adminDao.getGoodsDetail(gIDX);
	}

	@Override
	public void goodsDelete(int gIDX) {
		adminDao.goodsDelete(gIDX);
	}

	//수정시, src에 있던 파일을 images로 복사하기
	@Override
	public void imgBackup(String gDETAIL, String uploadPath) {
		if(gDETAIL.indexOf("src=\"/") == -1) return; //content안에 그림파일이 없으면 작업 수행x
		
		//            0         1         2         3         4         5         6
		//            0123456789012345678901234567890123456789012345678901234567890123                
		//<img alt="" src="/cjs200809/resources/ckeditor/images/src/210201063928+0900_1.JPG" style="height:250px; width:400px" />
		
		int position = 46;
		boolean sw = true;
		
		String nextImg = gDETAIL.substring(gDETAIL.indexOf("src=\"/")+position);

		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\"")); //순수한 그림파일만 가져온다.
			String oriFilePath = uploadPath + "src/" +imgFile; //원본파일이 있는 경로명과 파일명
			String copyFilePath = uploadPath +imgFile; //복사될 파일이 있는 경로명과 파일명
			
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

	@Override
	public void goodsImageDelete(int gIDX) {
		adminDao.goodsImageDelete(gIDX);
	}

	@Override
	public void imgDelete(String oriContent, String uploadPath) {
		if(oriContent.indexOf("src=\"/") == -1) return; //content안에 그림파일이 없으면 작업 수행x
		
		//            0         1         2         3         4         5         6
		//            0123456789012345678901234567890123456789012345678901234567890123                
		//<img alt="" src="/cjs200809/resources/ckeditor/images/src/210201063928+0900_1.JPG" style="height:250px; width:400px" />
		
		int position = 46;
		boolean sw = true;
		
		String nextImg = oriContent.substring(oriContent.indexOf("src=\"/")+position);

		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\"")); //순수한 그림파일만 가져온다.
			String delFilePath = uploadPath + imgFile; //원본파일이 있는 경로명과 파일명
			
			fileDelete(delFilePath); //실제로 파일을 지워주는 메소드 호출
			//nextImg 변수안에 또다른 'src="/'문구가 있는지를 검색하여, 있다면 다시 앞의 작업을 반복수행한다.
			if(nextImg.indexOf("src=\"/") == -1) {
				sw = false;
			}
			else {
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/")+position);
			}
		}		
	}
	
	//게시물의 그림을 실제로 지워주는 메소드
	private void fileDelete(String delFilePath) {
		File delFile = new File(delFilePath);
		if(delFile.exists()) delFile.delete();
	}

	@Override
	public void updateGoods(MultipartFile file, GoodsVo vo) {
		try {
			if(file!=null) {
				String oFileName = file.getOriginalFilename(); 	
				String saveFileName = saveFileName(oFileName);
				writeFile(file,saveFileName);
				vo.setgIMAGE(saveFileName); //업로드한 파일이 있을 경우
			} else if(file==null) {
				vo.setgIMAGE(vo.getgIMAGE()); //업로드한 파일이 없을 경우
			}
			adminDao.updateGoods(vo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void addGoodsOption(GoodsOptionVo vo) {
		adminDao.addGoodsOption(vo);
	}

	@Override
	public List<GoodsOptionVo> getGoodsOption(int gIDX) {
		return adminDao.getGoodsOption(gIDX);
	}

	@Override
	public void deleteGoodsOption(int goIDX) {
		adminDao.deleteGoodsOption(goIDX);
	}

	@Override
	public List<QnaVo> listQna(String qREPLY, int startNo, int pageSize) {
		return adminDao.listQna(qREPLY,startNo,pageSize);
	}

	@Override
	public String[] findMemberbyLevel(String mLEVEL) {
		return adminDao.findMemberbyLevel(mLEVEL);
	}

	@Override
	public void createCoupon(CouponVo vo, String mMID) {
		adminDao.createCoupon(vo,mMID); 
	}

	@Override
	public List<ReviewVo> listReview(int startNo, int pageSize) {
		return adminDao.listReview(startNo,pageSize);
	}

	@Override
	public void reviewDeleteByAdminPost(int rIDX) {
		adminDao.reviewDeleteByAdminPost(rIDX);
	}
	



}
