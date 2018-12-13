package net.my.sub.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
@RequestMapping("sub")
public class SubController {
	private static final Logger logger = LoggerFactory.getLogger(SubController.class);
	
	//
	private static final int RESULT_EXCEED_SIZE = -2;
    private static final int RESULT_UNACCEPTED_EXTENSION = -1;
    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
	
	// 업로드된 파일이 저장될 위치 입니다. 
	private final String PATH = "D:\\SpringUploadRepo\\upload";
	

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="/upload")
	public String sub() throws Exception{
		System.out.println("드루와드루와드루와드루와드루와드루와드루와드루와드루와드루와");
		return "sub/upload";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/fileUpload")
	public int fileUp(@RequestParam("files")List<MultipartFile> images ,MultipartHttpServletRequest multi) {
		long sizeSum = 0;
		System.out.println("00000000000000");
		for(MultipartFile image : images) {
			String originalName = image.getOriginalFilename();
			
			if(!isValidExtension(originalName)) {
				System.out.println("00000000000000 두번째!!");
				return RESULT_UNACCEPTED_EXTENSION;
			}
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				return RESULT_EXCEED_SIZE;
			}
		}
		MultipartFile file = multi.getFile("input_imgs");
		System.out.println(file);
		
		// 추가한거임
		List<MultipartFile> files1 = multi.getFiles("files");
		System.out.println(files1);
		//저장 경로 설정
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/";
		System.out.println("1111111111111111");
		System.out.println("하이하이 : " + root);
		String newFileName = ""; //업로드 되는 파일명
		
		File dir = new File(path);
		System.out.println("222222222222222");
		if(!dir.isDirectory()) {
			System.out.println("33333333333!");
			dir.mkdir();
		}else {
			try {
				System.out.println("파일 경로 : " + dir.getCanonicalPath().toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("파일 사이즈란다" + files1.size() );
		for(int i = 0; i< files1.size(); i++) {
			
			System.out.println("파라미터fff명" + i);
	        System.out.println("파일크fff기"+ i);
	        System.out.println("파일 존fff재"+ i);
	        System.out.println("오리지날 파일 이fff름"+ i);
		}
		if(file != null) {
			 System.out.println("파라미터명" + file.getName());
	         System.out.println("파일크기" + file.getSize());
	         System.out.println("파일 존재" + file.isEmpty());
	         System.out.println("오리지날 파일 이름" + file.getOriginalFilename());
		}
		System.out.println("44444444444444444444");
		Iterator<String> files = multi.getFileNames();
		System.out.println("하하하하하 : " + multi.getFileNames());
		System.out.println("하하하하하123 : " + files.hasNext());
		for(int i = 0; i < files1.size(); i++) {
			
			System.out.println(files1.get(i).getOriginalFilename() + "업로드");
			dir = new File(path+files1.get(i).getOriginalFilename());
			String fileName = files1.get(i).getOriginalFilename();
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".")+1);
			try {
				files1.get(i).transferTo(new File(path+newFileName));
				System.out.println("저장완료 : " + i + " " + files1.get(i).getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/*while(files.hasNext()) {
			System.out.println("555555555555555555");
			String uploadFile = files.next();
			
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			System.out.println("실제 파일 이름 : " + fileName);
			newFileName = System.currentTimeMillis()+ "."
					+fileName.substring(fileName.lastIndexOf(".")+1);
			
			try {
				mFile.transferTo(new File(path+newFileName));
				System.out.println("666666666666666666666");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/
		//return "sub/upload";
		return RESULT_SUCCESS;
	}
	
	private boolean isValidExtension(String originalName) {
		String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
		switch(originalNameExtension) {
		
		case "jpg":
			System.out.println("jpg1임");
			return true;
		case "png":
			System.out.println("png1임");
			return true;
		case "gif":
			System.out.println("gif1임");
			return true;
		case "JPG" :
			System.out.println("jpg2임");
			return true;
		case "PNG" :
			System.out.println("png2임");
			return true;
		case "GIF" :
			System.out.println("gif2임");
			return true;
		
		}
		System.out.println("case 아에 안된다!!");
		return false;
	}
	
	/*@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String upload(MultipartFile file, Model model) throws Exception{
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	*/
	
}
