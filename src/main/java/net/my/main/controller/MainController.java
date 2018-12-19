package net.my.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.my.main.BoardList;
import net.my.main.MainService;
import net.my.maindao.MainDao;
import net.my.user.User;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping(value = {"/", "/order/write_time"}, method = RequestMethod.GET)
	public String memberList(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("newMembers", mainService.getNewMemberList(paramMap));
		model.addAttribute("hotMembers", mainService.getHotMemberList(paramMap));
		
		return "/main";
	}
	
	
	@RequestMapping(value="/", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<BoardList>> boardList(@RequestParam Map<String, Object> paramMap, HttpServletResponse response){
		ResponseEntity<List<BoardList>> entity = null;
		try {
			entity = new ResponseEntity<>(mainService.getBoardList(paramMap), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="/scroll", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<BoardList>> boardListScroll(@RequestParam(required=true) Integer board_no, HttpServletResponse response){
		
		ResponseEntity<List<BoardList>> entity = null;
		try {
			entity = new ResponseEntity<>(mainService.getBoardListNext(board_no), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value="/order", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<BoardList>> boardListOrder(@RequestParam(required=true) String orderby){
		
	
		
		ResponseEntity<List<BoardList>> entity = null;
		try {
			if(orderby.equals("hits")) {
				
				entity = new ResponseEntity<>(mainService.getBoardList_hits(), HttpStatus.OK);
			} else if(orderby.equals("likes")) {
				entity = new ResponseEntity<>(mainService.getBoardList_like(), HttpStatus.OK);
			} else {
				entity = new ResponseEntity<>(mainService.getBoardList_reply(), HttpStatus.OK);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	//나중에 아작스로 바꿀것
	//추천순 정렬
	@RequestMapping(value="/order/like_count", method = RequestMethod.GET)
	public String boardList_like(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("newMembers", mainService.getNewMemberList(paramMap));
		model.addAttribute("hotMembers", mainService.getHotMemberList(paramMap));
		
		return "/view/main";
	}
	
	//조회순 정렬
	@RequestMapping(value="/order/hits")
	public String boardListOrder_hits(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("newMembers", mainService.getNewMemberList(paramMap));
		model.addAttribute("hotMembers", mainService.getHotMemberList(paramMap));
		
		return "/view/main";
	}
	
	//조회순 정렬
	@RequestMapping(value="/order/reply_count")
	public String boardListOrder_reply(@RequestParam Map<String, Object> paramMap, Model model) {
		
		model.addAttribute("newMembers", mainService.getNewMemberList(paramMap));
		model.addAttribute("hotMembers", mainService.getHotMemberList(paramMap));
		
		return "/view/main";
	}
	
}
