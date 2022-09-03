package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ManagerDao;
import pojo.Manager;
@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	ManagerDao managerDao;
	
	public Manager LoginManager(Manager manager) {
		// TODO Auto-generated method stub
		return managerDao.loginManager(manager);
	}

}
