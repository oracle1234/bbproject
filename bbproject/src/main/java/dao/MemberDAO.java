package dao;



import dto.MemberDTO;

public interface MemberDAO {
	public void insertMethod(MemberDTO dto);
	public int idcheck(String id);
	public MemberDTO loginChk(String id, String pw);
}//end interface
