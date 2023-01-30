package com.moonstargram.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.moonstargram.post.bo.PostBO;

import jakarta.servlet.http.HttpSession;

@RestController
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/uploadImage")
    public Map<String, Object> uploadFile(
    		@RequestParam("file") MultipartFile file,
    		HttpSession session
    		) {
		String nickname = (String)session.getAttribute("nickName");
		String imagePath = postBO.getAddedImage(nickname, file);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		result.put("imagePath", imagePath);
        return result;
    }
	
	@PostMapping("/post_create")
	public Map<String, Object> create(
			@RequestParam("content") String content,
			@RequestParam("imagePath") MultipartFile imagePath,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500); // 비로그인 상태
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요.");
			return result;
		}
		
		postBO.addPost(userId, content, imagePath);
		
		result.put("code", 1);
		result.put("result", "성공");
		return result;
	}
	
	@DeleteMapping("/delete_post")
	public Map<String, Object> deletePost(
			@RequestParam("postId") int postId
			) {
		
		int deleteRow = postBO.deletePostByPostId(postId);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
