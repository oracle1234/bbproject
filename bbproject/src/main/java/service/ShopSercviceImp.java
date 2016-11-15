package service;

import java.util.HashMap;
import java.util.List;

import dao.ShopDAO;
import dto.FoodsDTO;
import dto.ReviewDTO;
import dto.shop_PageDTO;

public class ShopSercviceImp implements ShopService{
	
	private ShopDAO dao;
	
	
	public void setDao(ShopDAO dao) {
		this.dao = dao;
	}

	public ShopSercviceImp() {
	}

	@Override
	public List<FoodsDTO> listProcess(int foods_no) {
		return dao.shopList(foods_no);
	}

	@Override
	public int countProcess(int category_no) {
		
		return dao.count(category_no);
	}

	@Override
	public List<FoodsDTO> pageListProcess(HashMap<String, Object> map) {
		return dao.pageList(map);
	}

	@Override
	public List<ReviewDTO> reviewListProcess(int foods_no) {
		return dao.reviewList(foods_no);
	}

	
}
