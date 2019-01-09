package net.my.sub.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.inject.Inject;
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
import net.my.sub.SubBoardService;
import net.my.sub.SubService;
import net.my.sub.SubUpload;
import net.my.user.User;


@Controller
@RequestMapping("sub")
public class SubController {

    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
	
	@Inject
	private SubService subservice;
	
	@Inject
	private SubBoardService subBoardService;

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
	public String insertBoard( HttpSession session, @RequestParam Map<String, Object> modelMap) {
		System.out.println("여기는와?1111");
		User user = (User) session.getAttribute("check");
		//SubBoard result = subservice.insert(title);
		String userNum = user.getMember_no();
		System.out.println("여기는와?222222");
		//SubBoard subboard = new SubBoard();
		//subboard.setMember_no(userNum);
		//subservice.insert(subboard);
		/*String title = (String) modelMap.get("title");
		String visivl = (String) modelMap.get("visib");
		String ccl=(String) modelMap.get("ccl");
		
		System.out.println("title : " + title);
		System.out.println("visivl : " + visivl);
		System.out.println("ccl : " + ccl);*/
		
		return "sub/upload";
	}
	
	@ResponseBody
	@RequestMapping(value="/fileUpload")
	public String fileUp(@RequestParam("upload")List<MultipartFile> images,
			@RequestParam Map<String, Object> modelMap , MultipartHttpServletRequest multi, 
			HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		
		
		long sizeSum = 0;

		SubUpload subUpload = new SubUpload();
		//커버 ajax 로 받아오기
		List<MultipartFile> cover = multi.getFiles("cover");
		String title = (String) modelMap.get("title");
		String visivl = (String) modelMap.get("visib");
		String ccl=(String) modelMap.get("ccl");
		String[] cate1 = multi.getParameterValues("cate");
		String cate = "";
		for(int i = 0; i < cate1.length; i++) {
			System.out.println("cate!@##@! : "+ cate1[i]);
			System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		}
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		System.out.println("진성한 cate는?? : " + Arrays.toString(cate1));
		
		//cate = cate1.length()-1;
		System.out.println("cate : "+cate);
		String[] tag = multi.getParameterValues("tag");
		
		/*System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);
		System.out.println("cate : "+cate);*/
		
		System.out.println("title : " + title);
		System.out.println("visivl : " + visivl);
		System.out.println("ccl : " + ccl);
		
		List<MultipartFile> dof2 = multi.getFiles("upload");
		String[] dof = multi.getParameterValues("upload");
		
		
		for(int i=0; i < multi.getFiles("upload").size(); i++) {
			System.out.println("dof@@@@@@@!!!! : "+ dof2.get(i));
		}
		if(dof != null) {
			for(int i=0; i < multi.getParameterValues("upload").length; i++) {
				System.out.println("dof!!!! : "+ dof[i]+ " :: "+ i);
			}
		}
		
		
		for(MultipartFile image : images) {
			String originalName = image.getOriginalFilename();
			
			if(!isValidExtension(originalName)) {
				return "jpg, gif, png, bmp 확장자만 업로드 가능합니다.";
			}
			sizeSum += image.getSize();
			if(sizeSum >= LIMIT_SIZE) {
				return "파일이 10MB를 초과하였습니다.";
			}
		}
		/*MultipartFile file = multi.getFile("input_imgs");
		System.out.println(file);*/
		
		
		//유저 넘버 받아오기
		User user = (User) session.getAttribute("check");
		System.out.println("user 넘버 : " + user);
		if(user.getMember_no() == null) {
			return "업로드에 실패하였습니다.";
		}
		int userNum = Integer.parseInt(user.getMember_no());
		
		subUpload.setMember_no(userNum);
		System.out.println("user 넘버 : " + userNum);
		
		
		//저장 경로 설정
		String root = multi.getSession().getServletContext().getRealPath("/");		
		String path = root + "resources/upload/" + userNum + "/";
		
		String newFileName = ""; //업로드 되는 파일명
		
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
		
		String cuverrute = "default";
		
		for(int j = 0; j < cover.size(); j++) {
			dir = new File(path+cover.get(j).getOriginalFilename());
			String fileName = cover.get(j).getOriginalFilename();
			newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".")+1);
			cuverrute = path+newFileName;
			try {
				cover.get(j).transferTo(new File(path + newFileName));
				System.out.println("저장완료 : " + j + " " + cover.get(j).getOriginalFilename());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(cover.size() <= 0) {
			
		}
		SubBoard subBoard = new SubBoard(userNum, title, cuverrute, "00", ccl, visivl);
		try {
			subBoardService.insert(subBoard);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		/*if(file != null) {
			 System.out.println("파라미터명" + file.getName());
	         System.out.println("파일크기" + file.getSize());
	         System.out.println("파일 존재" + file.isEmpty());
	         System.out.println("오리지날 파일 이름" + file.getOriginalFilename());
		}*/
		//Iterator<String> files = multi.getFileNames();
		subUpload.setBoard_no(subBoard.getBoard_no());
		System.out.println("--------------------------------");
		
		System.out.println("sub member no : " + subUpload.getMember_no());
		System.out.println("sub board no : " + subUpload.getBoard_no());
		System.out.println("sub file : " + subUpload.getFile());
		List<String> fileRoute = new ArrayList<String>();
		System.out.println("dof2사이즈 : " + dof2.size());
		if( dof2.size() > 0) {
			
			for(int i = 0; i < dof2.size(); i++) {
				
					System.out.println(dof2.get(i).getOriginalFilename() + "업로드");
					dir = new File(path+dof2.get(i).getOriginalFilename());
					System.out.println("dir 은 무었이냐!!" + dir);
					String fileName = dof2.get(i).getOriginalFilename();
					newFileName = System.currentTimeMillis() + "." + fileName.substring(fileName.lastIndexOf(".")+1);
					try {
						dof2.get(i).transferTo(new File(path+newFileName));
						System.out.println("저장완료 : " + i + " " + dof2.get(i).getOriginalFilename());
						String fileRoute1 = path+newFileName;
						
						
						fileRoute.add(fileRoute1);
						
						System.out.println("fewfaf : "+ fileRoute);
					} catch (Exception e) {
						e.printStackTrace();
					}
			}
			
		}
		
		if(dof != null ) {
				for(int z = 0; z < dof.length; z++) {
					// 글자 마지막 마지막 앞 글자 빼오자
					System.out.println("1번 : "+ dof[z]);
					String result = dof[z].substring(dof[z].length()-2);
					if(Integer.parseInt(result) < 9) {
						int result2 = Integer.parseInt(result.substring(result.length()-1));
						System.out.println("result222는  "+ z +": "+result);
						fileRoute.add(result2, dof[z]);
					}else {
						fileRoute.add(Integer.parseInt(result), dof[z]);
						
					}
					
				}
				
		}
		
		System.out.println("dof 와 dof2 ?? : "+ dof );
		System.out.println("dof 와 dof2 ##$$ : "+ dof2.size() );
		if(dof == null && dof2.size() == 0) {
			System.out.println("여기옴??!!!! 와야함");
			return "업로드에 실패하였습니다.";
		}
		
		
		//SubUpload subUpload = new SubUpload(userNum, board_no, fileRoute1);
		
		for(int i =0; i < fileRoute.size(); i++) {

			subUpload.setFile(fileRoute.get(i));
			try {
				subservice.create(subUpload);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(tag != null) {
			for(int j = 0; j < tag.length; j++) {
				subUpload.setTagname(tag[j]);
				try {
					subservice.taginsert(subUpload);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//subservice.create(subUpload); subservice 로 가는 문 풀자마자 저장됨
		
		System.out.println("여기 여기!!");
		
		
		return "파일 업로드하였습니다.";
	}
	
	
	private boolean isValidExtension(String originalName) {
		String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
		switch(originalNameExtension) {
		
		case "jpg":
			return true;
		case "png":
			return true;
		case "gif":
			return true;
		case "JPG" :
			return true;
		case "PNG" :
			return true;
		case "GIF" :
			return true;
		
		}
		return false;
	}
	
}
