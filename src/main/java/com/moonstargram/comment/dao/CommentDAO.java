package com.moonstargram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.moonstargram.comment.model.Comment;

@Repository
public interface CommentDAO {

	public void insertComment(
			@Param("userId") int userId, 
			@Param("postId") int postId, 
			@Param("content") String content);
	
	public List<Comment> selectComment();
	
	public void deleteComment(int id);
	
	public List<Comment> selectCommentListByPostId(int postId);
	
}
