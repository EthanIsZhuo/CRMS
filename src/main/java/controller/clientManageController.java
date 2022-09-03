package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Client;

import service.ClientManageService;

@Controller
public class clientManageController {
	@Autowired
	ClientManageService cms;
	@RequestMapping("clientManage")
	public String clientManage(String searchKey,Model model) {
		
		return "clientManage";
	}
	@RequestMapping("checkSnum")
	@ResponseBody
	public String checkSnum(String cSnum) {
		Client c=cms.findClientBySnum(cSnum);
		if(c!=null) {
			return "yes";
		}else {
			return "no";
		}
				
		
	}
	@GetMapping("findClientByType")
	@ResponseBody
	public List<Client> findClientByType(int t,Model model) {
		if(t==-1) {
			List<Client> clientList=cms.findAllClient();
			return clientList;
		}else {
		
		List<Client> clientList=cms.findClientByType(t);
		
		return clientList;
		}
	}
	
	
	@RequestMapping("findAllClient")
	@ResponseBody
	public List<Client> findAllClient() {
		List<Client> clientList=cms.findAllClient();
		
		return clientList;
	}
	
	
	@GetMapping("findClientBysearchKey")
	@ResponseBody
	public List<Client> findClientBysearchKey(String searchKey) {
		List<Client> clientList=cms.findClientBySearchKey(searchKey);
		
		return clientList;
	}
	
	@RequestMapping("findClientById")
	@ResponseBody
	public Client findClientById(String cid) {
		int id=Integer.parseInt(cid);
		
		
		Client client=cms.findClientById(id);
		
		return client;
	}
	
	@RequestMapping("delClient")
	@ResponseBody
	public List<Client> delClient(String id) {
		int cid=Integer.parseInt(id);
	
		cms.delClient(cid);
		List<Client> clientList=cms.findAllClient();
		return clientList;
	}
	
	@RequestMapping("updateClient")
	@ResponseBody
	public List<Client> updateClient(@RequestBody Client client){
		cms.updateClient(client);
		List<Client> clientList=cms.findAllClient();
		return clientList;
	}
}
