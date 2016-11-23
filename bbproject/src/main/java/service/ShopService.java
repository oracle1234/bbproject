package service;

import java.util.HashMap;
import java.util.List;

import dto.FoodsDTO;
import dto.ReviewDTO;

public interface ShopService {
	public List<FoodsDTO> listProcess(int foods_no);
	public int countProcess(int category_no);
	public List<FoodsDTO> pageListProcess(HashMap<String, Object> map);
	public List<ReviewDTO> reviewListProcess(int review_no);
	public int reviewCountProcess(int foods_no);
	public List<ReviewDTO> reviewPageListProcess(HashMap<String, Object> map);
	public void reviewInsertProcess(HashMap<String, Object> map);
	public void reviewDeleteProcess(HashMap<String, Object> deleteMap);
	public void reviewUpdateProcess(HashMap<String, Object> updateMap);
	
}
