package com.example.demo.memberController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.adminLogic.AdminMemberLogic;
import com.example.demo.adminLogic.AdminQnALogic;
import com.example.demo.memberLogic.MemberQnALogic;
import com.example.demo.vo.QnAVo;

@Controller
@RequestMapping("/qna/*")
public class MemberQnAController
{

	@Autowired
	private AdminQnALogic adminQnALogic;

	@Autowired
	private MemberQnALogic memberQnALogic;

	@GetMapping("memberqnaList")
	public String memberqnaList(Model model)
	{
		List<Map<String, Object>> qList = adminQnALogic.qnaList();
		model.addAttribute("qList", qList);
		return "forward:/memberQnA/MemberQnAList.jsp";
	}


	@GetMapping("memberqnaDetail")
	public String memberqnaDetail(Model model, int qna_num)
	{
		Map<String, Object> qMap = adminQnALogic.qnaDetail(qna_num);
		model.addAttribute("qMap", qMap);
		return "forward:/memberQnA/MemberQnADetail.jsp";
	}


	@GetMapping("memberqnaInsert")
	public String memberqnaInsert(@RequestParam Map<String, Object> pMap)
	{
		int result = memberQnALogic.memberqnaInsert(pMap);
		return "redirect:/qna/memberqnaList";

	}


	@GetMapping("memberqnaDelete")
	public String memberqnaDelete(String qna_num)
	{
		int result = memberQnALogic.memberqnaDelete(qna_num);
		return "redirect:/qna/memberqnaList";

	}

}
