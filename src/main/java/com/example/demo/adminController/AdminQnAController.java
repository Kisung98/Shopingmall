package com.example.demo.adminController;

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
import com.example.demo.vo.QnAVo;

@Controller
@RequestMapping("/qna/*")
public class AdminQnAController
{

	@Autowired
	private AdminQnALogic adminQnALogic;

	@GetMapping("qnaList")
	public String qnaList(Model model)
	{
		List<Map<String, Object>> qList = adminQnALogic.qnaList();
		model.addAttribute("qList", qList);
		return "forward:/adminQnA/AdminQnAList.jsp";
	}


	@GetMapping("qnaDetail")
	public String qnaDetail(Model model, int qna_num)
	{
		Map<String, Object> qMap = adminQnALogic.qnaDetail(qna_num);
		model.addAttribute("qMap", qMap);
		return "forward:/adminQnA/AdminQnADetail.jsp";
	}


	@GetMapping("qnaReply")
	public String qnaReply(@RequestParam Map<String, Object> pMap)
	{
		int result =adminQnALogic.qnaReply(pMap); 
		return "redirect:/qna/qnaList";
	}

}
