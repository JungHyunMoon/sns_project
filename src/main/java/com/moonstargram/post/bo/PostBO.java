package com.moonstargram.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.moonstargram.common.FileManagerService;
import com.moonstargram.post.dao.PostDAO;
import com.moonstargram.post.model.Post;

@Service
public class PostBO {

	private Logger logger = LoggerFactory.getLogger(PostBO.class);
//	private Logger logger = LoggerFactory.getLogger(this.getClass());
//	logger.warn("[PUT post] 입력할 사진이 있습니다. userId{}");
	
	@Autowired
	private PostDAO postDAO;

	@Autowired
	private FileManagerService fileManager;
	
	public String getAddedImage(String nickname, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			imagePath = fileManager.saveFile(nickname, file);
		}
		
		return imagePath;
	}

	public int addPost(int userId, String content, MultipartFile imagePath) {
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	public int deletePostByPostId(int postId) {
		Post post = postDAO.selectPostList().get(0);
		if (post == null) {
			logger.warn("[글 삭제] post is null.");
			return 0;
		}
		
		// 업로드 있으면 파일 삭제
		if (post.getImagePath() != null) {
			fileManager.deleteFile(post.getImagePath());
		}
 		
		postDAO.deletePostByPostId(postId);
		return 1;
	}

	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
}