package controller;


import java.util.HashMap;

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
	
/*	@RequestMapping("/joinsucc.do")
	public String joinsucc() {

		return "joinsucc";
	}*/

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
		memberservice.insertProcess(dto);
		return "joinsucc";
	}
	
	
	@RequestMapping("/idpwfind.do")
	public String idfwfind() {

		return "idpwfind";
	}

	
	@RequestMapping(value = "/idfind.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String idfind(String member_name, String mail){
	
		MemberDTO dto =memberservice.idfindProcess(member_name, mail);
	
		String str ="";
		if(dto ==null){
			str ="입력하신 이름과 이메일이 일치하는 회원이 없습니다.";
		} else {
			str = "고객님의 아이디는 "+ dto.getId() +"입니다";
		}
		
		return str;
	}
	

	@RequestMapping(value = "/pwfind.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String pwfind(String id, String member_name, String mail){
		MemberDTO dto=memberservice.pwfindProcess(id, member_name, mail);
		String str ="";
		if(dto ==null){
			str ="입력하신 아이디, 이름, 이메일이 일치하는 회원이 없습니다.";
		} else {
			str = member_name +"님 확인 되었습니다.";
		}
		return str;
	}
	
	@RequestMapping(value ="/pwupd.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody MemberDTO pwupd(String id, String member_name, String mail, String pw){
		return memberservice.pwupdProcess(id, member_name, mail, pw);
	}
}
