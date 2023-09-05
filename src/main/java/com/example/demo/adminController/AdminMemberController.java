package com.example.demo.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.adminLogic.AdminMemberLogic;
import com.example.demo.vo.MemberVo;

//멤버관리 어드민 컨트롤러
@Controller
@RequestMapping("/member/*")
public class AdminMemberController
{
	@Autowired
	private AdminMemberLogic adminMemberLogic;

	@GetMapping("memberList")
	public String memberList(Model model)
	{
		List<MemberVo> mList = adminMemberLogic.memberList();
		model.addAttribute("mList", mList);
		return "forward:/adminMember/AdminMemberList.jsp";
	}


	@GetMapping("memberSearch")
	public String memberSearch(String member_name, Model model)
	{
		List<MemberVo> mList = adminMemberLogic.memberSearch(member_name);
		model.addAttribute("mList", mList);
		return "forward:/adminMember/AdminMemberList.jsp";

	}
}
