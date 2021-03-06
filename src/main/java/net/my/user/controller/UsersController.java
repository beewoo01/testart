package net.my.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import net.my.user.User;
import net.my.user.UserService;

@Controller
@RequestMapping("/users")
public class UsersController {
	
	@Autowired
	private UserService userService;

		@RequestMapping(value="/signUp", method=RequestMethod.GET)
		public String signUp() {
			System.out.println("하이111111111");
			return "users/signUp";
		}
		
		@RequestMapping(value="/signUp", method=RequestMethod.POST)
		public String signUp(User user) throws Exception{
			System.out.println("하이222222222");
			userService.insert(user);
			return "users/welcome";
		}
		
		@RequestMapping(value="/login", method=RequestMethod.GET)
		public String login() {
			return "users/login";
		}
		
		@RequestMapping(value="/login", method=RequestMethod.POST)
		public String login(String email, String password, HttpSession session) throws Exception {
			User loginUser = userService.login(email, password);
			if(loginUser != null) {
				session.setAttribute("check", loginUser);
				System.out.println("ㅎ하하하하ㅏ하하하3123213213");
				// 로그인 성공 시 메인페이지 이동
				return "redirect:/";
			}else {
				return "users/login";
				
			}
		}
		
		@RequestMapping(value="/editAccount", method=RequestMethod.GET)
		public String editAccount() {
			return "users/editAccount";
		}
		
		@RequestMapping(value="editAccount", method=RequestMethod.POST )
		public String editAccount(User user, HttpSession session) throws Exception{
			User loginUser = (User) session.getAttribute("check");
			String email = loginUser.getEmail();
			
			if(user.getName() == null) {
				user.setName(loginUser.getName());
			}
			if(user.getMember_url() == null) {
				user.setMember_url(loginUser.getMember_url());
			}
			
			user.setEmail(email);
			int check = userService.modify(user);
			if(check == 1) {
				session.setAttribute("check", user);
			}
			return "users/changePasswd";
			
		}
		
		@RequestMapping(value = "/changePasswd", method=RequestMethod.GET)
		public String changePasswd() {
			return "users/changePasswd";
		}
		
		@RequestMapping(value="/changePasswd", method=RequestMethod.POST)
		public String changePasswd(String password, HttpSession session) throws Exception{
			String email = ((User)session.getAttribute("check")).getEmail();
			
			User user = new User();
			user.setEmail(email);
			user.setPassword(password);
			
			userService.changePasswd(user);
			return "users/confirm";
		}
		
		@RequestMapping(value="/bye", method=RequestMethod.GET)
		public String bye(HttpSession session) {
			User user = (User)session.getAttribute("check");
			userService.byeMember(user);
			session.invalidate();
			return "users/login";
		}
		
		@RequestMapping(value="/logout", method=RequestMethod.GET)
		public String logout(HttpSession session) {
			session.removeAttribute("check");
			return "users/login";
		}
		
		
}

