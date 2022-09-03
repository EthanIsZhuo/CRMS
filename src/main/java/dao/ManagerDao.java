package dao;

import org.apache.ibatis.annotations.Select;

import pojo.Manager;

public interface ManagerDao {
	@Select("select * from manager where mName=#{mName} and mPwd=#{mPwd}")
	public Manager loginManager(Manager manager);
}
