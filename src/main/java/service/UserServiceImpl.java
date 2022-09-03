package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import pojo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	public User checkUser(String userName) {
		// TODO Auto-generated method stub
	
		return userDao.checkUser(userName);
	}

	@Override
	public int regUser(User user) {
		// TODO Auto-generated method stub
		return userDao.regUser(user);
	}

	@Override
	public User loginUser(User user) {
		// TODO Auto-generated method stub
		return userDao.loginUser(user);
	}

	@Override
	public User findByName(String userName) {
		// TODO Auto-generated method stub
		return userDao.findByName(userName);
	}



}
