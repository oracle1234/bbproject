package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.FoodsDTO;
import dto.ReviewDTO;
import dto.fb_BasketDTO;

public interface ShopService {
	public List<FoodsDTO> listProcess(int foods_no);
	public int countProcess(int category_no);
	public int countProcess(int category_no, String foods_name);
	public List<FoodsDTO> pageListProcess(HashMap<String, Object> map);
	public List<ReviewDTO> reviewListProcess(int review_no);
	public int reviewCountProcess(int foods_no);
	public List<ReviewDTO> reviewPageListProcess(HashMap<String, Object> map);
	public void reviewInsertProcess(HashMap<String, Object> map);
	public void reviewDeleteProcess(HashMap<String, Object> deleteMap);
	public void reviewUpdateProcess(HashMap<String, Object> updateMap);
	public void basketInsertProcess(HashMap<String, Object> map);
	public FoodsDTO buyListProcess(int foods_no);
	
	public String insertFoodsProcess(FoodsDTO dto, HttpServletRequest req);
	public List<FoodsDTO> deletFoodsProcess(int foods_no, HttpServletRequest req);
	public List<FoodsDTO> adminFoodsListProcess(int category_no);
	public List<FoodsDTO> shopSearchProcess(HashMap<String, Object> map);
	
	
	public fb_BasketDTO shopBuyProcess(int foods_no, int member_no);
	public int basketChkProcess(int foods_no, int member_no);
	
	
	
}
