package pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Neworder {
	//����һ���¶����࣬����ͻ���Ϣ���µ����ڣ����ǰ�˴��ݿͻ������һ���ַ���������
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
