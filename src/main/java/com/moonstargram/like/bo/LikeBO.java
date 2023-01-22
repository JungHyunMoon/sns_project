package com.moonstargram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonstargram.like.dao.LikeDAO;
import com.moonstargram.like.model.Like;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;

	public int getLikeCountByPostId(int postId) {
		int filledLike = likeDAO.selectLikeListByPostId(postId).size();

		return filledLike;
	}

	public boolean isAlreadyLike(int userId, int postId) {
		Like result = likeDAO.selectLikeByUserIdPostId(userId, postId);
		if (result == null) {
			return false;
		} else {
			return true;
		}
	}
	
	public void removeLikeByuserIdPostId(int userId, int postId) {
		likeDAO.deleteLikeByUserIdPostId(userId, postId);
	}
	
	public void addLike(int userId, int postId) {
		likeDAO.insertLike(userId, postId);
	}

}
