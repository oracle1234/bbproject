package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.FoodsDTO;
import dto.ReviewDTO;
import dto.fb_BasketDTO;
import dto.fb_CouponDTO;

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
	public void savePointPlusProcess(int member_no, int point);
	public void savePointMinusProcess(int member_no, int point);
	public void requestInsertProcess(HashMap<String, Object> map);
	public void couponDeleteProcess(int member_no, int couponbook_no);
	public List<fb_CouponDTO> reCouponProcess(int member_no);
	public int rePointProcess(int member_no);
	public void now_endProcess(int member_no, int savepoint, int userpoint, int usecoupon, int foods_no, int price, int amount, String foods_name);
	public void endProcess(int member_no, int savePoint, int userpoint, int usecoupon,String[] foods_no, String[] foods_name, int[] price, int[] amount);
	
	
}
