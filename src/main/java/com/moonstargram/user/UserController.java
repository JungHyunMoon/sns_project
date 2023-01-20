package com.moonstargram.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/moonstargram")
@Controller
public class UserController {

	@Autowired
	
	/**
	 * 로그인 view
	 * @return
	 */
	@GetMapping("/sign_in_view")
	public String main() {
		return "/sign_in";
	}
	
	/**
	 * 회원가입 view
	 * @return
	 */
	@GetMapping("/sign_up_view")
	public String signUp() {
		return "/sign_up";
	}
	
	/**
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("id");
		
		return "redirect:/moonstargram/sign_in_view";
	}
	
//	@GetMapping("/timeline_view")
//	public String timeline(Model model) {
//		model.addAttribute("viewName", "include/timeline");
//		return "/layout";
//	}

}
