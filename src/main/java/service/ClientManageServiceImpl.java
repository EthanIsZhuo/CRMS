package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ClientManageDao;
import dao.OrderManageDao;
import pojo.Client;
@Service
public class ClientManageServiceImpl implements ClientManageService {
	@Autowired
	ClientManageDao cDao;
	@Autowired
	OrderManageDao oDao;
	@Override
	public List<Client> findAllClient() {
		// TODO Auto-generated method stub
		return cDao.findAllClient();
	}
	@Override
	public List<Client> findClientByType(int t) {
		// TODO Auto-generated method stub
		return cDao.findClientByType(t);
	}
	@Override
	public List<Client> findClientBySearchKey(String SearchKey) {
		// TODO Auto-generated method stub
		return cDao.findClientBySearchKey(SearchKey);
	}
	@Override
	public int addClient(Client client) {
		// TODO Auto-generated method stub
		cDao.addClient(client);
		
		return client.getCid();
	}
	public int delClient(int id) {
		// TODO Auto-generated method stub
		//同时删除该用户下的订单
		oDao.delOrderByCid(id);		
		return cDao.delClient(id);
	}
	@Override
	public Client findClientById(int id) {
		// TODO Auto-generated method stub
		return cDao.findClientById(id);
	}
	@Override
	public int updateClient(Client client) {
		// TODO Auto-generated method stub
		return cDao.updateClient(client);
	}
	@Override
	public Client findClientBySnum(String cSnum) {
		// TODO Auto-generated method stub
		return cDao.findClientBySnum(cSnum);
	}

}
