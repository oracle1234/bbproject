package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.FoodsDTO;
import dto.MemberDTO;
import dto.RecipePageDTO;
import dto.ThemeRecipeDTO;
import dto.fb_CouponDTO;
import service.ShopService;
import service.ThemeRecipeService;
import service.fb_CouponService;

@Controller
public class AdminController {
	private ThemeRecipeService recipeservice;
	private ShopService foodsservice;
	private fb_CouponService couponservice;

	private int currentRow;

	public AdminController() {
	}

	public void setRecipeservice(ThemeRecipeService recipeservice) {
		this.recipeservice = recipeservice;
	}

	public void setFoodsservice(ShopService foodsservice) {
		this.foodsservice = foodsservice;
	}

	public void setCouponservice(fb_CouponService couponservice) {
		this.couponservice = couponservice;
	}

	@RequestMapping("/admin.do")
	public String admin() {
		return "admin";
	}

	/*
	 * 레시피
	 */
	@RequestMapping("/adminrecipe.do")
	public String recipeadmin() {
		return "adminrecipe";
	}

	@RequestMapping("/adminrecipelist.do")
	public ModelAndView recipePage(RecipePageDTO pdto) {
		ModelAndView mav = new ModelAndView();
		int theme_no = pdto.getTheme_no();
		int totalRow = recipeservice.countRecipeProcess(pdto.getTheme_no());
		if (totalRow >= 1) {
			if (pdto.getCurrentRow() == 0) {
				currentRow = 1;
			} else {
				currentRow = pdto.getCurrentRow();
			}
			pdto = new RecipePageDTO(currentRow, totalRow);
			pdto.setTheme_no(theme_no);
			mav.addObject("pdto", pdto);
			mav.addObject("aList", recipeservice.selectListProcess(pdto));
		}

		mav.setViewName("adminrecipelist");
		return mav;
	}

	@RequestMapping(value = "/adminrecipelist.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> recipePagePost(RecipePageDTO pdto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int theme_no = pdto.getTheme_no();
		int totalRow = recipeservice.countRecipeProcess(pdto.getTheme_no());
		if (totalRow >= 1) {
			if (pdto.getCurrentRow() == 0) {
				currentRow = 1;
			} else {
				currentRow = pdto.getCurrentRow();
			}
			pdto = new RecipePageDTO(currentRow, totalRow);
			pdto.setTheme_no(theme_no);
		}

		map.put("pdto", pdto);
		map.put("list", recipeservice.selectListProcess(pdto));
		return map;
	}

	@RequestMapping(value = "/adminrecipeins.do", method = RequestMethod.GET)
	public String recipeinsertPage() {
		return "adminrecipeins";
	}

	@RequestMapping(value = "/adminrecipeins.do", method = RequestMethod.POST)
	public String recipeSavePage(ThemeRecipeDTO dto, HttpServletRequest req) {
		return recipeservice.insertRecipeProcess(dto, req);
	}

	@RequestMapping("/adminrecipedel.do")
	public ModelAndView recipeDelPage(ThemeRecipeDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		recipeservice.deleteRecipeProcess(dto, req);
		mav.setViewName("redirect:adminrecipelist.do");
		return mav;
	}

	/*
	 * 음식
	 */
	@RequestMapping("/adminfoods.do")
	public String foodsPage() {
		return "adminfoods";
	}

	@RequestMapping("/adminfoodslist.do")
	public ModelAndView foodsListPage(int category_no) {
		ModelAndView mav = new ModelAndView();
		List<FoodsDTO> aList = foodsservice.adminFoodsListProcess(category_no);
		mav.addObject("aList", aList);
		mav.setViewName("adminfoodslist");
		return mav;
	}

	@RequestMapping(value = "/adminfoodsins.do", method = RequestMethod.GET)
	public String foodsInsertPage() {
		return "adminfoodsins";
	}

	@RequestMapping(value = "/adminfoodsins.do", method = RequestMethod.POST)
	public String foodsSavePage(FoodsDTO dto, HttpServletRequest req) {
		return foodsservice.insertFoodsProcess(dto, req);
	}

	@RequestMapping("/adminfoodsdel.do")
	public ModelAndView foodsDelPage(FoodsDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		List<FoodsDTO> aList = foodsservice.deletFoodsProcess(dto.getFoods_no(), req);
		mav.addObject("aList", aList);
		mav.setViewName("adminfoodslist");

		return mav;
	}

	/* 쿠폰 */
	@RequestMapping("/admincoupon.do")
	public String couponPage() {
		return "admincoupon";
	}

	@RequestMapping(value = "/admincouponins.do", method = RequestMethod.GET)
	public ModelAndView couponInsertPage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", couponservice.adminCouponListProcess());
		mav.setViewName("admincouponins");
		return mav;
	}

	@RequestMapping(value = "/admincouponins.do", method = RequestMethod.POST)
	public ModelAndView couponSavePage(fb_CouponDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", couponservice.adminCouponInsProcess(dto));
		mav.setViewName("admincouponins");
		return mav;
	}

	@RequestMapping("/admincoupondel.do")
	public ModelAndView couponDelPage(fb_CouponDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", couponservice.adminCouponDelProcess(dto));
		mav.setViewName("admincouponins");
		return mav;
	}
	
	@RequestMapping(value="/admincouponsend.do", method=RequestMethod.POST)
	public ModelAndView couponSendPage(fb_CouponDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", couponservice.adminCouponMemProcess(dto));
		mav.setViewName("admincouponins");
		return mav;
	}
	
	@RequestMapping("/admincouponidchk.do")
	public @ResponseBody MemberDTO couponIdChk(String id) {
		return couponservice.adminCouponIdChkProcess(id); 
	}

}
