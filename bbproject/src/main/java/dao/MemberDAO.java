package dao;



import java.util.List;

import dto.LatelyDTO;
import dto.MemberDTO;

public interface MemberDAO {
	public void insertMethod(MemberDTO dto);
	public int idcheck(String id);
	public MemberDTO loginChk(String id, String pw);
	public void pwfindMethod(MemberDTO dto);
	public MemberDTO idfindMethod(String member_name, String mail);
	public List<LatelyDTO> latelyMethod(int member_no);
	public void deleteLately(int lately_no);
}//end interface
