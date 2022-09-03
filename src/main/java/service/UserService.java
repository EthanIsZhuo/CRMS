package service;



import pojo.User;

public interface UserService {
	
	public User checkUser(String userName);
	public int regUser(User user);
	public User loginUser(User user);
	public User findByName(String userName);


}
