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

	@Override
	public MemberDTO loginChkProcess(String id, String pw) {
		return dao.loginChk(id, pw);
	}

	@Override
	public void pwfindProcess(MemberDTO mdto) {
		dao.pwfindMethod(mdto);
	}

	@Override
	public MemberDTO idfindProcess(String member_name, String mail) {
		return dao.idfindMethod(member_name, mail);
	}


}
