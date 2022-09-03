package service;

import java.util.List;

import pojo.Client;


public interface ClientManageService {
	public List<Client> findAllClient();
	public List<Client> findClientByType(int t);
	public List<Client> findClientBySearchKey(String SearchKey);
	public int addClient(Client client);
	public int delClient(int id);
	public Client findClientById(int id);
	public int updateClient(Client client);
	public Client findClientBySnum(String cSnum);
}
