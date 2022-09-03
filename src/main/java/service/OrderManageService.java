package service;

import java.util.List;

import pojo.Myorder;

public interface OrderManageService {
	public List<Myorder> findAllOrder();
	public int addOrder(Myorder myorder);
	public int delOrder(String orderId);
	public List<Myorder>findOrderBySearchKey(String searchKey);
	public int addTime(String orderId);
}
