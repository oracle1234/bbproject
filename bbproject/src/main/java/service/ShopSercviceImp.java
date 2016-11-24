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
	public List<FoodsDTO> buyListProcess(int foods_no) {
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

}//end class
