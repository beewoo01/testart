package net.my.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.my.board.BoardService;
import net.my.board.Contact;
import net.my.board.Notice;

@Controller
@RequestMapping("/bbs")
public class BbsController {
	
	@Autowired
    private BoardService boardService;
	
	@RequestMapping(value= "/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String boar, Model model) throws Exception{
		
		//System.out.println("코딩을 끝내러 왔다 2 : "+ list);
		model.addAttribute("list", boardService.getNoticeList());
		return "bbs/list";
		
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write() throws Exception{
		return "bbs/writeform";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Notice notice) {
		boardService.insert(notice);
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view(int notice_no, Model model) {
		boardService.increaseHit(notice_no);
		Notice thisNotice = boardService.getNotice(notice_no);
		model.addAttribute("thisNotice", thisNotice);
		return "bbs/view";
	}
	
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public String contact() throws Exception {
		return "bbs/contact";
	}
	
	@RequestMapping(value="/contact", method=RequestMethod.POST)
	public String contact(Contact contact) throws Exception {
		boardService.Cinsert(contact);
		return "bbs/contact";
	}
	
}
