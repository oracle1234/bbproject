package dao;

import java.util.List;

import dto.MemberDTO;

public interface MemberDAO {
	public void insertMethod(MemberDTO dto);
	public List<MemberDTO> idcheck(String id);
	public MemberDTO loginChk(String id, String pw);
}//end interface
