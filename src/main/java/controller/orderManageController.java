package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Client;
import pojo.Myorder;
import pojo.Neworder;
import service.ClientManageService;
import service.OrderManageService;

@Controller
public class orderManageController {
	@Autowired
	OrderManageService oms;
	@Autowired
	ClientManageService cms;

	@GetMapping("orderManage")
	public String orderManage() {
		return "orderManage";
	}

	@RequestMapping("findAllOrder")
	@ResponseBody
	public List<Myorder> findAllOrder() {
		System.out.println("cha");
		List<Myorder> orderlist = oms.findAllOrder();
		return orderlist;
	}
	@GetMapping("findOrderBySearchKey")
	@ResponseBody
	public List<Myorder> findOrderBySearchKey(String searchKey){
		List<Myorder> orderlist=oms.findOrderBySearchKey(searchKey);
		
		return orderlist;
	}

	@RequestMapping("placeOrder")
	@ResponseBody
	public List<Client> placeOrder(@RequestBody Neworder neworder, HttpSession session) throws ParseException {
		Myorder myorder = new Myorder();
		Client client = new Client();
		client = neworder.getClient();
		String time = neworder.getOrderDate();
		SimpleDateFormat simpleDateFormatnew = new SimpleDateFormat("yyyy-MM-dd");
		Date orderDate = simpleDateFormatnew.parse(time);
		java.sql.Date od = new java.sql.Date(orderDate.getTime());
		
		// ��þ�����

		String operator = (String) session.getAttribute("haveLogin");
		myorder.setOperator(operator);

		// ����һ��������

		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyyMMdd");
		String ot = simpleDateFormat1.format(od);
		String orderId = ot + client.getcSnum() + "";
		
		myorder.setOrderId(orderId);
			
		// ��ýɷ�����
		myorder.setPayDate(od);
		
		// ��õ������ڣ��жϰ�����£�		
		  Calendar cal = Calendar.getInstance(); 
		  cal.setTime(od);//������ʱ��
		  if(client.getcType()==1) {//����dueDate������payDate���ڵĻ����ϼ�һ��
		  cal.add(Calendar.YEAR, 1);//����һ��
		  Date dueDate = cal.getTime();
		  java.sql.Date dd = new java.sql.Date(dueDate.getTime());
		  myorder.setDueDate(dd);
		  myorder.setFee(895);		 
		  }else {	  //����dueDate������payDate���ڵĻ����ϼ�һ����			  		  
		  cal.add(Calendar.MONTH, 1);//����һ���� myorder.setDueDate(cal.getTime());
		  Date dueDate = cal.getTime();
		  java.sql.Date dd = new java.sql.Date(dueDate.getTime());
		  myorder.setDueDate(dd);
		  myorder.setFee(98);
		  System.out.println("����"+od+cal.getTime()); 
		  }		 		  		  
			 int cid=cms.addClient(client);			
			 client.setCid(cid);
			 myorder.setClient(client);
		  
		 oms.addOrder(myorder);
		 

		List<Client> clientlist = cms.findAllClient();

		return clientlist;

	}
	@RequestMapping("delOrder")
	@ResponseBody
	public List<Myorder> delOrder(String orderId){
		oms.delOrder(orderId);
		List<Myorder> orderlist= oms.findAllOrder();
		return orderlist;
	}
	
	@RequestMapping("addTime")
	@ResponseBody
	public List<Myorder> addTime(String orderId){
		oms.addTime(orderId);
		List<Myorder> orderlist= oms.findAllOrder();
		return orderlist;
	}
}
