package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.Comment_PageDTO;
import dto.PageDTO;
import dto.Photo_BoardDTO;
import service.Photo_BoardService;

@Controller
public class MainController {

	public MainController() {
		
	}
	@RequestMapping("/main_list.do")
	public ModelAndView main_listMethod(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("view/main/mainpage");
		return mav;
		
	}
	
	@RequestMapping("/main.do")
	public String main(){
		return "main";
	}
	

	
}
