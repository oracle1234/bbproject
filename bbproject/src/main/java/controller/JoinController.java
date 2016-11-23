package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import dto.MemberDTO;
import service.MemberService;

@Controller
public class JoinController {
	
	private MemberService memberservice;
	private MemberDAO dao;

	public JoinController() {

	}
	
	public void setMemberservice(MemberService memberservice) {
		this.memberservice = memberservice;
	}

	@RequestMapping("/agree.do")
	public String agree() {
		
		return "agree";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		
		return "join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinProcess(MemberDTO dto) {

		return "joinsucc";
	}
	
/*	@RequestMapping("/join_idck.do")
	public @ResponseBody List<MemberDTO> idcheck(String id){
		return memberservice.idcheckProcess(id);
		
	}*/
		@RequestMapping("/join_idck.do")
		public String idcheck(HttpServletRequest request, Model model) throws Exception {
			request.setCharacterEncoding("UTF-8"); 
			String id = request.getParameter("id");
			int idcheck = dao.idcheck(id);
			System.out.println("i");
			int i = 0;
			if (idcheck == 0){
				i = 0;
			} else {
				i = 1;
			}
			model.addAttribute("i", i);
			return "joinsucc";
		} 
}
