package service;

import java.util.List;

import dto.FoodsDTO;
import dto.shop_PageDTO;

public interface ShopService {
	public List<FoodsDTO> listProcess(int category_no);
	public int countProcess(int category_no);
	public List<FoodsDTO> pageListProcess(shop_PageDTO spdto);
}
