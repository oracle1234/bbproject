package service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.ThemeRecipeDAO;
import dto.RecipePageDTO;
import dto.ThemeRecipeDTO;
import dto.ThemeRecipeOderDTO;

public class ThemeRecipeServiceImp implements ThemeRecipeService {
	private ThemeRecipeDAO dao;

	public ThemeRecipeServiceImp() {

	}

	public void setDao(ThemeRecipeDAO dao) {
		this.dao = dao;
	}

	@Override
	public String insertRecipeProcess(ThemeRecipeDTO dto, HttpServletRequest req) {
		
		List<ThemeRecipeOderDTO> aList = new ArrayList<ThemeRecipeOderDTO>();

		// 조리순서
		for (int i = 0; i < dto.getOrder_file().length; i++) {
			ThemeRecipeOderDTO odto = new ThemeRecipeOderDTO();

			MultipartFile file = dto.getOrder_file()[i];
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

				odto.setOrder_pic(random + "_" + fileName);
				odto.setOrder_text(dto.getOrder_text()[i]);
				aList.add(odto);
			}
		}
		dto.setList(aList);

		// 완성 사진
		List<String> sList = new ArrayList<String>();
		for (int i = 0; i < dto.getComplete_file().length; i++) {
			MultipartFile file = dto.getComplete_file()[i];
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
				sList.add(random + "_" + fileName);
			}
		}
		dto.setComplete_pic(sList);

		dto.setPicture(sList.get(0).toString());

		return dao.insertRecipe(dto);
	}

	@Override
	public List<ThemeRecipeDTO> deleteRecipeProcess(ThemeRecipeDTO dto, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;
		ThemeRecipeDTO temp = dao.selectRecipe(dto.getRecipe_no());
		// 조리 사진 삭제
		for (int i = 0; i < temp.getList().size(); i++) {
			String filename = temp.getList().get(i).getOrder_pic();
			if (filename != null) {
				File fe = new File(saveDirectory, filename);
				fe.delete();
			}
		}
		//완성 사진삭제
		for (String filename : temp.getComplete_pic()) {
			if (filename != null) {
				File fe = new File(saveDirectory, filename);
				fe.delete();
			}
		}
		return dao.deleteRecipe(temp);
	}

	@Override
	public List<ThemeRecipeDTO> selectListProcess(RecipePageDTO pdto) {
		return dao.selectList(pdto);
	}

	@Override
	public ThemeRecipeDTO selectRecipeProcess(int recipe_no) {
		return dao.selectRecipe(recipe_no);
	}
	
	@Override
	public int countRecipeProcess(int theme_no){
		return dao.countRecipe(theme_no);
	}

}
