package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.Client;



public interface ClientManageDao {
	
	//查询全部信息
	@Select("select * from client ")
	public List<Client> findAllClient();
	
	//根据关键字
	@Select("select * from client where cSnum like concat('%',#{SearchKey},'%') or cName like concat('%',#{SearchKey},'%') or cPhone like concat('%',#{SearchKey},'%') or cDob like concat('%',#{SearchKey},'%') or cDno like concat('%',#{SearchKey},'%')")
	public List<Client> findClientBySearchKey(String SearchKey);
	@Select("select * from client where cName like concat('%',#{SearchKey},'%')")
	public List<Client> findClientByName(String SearchKey);
	
	//根据id
	@Select("select * from client where cid=#{id}")
	public Client findClientById(int id);
	//根据学号
		@Select("select * from client where cSnum=#{cSnum}")
		public Client findClientBySnum(String cSnum);
	
	//按照客户类型查询
	@Select("select * from client where cType=#{t}")
	 public List<Client> findClientByType(int t);
	
	//添加客户
	@Insert("insert into client(cSnum,cName,cType,cPhone,cDob,cDno) values(#{cSnum},#{cName},#{cType},#{cPhone},#{cDob},#{cDno})") 
	@Options(useGeneratedKeys = true, keyProperty = "cid", keyColumn = "cid")
	public int addClient(Client client);
	
	
	//删除用户
	@Delete("delete from client where cid=#{cid}")
	public int delClient(int id);

	
	//更新用户
	@Update("update client set cSnum=#{cSnum},cName=#{cName},cType=#{cType},cPhone=#{cPhone},cDob=#{cDob},cDno=#{cDno} where cid=#{cid}")
	public int updateClient(Client client);
	
	
	
}
