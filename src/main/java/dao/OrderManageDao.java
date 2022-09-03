package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.Client;
import pojo.Myorder;

public interface OrderManageDao {
	/* public int addOrder(Client client,String operator); */
	

	public List<Myorder> findAllOrder();
	
	//添加订单
	@Insert("insert into myorder(orderId,cid,payDate,dueDate,fee,payType,operator) values(#{orderId},#{client.cid},#{payDate},#{dueDate},#{fee},#{client.cType},#{operator})")
	public int addOrder(Myorder myorder);
	
	@Delete("delete from myorder where orderId=#{orderId}")
	public int delOrder(String orderId);
	
	//根据cid删除：用于删除客户时级联删除
	@Delete("delete from myorder where cid=#{cid}")
	public int delOrderByCid(int cid);
	
	public List<Myorder>findOrderBySearchKey(String searchKey);
	
	public Myorder findOrderById(String orderId);
	
	public Myorder findOrderByCid(int cid);
	@Update("UPDATE myorder SET dueDate=DATE_ADD(dueDate,INTERVAL 1 YEAR),fee=fee+895 WHERE orderId=#{orderId}")
	public int addYearTime(String orderId);
	@Update("UPDATE myorder SET dueDate=DATE_ADD(dueDate,INTERVAL 1 MONTH),fee=fee+98 WHERE orderId=#{orderId}")
	public int addMonthTime(String orderId);
}
