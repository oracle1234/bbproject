package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.LatelyDTO;
import dto.MemberDTO;


public class MemberDaoImp implements MemberDAO {
	
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MemberDaoImp() {
	}

	@Override
	public void insertMethod(MemberDTO dto) {
		sqlSession.insert("member.ins", dto);
	}

	@Override
	public int idcheck(String id) {
		return sqlSession.selectOne("member.ck", id);
	}

	@Override
	public MemberDTO loginChk(String id, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.selectOne("member.login", map);
	}

	@Override
	public MemberDTO idfindMethod(String member_name, String mail) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_name", member_name);
		map.put("mail", mail);
		return sqlSession.selectOne("member.idfind", map);
	}

	@Override
	public MemberDTO pwfindMethod(String id, String member_name, String mail) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("member_name", member_name);
		map.put("mail", mail);
		return sqlSession.selectOne("member.pwfind", map);
	}

	@Override
	public MemberDTO pwupdMethod(String id, String member_name, String mail, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("member_name", member_name);
		map.put("mail", mail);
		map.put("pw", pw);
		return sqlSession.selectOne("member.pwupd", map);
	}

	@Override
	public void deleteMethod(MemberDTO dto) {
		sqlSession.delete("member.del", dto);
		
	}

	@Override
	public void updateMethod(MemberDTO dto) {
		sqlSession.update("member.upd", dto);
	}
		

	public List<LatelyDTO> latelyMethod(int member_no) {
		return sqlSession.selectList("member.lately", member_no);
	}

	@Override
	public void deleteLately(int lately_no) {
		sqlSession.delete("member.dellately", lately_no);
	}

}
