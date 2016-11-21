package dao;

import java.util.HashMap;
import java.util.List;

import dto.FoodsDTO;
import dto.ReviewDTO;
import dto.shop_PageDTO;

public interface ShopDAO {
	public List<FoodsDTO> shopList(int category_no);
	public int count(int category_no);
	public List<FoodsDTO> pageList(HashMap<String, Object> map);
	public List<ReviewDTO> reviewList(int review_no);
	public int reviewCount(int foods_no);
	public List<ReviewDTO> reviewPageList(HashMap<String, Object> map);
	public void reviewInsertList(HashMap<String, Object> map);
	public void reviewDeleteList(HashMap<String, Object> deleteMap);
	public void reviewUpdateList(HashMap<String, Object> updateMap);
}
