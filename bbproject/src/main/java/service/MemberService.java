package service;


import java.util.List;

import dto.MemberDTO;

public interface MemberService {
	
	public void insertProcess(MemberDTO mdto);
	public List<MemberDTO> idcheckProcess(String id);
	public MemberDTO loginChkProcess(String id, String pw);
}
