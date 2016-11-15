package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.ThemeRecipeDTO;
import dto.ThemeRecipeOderDTO;
import service.ThemeRecipeService;

@Controller
public class ThemeRecipeController {
	ThemeRecipeService service;

	public ThemeRecipeController() {
	}

	public void setService(ThemeRecipeService service) {
		this.service = service;
	}

	@RequestMapping("/recipe.do")
	public ModelAndView recipePage() {
		ModelAndView mav = new ModelAndView();
		
		List<ThemeRecipeDTO> list = service.selectListProcess();
		
		System.out.println(list.get(0).getDifficulty());
		System.out.println(list.get(0).getComplete_pic().get(0).toString());
		
		mav.addObject("aList", list);
		mav.setViewName("recipe");
		return mav;
	}

	@RequestMapping(value = "/recipeins.do", method = RequestMethod.GET)
	public String recipeinsertPage() {
		return "view/recipe_insert";
	}

	@RequestMapping(value = "/recipeins.do", method = RequestMethod.POST)
	public ModelAndView recipeSavePage(ThemeRecipeDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
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
//		String[] complete_pic = new String[dto.getComplete_file().length];
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
//				complete_pic[i] = random + "_" + fileName;
				sList.add(random + "_" + fileName);
			}
		}
//		dto.setComplete_pic(complete_pic);
		dto.setComplete_pic(sList);
		
		dto.setPicture(sList.get(0).toString());
		
		service.insertRecipeProcess(dto);

		mav.setViewName("view/recipe_insert");
		return mav;
	}

}
