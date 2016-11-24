package service;

import java.util.ArrayList;
import java.util.List;

import dao.MemberDAO;
import dto.LatelyDTO;
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

	@Override
	public List<LatelyDTO> latelyProcess(int member_no) {
		List<LatelyDTO> list = new ArrayList<LatelyDTO>();
		list = dao.latelyMethod(member_no);
		
		int len = list.size();
		
		for (int i = 0; i < len; i++) {
			if (i > 2) {
				dao.deleteLately(list.get(3).getLately_no());
				list.remove(3);
			}
		}
		
		return list;
	}


}
