package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.RecipePageDTO;
import dto.ThemeRecipeDTO;

public class ThemeRecipeDaoImp implements ThemeRecipeDAO {
	private SqlSessionTemplate sqlSession;

	public ThemeRecipeDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public String insertRecipe(ThemeRecipeDTO dto) {
		sqlSession.insert("recipe.insert", dto);
		return "adminrecipe";
	}
	
	@Override
	public void deleteRecipe(ThemeRecipeDTO dto){
		sqlSession.delete("recipe.delete", dto.getRecipe_no());
	}

	@Override
	public List<ThemeRecipeDTO> selectList(RecipePageDTO pdto) {
		return sqlSession.selectList("recipe.list", pdto);
	}

	@Override
	public ThemeRecipeDTO selectRecipe(int recipe_no) {
		return sqlSession.selectOne("recipe.detail", recipe_no);
	}

	@Override
	public int countRecipe(int theme_no){
		return sqlSession.selectOne("recipe.count", theme_no);
	}

	@Override
	public List<ThemeRecipeDTO> selectSearch(HashMap<String, Object> map) {
		return sqlSession.selectList("recipe.search", map);
	}

	@Override
	public int countRecipe(HashMap<String, Object> map) {
		return sqlSession.selectOne("recipe.schcount",map);
	}
	
}
