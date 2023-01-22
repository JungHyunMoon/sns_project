package com.moonstargram.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moonstargram.like.bo.LikeBO;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;

	// /like?postId=13		@RequestParam
	// /like/13				@RathVariable
	@GetMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable int postId) {
		//
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "success");
		
		return result;
	}
	
	@PostMapping("/like")
	public Map<String, Object> isAlreadyLike(
			@RequestParam("userId") int userId,
			@RequestParam("postId") int postId
			) {
		boolean isAlreadyLike = likeBO.isAlreadyLike(userId, postId);
		
		if (isAlreadyLike == true) {
			likeBO.removeLikeByuserIdPostId(userId, postId);
		} else {
			likeBO.addLike(userId, postId);
		}
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", isAlreadyLike);
		
		return result;
	}

	@PostMapping("/like_create")
	public Map<String, Object> like(
			@RequestParam("userId") int userId,
			@RequestParam("postId") int postId
			) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "success");
		
		return result;
	}
	
}
