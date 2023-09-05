package com.example.demo.memberController;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.memberLogic.MemberSignupLogic;
import com.example.demo.vo.MemberVo;

@Controller
@RequestMapping("/signup/*")
public class MemberSignupController
{

	@Autowired
	private MemberSignupLogic memberSignupLogic;

	// 회원가입정보가 db에 입력되게함
	@GetMapping("signupInsert")
	public String signupInsert(@RequestParam Map<String, Object> pMap)
	{
		int result = memberSignupLogic.signupInsert(pMap);

		if (result > 0)
		{
			return "redirect:/memberSignUp/MemberSignUPsuccess.jsp";

		}

		else
		{
			return "redirect:/memberSignUp/MemberSignUPfail.jsp";
		}

	}


	// 아이디 중복검사 컨트롤러
	@PostMapping("member_idCheck")
	@ResponseBody
	public int member_idCheck(String member_id)
	{
		int result = memberSignupLogic.member_idCheck(member_id);

		return result;

	}


	// 이메일 중복검사 ajax 반환 컨트롤러
	@PostMapping("member_emailCheck")
	@ResponseBody
	public int member_emailCheck(String member_email)
	{
		int result = memberSignupLogic.member_emailCheck(member_email);
		return result;
	}

}
