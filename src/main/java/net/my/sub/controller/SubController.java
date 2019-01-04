package net.my.sub.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.my.sub.SubBoard;
import net.my.sub.SubService;
import net.my.user.User;


@Controller
@RequestMapping("sub")
public class SubController {

	private static final int RESULT_EXCEED_SIZE = -2;
    private static final int RESULT_UNACCEPTED_EXTENSION = -1;
    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
	
	@Autowired
	private SubService subservice;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="/upload")
	public String sub(HttpSession session, HttpServletResponse response) throws Exception{
		User user = (User) session.getAttribute("check");
		
		if(user == null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 후 이용 가능합니다.'); location.href='../'; </script>");
            out.flush();
		}else {
			String userEmail = user.getEmail();
			System.out.println("유저 이메일은 무엇이냐! : " + userEmail);
		}
		//바로 아래 insertBoard 는 테스트용 지워도 됨
		//insertBoard(session);
		
		System.out.println("드루와드루와드루와드루와드루와드루와드루와드루와드루와드루와");
		return "sub/upload";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/isAvailable", method = RequestMethod.POST)
	public String insertBoard( HttpSession session, String title) {
		System.out.println("여기는와?1111");
		User user = (User) session.getAttribute("check");
		//SubBoard result = subservice.insert(title);
		String userNum = user.getMember_no();
		System.out.println("여기는와?222222");
		SubBoard subboard = new SubBoard();
		subboard.setMember_no(userNum);
		subservice.insert(subboard);
		
		return "sub/upload";
	}
	
	@ResponseBody
	@RequestMapping(value="/fileUpload")
	public int fileUp(@RequestParam("files")List<MultipartFile> images,
			@RequestParam Map<String, Object> modelMap , MultipartHttpServletRequest multi, 
			HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		
		
		long sizeSum = 0;
		System.out.println("00000000000000");
		//System.out.println("model : " + modelMap.get("title"));
		//MultipartFile file = multi.getFile("input_cover");
		
		//커버 ajax 로 받아오기
		List<MultipartFile> cover = multi.getFiles("cover");
		String sde = (String) modelMap.get("title");
		String visivl = (String) modelMap.get("visib");
		String ccl=(String) modelMap.get("ccl");
		//List<String> content = new ArrayList<String>();
		//content = (String) multi.get;
		/*for(String map : content) {
			System.out.println("");
		}*/
		String[] content = multi.getParameterValues("txt");
		System.out.println("content : "+ content);
		if(content != null) {
			for(int i =0; i < content.length; i++) {
				System.out.println("어디까지 나오나 보자 LIST야!: " + i);
				String aaa = content[i];
				System.out.println("어디까지 나오나 보자 LIST야!2: " + aaa);
			}
		}
		
		//System.out.println("cover : " + file);
		System.out.println("visivl!!!!!! : " + visivl);
		System.out.println("이거는 되나?111 : " + cover);
		System.out.println("model : " + sde);
		System.out.println("ccl : " + ccl);
		
		
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
		/*MultipartFile file = multi.getFile("input_imgs");
		System.out.println(file);*/
		
		// 추가한거임
		List<MultipartFile> files1 = multi.getFiles("files");
		System.out.println(files1);
		
		//유저 넘버 받아오기
		User user = (User) session.getAttribute("check");
		System.out.println("user 넘버 : " + user);
		String userNum = user.getMember_no();
		System.out.println("user 넘버 : " + userNum);
		
		
		//저장 경로 설정
		String root = multi.getSession().getServletContext().getRealPath("/");		
		String path = root + "resources/upload/" + userNum + "/";
		
		System.out.println("하이하이 : " + root);
		String newFileName = ""; //업로드 되는 파일명
		
		//json 파싱
		JSONParser jsonParser = new JSONParser();
		//JSONObject jsonObject = (JSONObject) jsonParser.parse();
		
		//data2.put("", value)
		
		
		File dir = new File(path);
		
		//폴더가 없을 경우 폴더 생성 
		if(!dir.isDirectory()) {
			dir.mkdir();
			try {
				System.out.println("파일 경로 : " + dir.getCanonicalPath().toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
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
		}
		/*if(file != null) {
			 System.out.println("파라미터명" + file.getName());
	         System.out.println("파일크기" + file.getSize());
	         System.out.println("파일 존재" + file.isEmpty());
	         System.out.println("오리지날 파일 이름" + file.getOriginalFilename());
		}*/
		//Iterator<String> files = multi.getFileNames();
		for(int i = 0; i < files1.size(); i++) {
			System.out.println("FOR 에서 PATH 는 어째되나? : " + path);
			System.out.println(files1.get(i).getOriginalFilename() + "업로드");
			dir = new File(path+files1.get(i).getOriginalFilename());
			System.out.println("dir 은 무었이냐!!" + dir);
			String fileName = files1.get(i).getOriginalFilename();
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".")+1);
			try {
				files1.get(i).transferTo(new File(path+newFileName));
				System.out.println("저장완료 : " + i + " " + files1.get(i).getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		for(int j = 0; j < cover.size(); j++) {
			dir = new File(path+cover.get(j).getOriginalFilename());
			String fileName = cover.get(j).getOriginalFilename();
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".")+1);
			
			try {
				cover.get(j).transferTo(new File(path + newFileName));
				System.out.println("저장완료 : " + j + " " + cover.get(j).getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
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
		return false;
	}
	
}
