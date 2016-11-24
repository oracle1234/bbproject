package service;

import java.util.List;

import dto.LatelyDTO;
import dto.MemberDTO;

public interface MemberService {
	
	public void insertProcess(MemberDTO dto);
	public int idcheckProcess(String id);
	public MemberDTO loginChkProcess(String id, String pw);
	public void pwfindProcess(MemberDTO dto);
	public MemberDTO idfindProcess(String member_name, String mail);
	public List<LatelyDTO> latelyProcess(int member_no);
}
