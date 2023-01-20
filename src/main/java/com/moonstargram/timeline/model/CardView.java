package com.moonstargram.timeline.model;

import com.moonstargram.post.model.Post;
import com.moonstargram.user.model.User;

// view용 객체
public class CardView {

	// 글 1개
	private Post post;

	// 글쓴이 정보
	private User user;

	// 댓글 N개
//	private Comment comment;

	// 좋아요 개수

	// 내가(로그인 된 사람) 좋아요를 눌렀는지 (boolean)

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
