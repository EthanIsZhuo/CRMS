package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.User;

public interface UserManageDao {
	//�����û�������ģ����ѯ
	@Select("select * from user where userName like concat('%',#{uname},'%')")
	public List<User> findUserByUserName(String uname);
	//���������û�
	@Select("select * from user ")
	public List<User> findAllUser();
	//�޸��û�״̬
	@Update("update user SET userState=ABS(userState-1) WHERE userId=#{userId}")
	public int changeUserState(int userId);
	
	//���
	@Insert("insert into user(userName,userPwd,userState) values(#{userName},#{userPwd},#{userState}) 	")
	public int addUser(User user);
	

}
