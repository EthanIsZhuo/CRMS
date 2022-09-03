package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserManageDao;
import pojo.User;
@Service
public class UserManageServiceImpl implements UserManageService {
@Autowired
UserManageDao umDao;
	public List<User> findUserByUserName(String uname) {
		// TODO Auto-generated method stub
		return umDao.findUserByUserName(uname);
	}
	@Override
	public int changeUserState(int userId) {
		// TODO Auto-generated method stub
		return umDao.changeUserState(userId);
	}
	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return umDao.findAllUser();
	}
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return umDao.addUser(user);
	}
	
	

}
