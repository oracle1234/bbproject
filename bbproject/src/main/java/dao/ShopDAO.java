package dao;

import java.util.List;

import dto.FoodsDTO;
import dto.shop_PageDTO;

public interface ShopDAO {
	public List<FoodsDTO> shopList(int category_no);
	public int count(int category_no);
	public List<FoodsDTO> pageList(shop_PageDTO spdto);
}
