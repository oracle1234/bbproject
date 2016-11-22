package service;

import dto.MemberDTO;

public interface MemberService {
	
	public void insertProcess(MemberDTO mdto);
	public int idcheckProcess(String id);

}
