package com.moonstargram.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moonstargram.like.bo.LikeBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/moonstargram")
@Controller
public class MoonstargramController {

	@Autowired
	private LikeBO likeBO;
	
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
	
	@GetMapping("/timeline_view")
	public String timeline() {
		
		return "/timeline";
	}
	
	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("id");
		
		return "redirect:/moonstargram/sign_in_view";
	}
}
