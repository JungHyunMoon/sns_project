package com.moonstargram.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonstargram.comment.dao.CommentDAO;
import com.moonstargram.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public void addComment(int userId, int postId, String content) {
		commentDAO.insertComment(userId, postId, content);
	}
	
	public List<Comment> getComment() {
		return commentDAO.selectComment();
	}
	
	public void deleteComment(int id) {
		commentDAO.deleteComment(id);
	}
}
