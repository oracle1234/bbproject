package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/join_idck.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String idcheck(String id) {
		System.out.println(id);
		String str = "";

		if (memberservice.idcheckProcess(id) > 0) {
			str = "중복된 아이디입니다.";
		} else {
			str = "사용가능한 아이디입니다.";
		}
		return str;
	}
	
	@RequestMapping(value = "/joinInsert.do", method = RequestMethod.POST)
	public String joinProcess(MemberDTO dto) {
		System.out.println(dto.getTel());
		memberservice.insertProcess(dto);
		return "joinsucc";
	}
}
