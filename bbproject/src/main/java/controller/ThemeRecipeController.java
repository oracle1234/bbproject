package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.ThemeRecipeDTO;
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
	public String recipePage() {
		return "recipe";
	}

	@RequestMapping(value = "/recipeins.do", method = RequestMethod.GET)
	public String recipeinsertPage() {
		return "view/recipe_insert";
	}

	@RequestMapping(value = "/recipeins.do", method = RequestMethod.POST)
	public ModelAndView recipeSavePage(ThemeRecipeDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		String[] order_pic = new String[dto.getOrder_file().length];
		for (int i = 0; i < dto.getOrder_file().length; i++) {
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
				order_pic[i] = random + "_" + fileName;
			}
		}
		dto.setOrder_pic(order_pic);
		
		service.insert(dto);

		mav.setViewName("view/recipe_insert");
		return mav;
	}

}
