package net.my.sub.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("sub")
public class SubController {
	private static final Logger logger = LoggerFactory.getLogger(SubController.class);
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String sub(Locale locale, Model model) throws Exception{
		System.out.println("드루와드루와드루와드루와드루와드루와드루와드루와드루와드루와");
		return "sub/upload";
		
	}
	@RequestMapping(value= "/fileUpload")
	public String requestupload(MultipartHttpServletRequest mtfRequest) {
		System.out.println("드루와드222222222222222와드루와드루와드루와드루와드루와드루와드루와드루와222222222 ");
		
		String root = mtfRequest.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/upload/";
		String newFileName = "fuck";
		File dir = new File(path);
		System.out.println("드루와 드루와33333333333333333");
		if(!dir.isDirectory()) {
			System.out.println("드루와 드루와4444444444444444");
			dir.mkdir();
		}
		Iterator<String> files = mtfRequest.getFileNames();
		System.out.println("드루와 드루와49494949449");
		while(files.hasNext()) {
			System.out.println("드루와 드루와55555555555555555555");
			String uploadFile = files.next();
			MultipartFile mFile = mtfRequest.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			System.out.println("실제 파일 이름 : " +fileName);
			newFileName = System.currentTimeMillis()+"."+ fileName.substring(fileName.lastIndexOf(".")+1);
			System.out.println("드루와 드루와88888888888888888888888");
			try {
				System.out.println("드루와 드루와777777777777777777");
				mFile.transferTo(new File(path+newFileName));
			}catch(Exception e) {
				System.out.println("드루와 드루와999999999999999999");
				e.printStackTrace();
			}
		}
		System.out.println("드루와 드루와789789798789");
		return "upload";
		
		
		
		
		/*List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);
		//String path = "C:\\image\\";
		for(MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();
			long fileSize = mf.getSize(); //파일 사이즈
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			String safeFile = path + System.currentTimeMillis() + originFileName;
			
			
				try {
					mf.transferTo(new File(safeFile));
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
			

		}
		return "redirect:/";
		*/
	}
	
}
