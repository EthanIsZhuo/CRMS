package pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Neworder {
	//创建一个新订单类，保存客户信息和下单日期，解决前端传递客户对象和一个字符串的问题
	Client client;
	
	
	
	
	/*
	 * @DateTimeFormat(pattern="yyyy-MM-dd")
	 * 
	 * @JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
	 */
	String orderDate;


	public Client getClient() {
		return client;
	}


	public void setClient(Client client) {
		this.client = client;
	}


	public String getOrderDate() {
		
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	
	
}
