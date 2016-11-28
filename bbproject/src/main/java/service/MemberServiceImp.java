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
	public MemberDTO idfindProcess(String member_name, String mail) {
		return dao.idfindMethod(member_name, mail);
	}

	@Override
	public MemberDTO pwfindProcess(String id, String member_name, String mail) {
		return dao.pwfindMethod(id, member_name, mail);
	}

	@Override
	public MemberDTO pwupdProcess(String id, String member_name, String mail, String pw) {
		return dao.pwupdMethod(id, member_name, mail, pw);
	}

	@Override
	public void updateProcess(MemberDTO mdto) {
		dao.updateMethod(mdto);
		
	}

	@Override
	public void leaveProcess(MemberDTO mdto) {
		dao.deleteMethod(mdto);
		
	}


}
