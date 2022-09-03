package service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ClientManageDao;
import dao.OrderManageDao;
import pojo.Client;
import pojo.Myorder;
@Service
public class OrderManageServiceImpl implements OrderManageService {
	
	@Autowired
	OrderManageDao omd;
	@Autowired
	ClientManageDao cmd;
	@Override
	public List<Myorder> findAllOrder() {
		// TODO Auto-generated method stub
		
		return omd.findAllOrder();
	}

	@Override
	public int addOrder(Myorder myorder) {
		// TODO Auto-generated method stub
		return omd.addOrder(myorder);
	}

	@Override
	public int delOrder(String orderId) {
		// TODO Auto-generated method stub
		return omd.delOrder(orderId);
	}

	@Override
	public List<Myorder> findOrderBySearchKey(String searchKey) {
		// TODO Auto-generated method stub
		List<Myorder> mylist = omd.findOrderBySearchKey(searchKey);
		if(searchKey.equals("")) {
			return mylist;
		}else {
			List<Client> list1=cmd.findClientByName(searchKey);
			for(int i=0;i<list1.size();i++){  
				mylist.add(omd.findOrderByCid(list1.get(i).getCid()));
	        }  
			return mylist;
		}
		
	}

	@Override
	public int addTime(String orderId) {
		// TODO Auto-generated method stub		
		Myorder myorder=omd.findOrderById(orderId);
		int payType=myorder.getClient().getcType();		
		if(payType==0) {
			return omd.addMonthTime(orderId);
			
		}else {
			
			return omd.addYearTime(orderId);
		}
		 
		
	}
	
}
