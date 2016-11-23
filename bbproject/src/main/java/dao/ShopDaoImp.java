package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.FoodsDTO;
import dto.ReviewDTO;
import dto.shop_PageDTO;

public class ShopDaoImp implements ShopDAO {

	private SqlSessionTemplate sqlSession;

	public ShopDaoImp() {
		// TODO Auto-generated constructor stub
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FoodsDTO> shopList(int foods_no) {
		return sqlSession.selectList("shop.shop_list", foods_no);
	}

	@Override
	public int count(int category_no) {
		return sqlSession.selectOne("shop.count", category_no);
		
	}

	@Override
	public List<FoodsDTO> pageList(HashMap<String, Object> map) {
		return sqlSession.selectList("shop.page_list", map);
	}

	@Override
	public List<ReviewDTO> reviewList(int foods_no) {
		return sqlSession.selectList("shop.review_list", foods_no);
	}

	@Override
	public int reviewCount(int foods_no) {
		return sqlSession.selectOne("shop.reviewCount", foods_no);
	}

	@Override
	public List<ReviewDTO> reviewPageList(HashMap<String, Object> map) {
		return sqlSession.selectList("shop.review_page_list", map);
	}

	@Override
	public String insertFoods(FoodsDTO dto) {
		sqlSession.insert("shop.insert", dto);
		return "adminfoods"; 
	}


}
