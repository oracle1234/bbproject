package dao;



import java.util.List;

import dto.LatelyDTO;
import dto.MemberDTO;

public interface MemberDAO {
	public void insertMethod(MemberDTO dto);
	public int idcheck(String id);
	public MemberDTO loginChk(String id, String pw);
	public MemberDTO idfindMethod(String member_name, String mail);
	public MemberDTO pwfindMethod(String id, String member_name, String mail);
	public MemberDTO pwupdMethod(String id, String member_name, String mail, String pw);
	public void updateMethod(MemberDTO dto);
	public void deleteMethod(MemberDTO dto);
	void deleteLately(int lately_no);
	public List<LatelyDTO> latelyMethod(int member_no);
}//end interface
