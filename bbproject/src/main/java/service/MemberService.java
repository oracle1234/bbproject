package service;

import dto.MemberDTO;

public interface MemberService {
	
	public void insertProcess(MemberDTO dto);
	public int idcheckProcess(String id);
	public MemberDTO loginChkProcess(String id, String pw);
	public MemberDTO pwfindProcess(String id,String member_name, String mail);
	public MemberDTO idfindProcess(String member_name, String mail);
	public MemberDTO pwupdProcess(String id,String member_name, String mail, String pw);
	public void updateProcess(MemberDTO dto);
	public void leaveProcess(MemberDTO dto);
}
