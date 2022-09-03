package dao;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import pojo.User;
public interface UserDao {

	//������ݿ����Ƿ���������û�
	@Select("select * from user where userName=#{name}")
	public User checkUser(String name);
	
	//ע��
	@Insert("insert into user(userName,userPwd,userState) values(#{userName},#{userPwd},1) 	")
	public int regUser(User user);
	
	//��¼
	@Select("select * from user where userName=#{userName} and userPwd=#{userPwd}")
	public User loginUser(User user);
	
	
	//�����û�����ѯ
	@Select("select * from user where userName=#{userName}")
	public User findByName(String userName);
	
	
	
	
}
