package service;

import java.util.List;

import pojo.User;

public interface UserManageService {
	public List<User> findUserByUserName(String uname);
	public int changeUserState(int userId);
	public List<User> findAllUser();
	public int addUser(User user);
}
