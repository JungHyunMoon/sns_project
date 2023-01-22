package com.moonstargram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moonstargram.user.dao.UserDAO;
import com.moonstargram.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public void addUser(String email, String nickname, String loginId, String password) {
		userDAO.insertUser(email, nickname, loginId, password);
	}
	
	public User getUserByLoginIdPassword(String loginId, String password) {
		return 	userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
	public User getUserById(int userId) {
		return 	userDAO.getUserById(userId);
	}
}
