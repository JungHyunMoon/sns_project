package com.moonstargram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.moonstargram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId, 
			@Param("content") String content, 
			@Param("imagePath") MultipartFile imagePath);

	public List<Post> selectPostList();
	
	public void deletePostByPostId(int postId);
}