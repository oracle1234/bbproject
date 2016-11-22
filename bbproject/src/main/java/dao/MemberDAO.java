package dao;

import java.util.List;

import dto.MemberDTO;

public interface MemberDAO {
	public void insertMethod(MemberDTO dto);
	public List<MemberDTO> idcheck(String id);
}//end interface
