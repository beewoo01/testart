package net.my.sub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("sub")
public class SubController {

	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String sub() throws Exception{
		
		return "sub/upload";
	}
	
}
