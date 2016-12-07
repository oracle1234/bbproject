package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.FoodsDTO;
import dto.ReviewDTO;
import dto.fb_BasketDTO;
import dto.fb_CouponDTO;
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
	public void reviewInsertList(HashMap<String, Object> map) {
		sqlSession.insert("shop.reviewInsert", map);
	}

	@Override
	public void reviewDeleteList(HashMap<String, Object> deleteMap) {
		sqlSession.delete("shop.reviewDelete", deleteMap);

	}

	@Override
	public void reviewUpdateList(HashMap<String, Object> updateMap) {
		sqlSession.update("shop.reviewUpdate", updateMap);
	}

	@Override
	public void basketInsertList(HashMap<String, Object> map) {
		sqlSession.insert("shop.basketInsert", map);
	}

	@Override
	public FoodsDTO buyList(int foods_no) {
		return sqlSession.selectOne("shop.buy_list", foods_no);
	}

	public String insertFoods(FoodsDTO dto) {
		sqlSession.insert("shop.insert", dto);
		return "adminfoods";
	}

	@Override
	public List<FoodsDTO> deletFoodsProcess(FoodsDTO dto) {
		sqlSession.delete("shop.del", dto.getFoods_no());
		return sqlSession.selectList("shop.adminlist", 0);
	}

	@Override
	public List<FoodsDTO> adminFoodsListProcess(int category_no) {
		return sqlSession.selectList("shop.adminlist", category_no);
	}

	@Override
	public FoodsDTO getFoodProcess(int foods_no) {
		return sqlSession.selectOne("shop.food", foods_no);
	}

	@Override
	public int count(HashMap<String, Object> map) {
		return sqlSession.selectOne("shop.searchCount", map);
	}

	@Override
	public List<FoodsDTO> shopSearchProcess(HashMap<String, Object> map) {
		return sqlSession.selectList("shop.search", map);
	}

	public fb_BasketDTO shopBuy(HashMap<String, Object> map) {
		return sqlSession.selectOne("shop.buybasket", map);
	}

	@Override
	public int basketChk(HashMap<String, Object> map) {
		return sqlSession.selectOne("shop.basketChk", map);
	}

	@Override
	public void pointPlus(int member_no, int point) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("point", point);

		sqlSession.update("shop.savemoney_plus", map);
	}

	@Override
	public void pointMinus(int member_no, int point) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("point", point);

		sqlSession.update("shop.savemoney_minus", map);
	}

	@Override
	public void request_insert(HashMap<String, Object> map) {
		sqlSession.insert("shop.requestInsert", map);
	}

	@Override
	public void coupon_delete(int member_no, int couponbook_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("couponbook_no", couponbook_no);

		sqlSession.delete("shop.couponDel", map);
	}

	@Override
	public List<fb_CouponDTO> reCoupon(int member_no) {
		return sqlSession.selectList("shop.recoupon", member_no);
	}
	
	@Override
	public int rePoint(int member_no) {
		return sqlSession.selectOne("shop.repoint", member_no);
	}

	@Override
	public void basket_delete(int foods_no, int member_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("foods_no", foods_no);
		map.put("member_no", member_no);
		sqlSession.delete("basket.delete", map);
	}
}
