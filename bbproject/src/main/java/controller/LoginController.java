package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.MemberDTO;
import service.MemberService;

@Controller
public class LoginController {

	private MemberService memberservice;

	public LoginController() {

	}

	public void setMemberservice(MemberService memberservice) {
		this.memberservice = memberservice;
	}

	@RequestMapping("/login.do")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/login");
		return mav;
	}

	@RequestMapping(value = "/loginpro.do", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody HashMap<String, String> loginPro(String id, String pw, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		MemberDTO dto = memberservice.loginChkProcess(id, pw);
		if (dto == null) {
			map.put("chk", "아이디 비밀번호를 확인하세요.");
		} else {
			session.setAttribute("member", dto.getId());
			if (dto.getId().equals("admin")) {
				map.put("href", "admin.do");
			} else {
				map.put("href", "mypage.do");
			}
		}

		// mav.setViewName("admin");
		// mav.setViewName("mypage");
		return map;
	}

}
