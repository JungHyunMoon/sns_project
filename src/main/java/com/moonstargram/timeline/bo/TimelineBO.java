package com.moonstargram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonstargram.comment.bo.CommentBO;
import com.moonstargram.comment.model.CommentView;
import com.moonstargram.like.bo.LikeBO;
import com.moonstargram.post.bo.PostBO;
import com.moonstargram.post.model.Post;
import com.moonstargram.timeline.model.CardView;
import com.moonstargram.user.bo.UserBO;
import com.moonstargram.user.model.User;

import jakarta.servlet.http.HttpSession;

@Service
public class TimelineBO {
	
	@Autowired
	private PostBO postBO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private LikeBO likeBO;

	// 로그인이 되지 않은 사람도 카드 목록이 보여야 한다.
	public List<CardView> generateCardList(HttpSession session) {
		
		// 글목록 가져오기(Post)
		List<CardView> cardViewList = new ArrayList<>();
		List<Post> postList = postBO.getPostList();
		
		// postList 반복문 => CardView => cardViewList에 넣는다
		for (Post item : postList) {
			
			// post
			CardView cardView = new CardView();
			cardView.setPost(item);
			
			// user
			int userId = item.getUserId();
			User user = userBO.getUserById(userId);
			cardView.setUser(user);
			
			// comment
			int postId = item.getId();
			List<CommentView> commentList = commentBO.generateCommentViewListByPostId(postId);
			cardView.setCommentList(commentList);
			
			// like
			cardView.setFilledLike(likeBO.getLikeCountByPostId(postId));
			
			// 하트
			cardView.setAlreadyLike(likeBO.isAlreadyLike((int)session.getAttribute("userId"), postId));
			
			// add
			cardViewList.add(cardView);
		}
		
		
		
		return cardViewList;
	}
}
