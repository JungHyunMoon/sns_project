package com.moonstargram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.moonstargram.common.FileManagerService;
import com.moonstargram.post.dao.PostDAO;
import com.moonstargram.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private FileManagerService fileManager;
	
	public String getAddedImage(String userId, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManager.saveFile(userId, file);
		}
		
		return imagePath;
	}

	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManager.saveFile(userLoginId, file);
		}

		return postDAO.insertPost(userId, content, imagePath);
	}

	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
}