package com.moonstargram.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.moonstargram.like.model.Like;

@Repository
public interface LikeDAO {

	public List<Like> selectLikeListByPostId(int postId);
	
	public Like selectLikeByUserIdPostId(
			@Param("userId") int userId,
			@Param("postId") int postId
			);
	
	public void deleteLikeByUserIdPostId(
			@Param("userId") int userId,
			@Param("postId") int postId
			);
	
	public void insertLike(
			@Param("userId") int userId,
			@Param("postId") int postId
			);
}
