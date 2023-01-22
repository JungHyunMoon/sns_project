package com.moonstargram.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moonstargram.comment.bo.CommentBO;

import jakarta.servlet.http.HttpSession;

@RestController
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;

	/**
	 * 댓글 추가하기
	 * @param postId
	 * @param content
	 * @return
	 */
	@PostMapping("/comment_create")
	public Map<String, Object> addComment(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpSession session
			) {
		
		int userId = (int)session.getAttribute("userId");
		commentBO.addComment(userId, postId, content);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
	@PostMapping("/comment_delete")
	public Map<String, Object> deleteComment(
			@RequestParam("id") int id
			) {
		
		commentBO.deleteComment(id);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
}
