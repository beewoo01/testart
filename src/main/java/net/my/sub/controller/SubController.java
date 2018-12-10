package net.my.sub.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;


@Controller
@RequestMapping("sub")
public class SubController {
	private static final Logger logger = LoggerFactory.getLogger(SubController.class);
	
	// 업로드된 파일이 저장될 위치 입니다. 
	private final String PATH = "D:\\SpringUploadRepo\\upload";
	
	@Autowired
	MappingJackson2JsonView jsonView;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="/upload")
	public String sub() throws Exception{
		System.out.println("드루와드루와드루와드루와드루와드루와드루와드루와드루와드루와");
		return "sub/upload";
		
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.POST)
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
	
	/*@RequestMapping(value="/upload", method=RequestMethod.POST, produces="text/plain")
	public ModelAndView upload(MultipartHttpServletRequest request) throws Exception{
		
		ModelAndView model = new ModelAndView();
		model.setView(jsonView);
		
		Iterator itr = request.getFileNames();
		
		if(itr.hasNext()) {
			List mpf = request.getFiles((String) itr.next());
			
			for(int i = 0; i < mpf.size(); i++) {
				File file = new File(PATH + mpf.get(i).getOriginalFileName());
				logger.info(file.getAbsolutePath());
				mpf.get(i).transferTo(file);
			}
			
			JSONObject json = new JSONObject();
			json.put("code", "true");
			model.addObject("result", json);
			return model;
			
		}else {
			JSONObject json = new JSONObject();
			json.put("code", "false");
			model.addObject("result", json);
			return model;
		}
		
	}*/
	
}
