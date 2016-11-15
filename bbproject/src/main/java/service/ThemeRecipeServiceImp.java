package service;

import java.util.List;

import dao.ThemeRecipeDAO;
import dto.ThemeRecipeDTO;

public class ThemeRecipeServiceImp implements ThemeRecipeService {
	private ThemeRecipeDAO dao;

	public ThemeRecipeServiceImp() {

	}

	public void setDao(ThemeRecipeDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertRecipeProcess(ThemeRecipeDTO dto) {
		dao.insertRecipe(dto);
	}

	@Override
	public List<ThemeRecipeDTO> selectListProcess() {
		return dao.selectList();
	}

}
