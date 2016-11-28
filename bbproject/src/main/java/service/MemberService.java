package service;

import java.util.List;

import dto.LatelyDTO;
import dto.MemberDTO;

public interface MemberService {
	
	public void insertProcess(MemberDTO dto);
	public int idcheckProcess(String id);
	public MemberDTO loginChkProcess(String id, String pw);
	public MemberDTO pwfindProcess(String id,String member_name, String mail);
	public MemberDTO idfindProcess(String member_name, String mail);
	public MemberDTO pwupdProcess(String id,String member_name, String mail, String pw);
	public void leaveProcess(MemberDTO dto);
	public void updateProcess(MemberDTO dto);
	public List<LatelyDTO> latelyProcess(int member_no);
}
