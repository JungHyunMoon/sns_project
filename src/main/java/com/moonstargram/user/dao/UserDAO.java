package com.moonstargram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.moonstargram.user.model.User;

@Repository
public interface UserDAO {

	public void insertUser(
			@Param("email") String email, 
			@Param("nickname")String nickname, 
			@Param("loginId")String loginId, 
			@Param("password")String password);
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public User getUserById(int userId);
}
