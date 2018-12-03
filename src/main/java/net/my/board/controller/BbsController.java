package net.my.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.my.board.BoardService;
import net.my.board.Notice;

@Controller
@RequestMapping("/bbs")
public class BbsController {
	
	@Autowired
    private BoardService boardService;
	
	@RequestMapping(value= "/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String boar, Model model) throws Exception{
		
		ArrayList<Notice> list = boardService.getNoticeList();
		System.out.println("코딩을 끝내러 왔다 2 : "+ list);
		model.addAttribute("list", list);
		
		return "bbs/list";
		
	}
	
}