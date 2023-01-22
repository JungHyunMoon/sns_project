package com.moonstargram.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonstargram.comment.dao.CommentDAO;
import com.moonstargram.comment.model.Comment;
import com.moonstargram.comment.model.CommentView;
import com.moonstargram.user.bo.UserBO;
import com.moonstargram.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private UserBO userBO;
	
	public void addComment(int userId, int postId, String content) {
		commentDAO.insertComment(userId, postId, content);
	}
	
	public List<Comment> getComment() {
		return commentDAO.selectComment();
	}
	
	public void deleteComment(int id) {
		commentDAO.deleteComment(id);
	}
	
	private List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	// input : 글번호
	// output : 글번호에 해당하는 댓글목록(댓글쓴이 정보)을 가져온다.
	public List<CommentView> generateCommentViewListByPostId(int postId) {
		
		// 결과물
		List<CommentView> commentViewList = new ArrayList<>();
		
		// 댓글 목록
		List<Comment> commentList = getCommentListByPostId(postId);		
		
		// 반복문 => commentView => 결과물에 넣는다
		for (Comment item : commentList) {
			CommentView commentView = new CommentView();
			commentView.setComment(item);
			
			// 댓글쓴이
			User user = userBO.getUserById(item.getUserId());
			commentView.setUser(user);
			
			commentViewList.add(commentView);
		}
		
		// return
		return commentViewList;
	}
}
