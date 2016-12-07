package service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.ShopDAO;
import dto.FoodsDTO;
import dto.ReviewDTO;
import dto.fb_BasketDTO;
import dto.fb_CouponDTO;
import dto.shop_PageDTO;

public class ShopSercviceImp implements ShopService {

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

	@Override
	public int reviewCountProcess(int foods_no) {
		return dao.reviewCount(foods_no);
	}

	@Override
	public List<ReviewDTO> reviewPageListProcess(HashMap<String, Object> map) {
		return dao.reviewPageList(map);
	}

	@Override
	public void reviewInsertProcess(HashMap<String, Object> map) {
		dao.reviewInsertList(map);
	}

	@Override
	public void reviewDeleteProcess(HashMap<String, Object> deleteMap) {
		dao.reviewDeleteList(deleteMap);
	}

	@Override
	public void reviewUpdateProcess(HashMap<String, Object> updateMap) {
		dao.reviewUpdateList(updateMap);
	}

	@Override
	public void basketInsertProcess(HashMap<String, Object> map) {
		dao.basketInsertList(map);
	}

	@Override
	public FoodsDTO buyListProcess(int foods_no) {
		return dao.buyList(foods_no);
	}

	public String insertFoodsProcess(FoodsDTO dto, HttpServletRequest req) {

		MultipartFile file = dto.getFoods_file();
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			// 중복파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			String root = req.getSession().getServletContext().getRealPath("/");
			// root + "temp/"
			String saveDirectory = root + "temp" + File.separator;
			File fe = new File(saveDirectory);
			if (!fe.exists()) {
				fe.mkdir();
			}
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			dto.setPicture(random + "_" + fileName);
		}

		return dao.insertFoods(dto);
	}

	@Override
	public List<FoodsDTO> deletFoodsProcess(int foods_no, HttpServletRequest req) {
		String root = req.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;

		FoodsDTO dto = dao.getFoodProcess(foods_no);

		String filename = dto.getPicture();
		if (filename != null) {
			File fe = new File(saveDirectory, filename);
			fe.delete();
		}

		return dao.deletFoodsProcess(dto);
	}

	@Override
	public List<FoodsDTO> adminFoodsListProcess(int category_no) {
		return dao.adminFoodsListProcess(category_no);
	}

	@Override
	public fb_BasketDTO shopBuyProcess(int foods_no, int member_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("foods_no", foods_no);
		map.put("member_no", member_no);
		return dao.shopBuy(map);
	}

	@Override
	public List<FoodsDTO> shopSearchProcess(HashMap<String, Object> map) {
		return dao.shopSearchProcess(map);
	}

	@Override
	public int countProcess(int category_no, String foods_name) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category_no", category_no);
		map.put("foods_name", foods_name);

		return dao.count(map);
	}

	@Override
	public int basketChkProcess(int foods_no, int member_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("foods_no", foods_no);
		map.put("member_no", member_no);

		return dao.basketChk(map);
	}

	@Override
	public void savePointPlusProcess(int member_no, int point) {
		dao.pointPlus(member_no, point);
	}

	@Override
	public void savePointMinusProcess(int member_no, int point) {
		dao.pointMinus(member_no, point);
	}

	@Override
	public void requestInsertProcess(HashMap<String, Object> map) {
		dao.request_insert(map);
	}

	@Override
	public void couponDeleteProcess(int member_no, int couponbook_no) {
		dao.coupon_delete(member_no, couponbook_no);
	}

	@Override
	public List<fb_CouponDTO> reCouponProcess(int member_no) {
		return dao.reCoupon(member_no);
	}

	@Override
	public int rePointProcess(int member_no) {
		return dao.rePoint(member_no);
	}

	@Override
	public void now_endProcess(int member_no, int savepoint, int userpoint, int usecoupon, int foods_no, int price,
			int amount, String foods_name) {
		
		dao.pointPlus(member_no, savepoint);
		dao.pointMinus(member_no, userpoint);
		dao.coupon_delete(member_no, usecoupon);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("foods_no", foods_no);
		int count = dao.basketChk(map);
		
		if(count !=0){
			dao.basket_delete(foods_no);
		}
		
		HashMap<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("member_no", member_no);
		requestMap.put("price", price);
		requestMap.put("amount", amount);
		requestMap.put("delivery_condition", "주문완료");
		requestMap.put("foods_no", foods_no);
		requestMap.put("foods_name", foods_name);
		
		dao.request_insert(requestMap);
		
	}

	@Override
	public void endProcess(int member_no, int savePoint, int userpoint, int usecoupon, String[] foods_no,
			String[] foods_name, int[] price, int[] amount) {
		
		dao.pointPlus(member_no, savePoint);
		dao.pointMinus(member_no, userpoint);
		dao.coupon_delete(member_no, usecoupon);
		
		for(int i = 0; i<foods_name.length;i++){
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_no", member_no);
			map.put("foods_no", foods_no[i]);
			int count = dao.basketChk(map);
			
			if(count !=0){
				dao.basket_delete(Integer.parseInt(foods_no[i]));
			}
			
			HashMap<String, Object> requestMap = new HashMap<String, Object>();
			requestMap.put("member_no", member_no);
			requestMap.put("price", price[i]);
			requestMap.put("amount", amount[i]);
			requestMap.put("delivery_condition", "주문완료");
			requestMap.put("foods_no", foods_no[i]);
			requestMap.put("foods_name", foods_name[i]);
			
			dao.request_insert(requestMap);
			
		}
		
	}

	


	

}// end class
