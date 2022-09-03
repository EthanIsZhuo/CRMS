package dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.User;

public interface UserManageDao {
	//根据用户名进行模糊查询
	@Select("select * from user where userName like concat('%',#{uname},'%')")
	public List<User> findUserByUserName(String uname);
	//查找所有用户
	@Select("select * from user ")
	public List<User> findAllUser();
	//修改用户状态
	@Update("update user SET userState=ABS(userState-1) WHERE userId=#{userId}")
	public int changeUserState(int userId);
	
	//添加
	@Insert("insert into user(userName,userPwd,userState) values(#{userName},#{userPwd},#{userState}) 	")
	public int addUser(User user);
	

}
