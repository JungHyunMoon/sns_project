package com.moonstargram.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moonstargram.comment.bo.CommentBO;
import com.moonstargram.comment.model.Comment;

@RestController
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;

	/**
	 * 댓글 추가하기
	 * @param userId
	 * @param postId
	 * @param content
	 * @param model
	 * @return
	 */
	@PostMapping("/comment_create")
	public Map<String, Object> addComment(
			@RequestParam("userId") int userId,
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			Model model
			) {
		
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
