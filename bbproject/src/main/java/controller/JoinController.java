package controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDAO;
import dto.MemberDTO;
import service.MemberService;

@Controller
public class JoinController {
	
	private MemberService memberservice;

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
	
	@RequestMapping("/join_idck.do")
	public @ResponseBody List<MemberDTO> idcheck(String id){
		return memberservice.idcheckProcess(id);
		
	}

}
