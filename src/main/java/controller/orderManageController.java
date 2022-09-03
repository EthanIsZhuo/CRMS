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
		
		// 获得经办人

		String operator = (String) session.getAttribute("haveLogin");
		myorder.setOperator(operator);

		// 生成一个订单号

		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyyMMdd");
		String ot = simpleDateFormat1.format(od);
		String orderId = ot + client.getcSnum() + "";
		
		myorder.setOrderId(orderId);
			
		// 获得缴费日期
		myorder.setPayDate(od);
		
		// 获得到期日期（判断包年包月）		
		  Calendar cal = Calendar.getInstance(); 
		  cal.setTime(od);//设置起时间
		  if(client.getcType()==1) {//包年dueDate日期在payDate日期的基础上加一年
		  cal.add(Calendar.YEAR, 1);//增加一年
		  Date dueDate = cal.getTime();
		  java.sql.Date dd = new java.sql.Date(dueDate.getTime());
		  myorder.setDueDate(dd);
		  myorder.setFee(895);		 
		  }else {	  //包月dueDate日期在payDate日期的基础上加一个月			  		  
		  cal.add(Calendar.MONTH, 1);//增加一个月 myorder.setDueDate(cal.getTime());
		  Date dueDate = cal.getTime();
		  java.sql.Date dd = new java.sql.Date(dueDate.getTime());
		  myorder.setDueDate(dd);
		  myorder.setFee(98);
		  System.out.println("包月"+od+cal.getTime()); 
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
