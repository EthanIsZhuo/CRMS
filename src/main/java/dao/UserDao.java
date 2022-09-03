package dao;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import pojo.User;
public interface UserDao {

	//检查数据库中是否存在重名用户
	@Select("select * from user where userName=#{name}")
	public User checkUser(String name);
	
	//注册
	@Insert("insert into user(userName,userPwd,userState) values(#{userName},#{userPwd},1) 	")
	public int regUser(User user);
	
	//登录
	@Select("select * from user where userName=#{userName} and userPwd=#{userPwd}")
	public User loginUser(User user);
	
	
	//根据用户名查询
	@Select("select * from user where userName=#{userName}")
	public User findByName(String userName);
	
	
	
	
}
