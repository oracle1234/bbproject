package service;

import java.util.List;

import dao.ShopDAO;
import dto.FoodsDTO;
import dto.shop_PageDTO;

public class ShopSercviceImp implements ShopService{
	
	private ShopDAO dao;
	
	
	public void setDao(ShopDAO dao) {
		this.dao = dao;
	}

	public ShopSercviceImp() {
	}

	@Override
	public List<FoodsDTO> listProcess(int category_no) {
		return dao.shopList(category_no);
	}

	@Override
	public int countProcess(int category_no) {
		
		return dao.count(category_no);
	}

	@Override
	public List<FoodsDTO> pageListProcess(shop_PageDTO spdto) {
		return dao.pageList(spdto);
	}

	
}
