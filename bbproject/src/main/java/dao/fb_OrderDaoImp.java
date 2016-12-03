package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.fb_OrderDTO;

public class fb_OrderDaoImp implements fb_OrderDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public fb_OrderDaoImp() {
	}

	@Override
	public List<fb_OrderDTO> list(int member_no) {
		return sqlSession.selectList("order.list", member_no);
	}

	@Override
	public List<fb_OrderDTO> orderdelete(String member_no, String foods_no, String day) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_no", member_no);
		map.put("foods_no", foods_no);
		map.put("day", day);
		sqlSession.delete("order.delete", map);
		return null;
		
	}

}
