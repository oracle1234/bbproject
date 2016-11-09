package service;

import dao.DAO;

public class ServiceImp implements Service{
	private DAO dao;
	
	public ServiceImp() {
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	
}
