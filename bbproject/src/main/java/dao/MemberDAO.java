package dao;



import dto.MemberDTO;

public interface MemberDAO {
	public void insertMethod(MemberDTO dto);
	public int idcheck(String id);
}//end interface
