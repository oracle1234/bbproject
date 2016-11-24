package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.FoodsDTO;
import dto.MemberDTO;
import dto.ReviewDTO;
import dto.fb_BasketDTO;
import dto.review_PageDTO;
import service.ShopService;

@Controller
public class ProductController {
	

	ShopService service;
	private review_PageDTO pdto;
	private int currentPage;
	
	
	public void setService(ShopService service) {
		this.service = service;
	}

	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/detailProduct.do", method = RequestMethod.GET)
	public ModelAndView detailproductProcess(FoodsDTO fdto, review_PageDTO rpdto){
		
		ModelAndView mav = new ModelAndView();
		
		int totalRecord = service.reviewCountProcess(fdto.getFoods_no());
		
		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (rpdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = rpdto.getCurrentPage();

			pdto = new review_PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("foods_no", fdto.getFoods_no());
			mav.addObject("aList", service.reviewPageListProcess(map));
			
		}
		
		mav.addObject("foods_no", fdto.getFoods_no());
		mav.addObject("list", service.listProcess(fdto.getFoods_no()));
		mav.setViewName("detail_product");
		return mav;
	}
	
	@RequestMapping(value="/detailProduct.do", method = RequestMethod.POST)
//	public @ResponseBody List<ReviewDTO> detailproductPostProcess(FoodsDTO fdto, review_PageDTO rpdto, HttpServletRequest req){
	public @ResponseBody HashMap<String, Object> detailproductPostProcess(FoodsDTO fdto, review_PageDTO rpdto, HttpServletRequest req){
		
		int totalRecord = service.reviewCountProcess(fdto.getFoods_no());
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (rpdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = rpdto.getCurrentPage();

			pdto = new review_PageDTO(currentPage, totalRecord);
			
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("foods_no", fdto.getFoods_no());
		}
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", service.reviewPageListProcess(map));
		resultMap.put("page", pdto);
		
		return resultMap;
	}//////////////////////////end List/////////////
	
	//멤버ID도 추가해야함.
	@RequestMapping("/reviewInsert.do")
	public @ResponseBody HashMap<String, Object> reviewInsertProcess(FoodsDTO fdto, ReviewDTO rdto, MemberDTO mdto, review_PageDTO rpdto){
		
		
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("review_content", rdto.getReview_content());
		insertMap.put("foods_no", fdto.getFoods_no());
		insertMap.put("member_no", mdto.getMember_no());
		insertMap.put("review_writer", "홍길동");
		/*insertMap.put("review_writer", mdto.getMember_name());*/
		
		service.reviewInsertProcess(insertMap);
		
		int totalRecord = service.reviewCountProcess(fdto.getFoods_no());
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		
		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (rpdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = rpdto.getCurrentPage();

			pdto = new review_PageDTO(currentPage, totalRecord);
			
			pageMap.put("startRow", pdto.getStartRow());
			pageMap.put("endRow", pdto.getEndRow());
			pageMap.put("foods_no", fdto.getFoods_no());
		} 
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ReviewDTO", service.reviewPageListProcess(pageMap));
		resultMap.put("page", pdto);
		
		return resultMap;
	}//end reviewInsertProcess()//////////////////////////
	
	@RequestMapping("/reviewDelete.do")
	public @ResponseBody HashMap<String, Object> reviewDeleteProcess(ReviewDTO rdto, MemberDTO mdto, FoodsDTO fdto, review_PageDTO rpdto, HttpServletResponse req) {
		
		HashMap<String, Object> deleteMap = new HashMap<String, Object>();
		deleteMap.put("review_no", rdto.getReview_no());
		deleteMap.put("member_no", mdto.getMember_no());
		service.reviewDeleteProcess(deleteMap);
		
		int totalRecord = service.reviewCountProcess(fdto.getFoods_no());
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		
		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (rpdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = rpdto.getCurrentPage();

			pdto = new review_PageDTO(currentPage, totalRecord);
			
			pageMap.put("startRow", pdto.getStartRow());
			pageMap.put("endRow", pdto.getEndRow());
			pageMap.put("foods_no", fdto.getFoods_no());
		}
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ReviewDTO", service.reviewPageListProcess(pageMap));
		resultMap.put("page", pdto);
		
		return resultMap;
		
	}//end delete/////////////////////////////////////
	
	@RequestMapping(value="/reviewUpdate.do", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reviewUpdateProcess(ReviewDTO rdto, MemberDTO mdto, FoodsDTO fdto, review_PageDTO rpdto, HttpServletResponse req) {
		
		
		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("review_content", rdto.getReview_content());
		updateMap.put("review_no", rdto.getReview_no());
		updateMap.put("member_no", mdto.getMember_no());
		service.reviewUpdateProcess(updateMap);
		
		int totalRecord = service.reviewCountProcess(fdto.getFoods_no());
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		
		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (rpdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = rpdto.getCurrentPage();

			pdto = new review_PageDTO(currentPage, totalRecord);
			
			pageMap.put("startRow", pdto.getStartRow());
			pageMap.put("endRow", pdto.getEndRow());
			pageMap.put("foods_no", fdto.getFoods_no());
		}
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ReviewDTO", service.reviewPageListProcess(pageMap));
		resultMap.put("page", pdto);
		
		return resultMap;
	}//end update/////////////////////////////////////
	
	@RequestMapping(value="/reviewUpdate.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> reviewUpdatePostProcess(ReviewDTO rdto, MemberDTO mdto, FoodsDTO fdto, review_PageDTO rpdto) {
		
		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("review_content", rdto.getReview_content());
		updateMap.put("review_no", rdto.getReview_no());
		updateMap.put("member_no", mdto.getMember_no());
		service.reviewUpdateProcess(updateMap);
		
		int totalRecord = service.reviewCountProcess(fdto.getFoods_no());
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		
		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (rpdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = rpdto.getCurrentPage();

			pdto = new review_PageDTO(currentPage, totalRecord);
			
			pageMap.put("startRow", pdto.getStartRow());
			pageMap.put("endRow", pdto.getEndRow());
			pageMap.put("foods_no", fdto.getFoods_no());
			
		}
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ReviewDTO", service.reviewPageListProcess(pageMap));
		resultMap.put("page", pdto);
		
		return resultMap;
	}//end update/////////////////////////////////////
	
	
	
	
	@RequestMapping(value="/basketInsert.do", method = RequestMethod.POST)
	public ModelAndView basketInsertProcess(FoodsDTO fdto, MemberDTO mdto, String amount, fb_BasketDTO bdto){
		ModelAndView mav = new ModelAndView();
		System.out.println(bdto.getAmount());
		System.out.println("푸드넘"+fdto.getFoods_no());
		System.out.println("어마운트:"+amount);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("foods_no", fdto.getFoods_no());
		/*map.put("member_no", mdto.getMember_no());*/
		map.put("member_no",1);
		map.put("amount", bdto.getAmount());
		
		service.basketInsertProcess(map);
		//d
		
		return mav;
	}
	

}
