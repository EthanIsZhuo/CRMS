package pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Myorder {
	String orderId;
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
	Date payDate;
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
	Date dueDate;
	float fee;
	Client client;
	String operator;//就是已登录用户的用户名
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public float getFee() {
		return fee;
	}
	public void setFee(float fee) {
		this.fee = fee;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	
	
	
	
}
