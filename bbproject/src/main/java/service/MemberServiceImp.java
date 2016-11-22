package service;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemberServiceImp implements MemberService{
	private MemberDAO dao;

	public MemberServiceImp() {

	}
	
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertProcess(MemberDTO mdto) {
		dao.insertMethod(mdto);
		
	}

	@Override
	public int idcheckProcess(String id) {
		return dao.idcheck(id);
	}


}
