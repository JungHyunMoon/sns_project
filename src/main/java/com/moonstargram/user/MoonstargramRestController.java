package com.moonstargram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.moonstargram.user.bo.UserBO;
import com.moonstargram.user.model.User;
import com.moonstargram.utils.EncryptUtils;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/moonstargram")
@RestController
public class MoonstargramRestController {

	@Autowired
	private UserBO userBO;
	
	/**
	 * 
	 * @return
	 */
	@ResponseBody
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("email") String email,
			@RequestParam("nickname") String nickname,
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password
			) {
		String hashedPassword = EncryptUtils.md5(password);
		
		userBO.addUser(email, nickname, loginId, hashedPassword);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	/**
	 * 
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session
			) {
		String hashedPassword = EncryptUtils.md5(password);
		
		User user = userBO.getUserByLoginIdPassword(loginId, hashedPassword);
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			session.setAttribute("nickName", user.getNickname());
			session.setAttribute("id", user.getId());
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "아이디 또는 비밀번호를 확인하세요.");
		}
		
		
		return result;
	}
	
	
	
}
