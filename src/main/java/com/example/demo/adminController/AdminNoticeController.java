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
import com.example.demo.adminLogic.AdminNoticeLogic;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.NoticeVo;

@Controller
@RequestMapping("/notice/*")
public class AdminNoticeController
{

	@Autowired
	private AdminNoticeLogic adminNoticeLogic;

	@GetMapping("noticeList")
	public String noticeList(Model model)
	{
		List<NoticeVo> nList = adminNoticeLogic.noticeList();
		model.addAttribute("nList", nList);
		return "forward:/adminNotice/AdminNoticeList.jsp";

	}


	@GetMapping("noticeSearch")
	public String noticeSearch(Model model, String notice_title)
	{
		List<NoticeVo> nList = adminNoticeLogic.noticeSearch(notice_title);
		model.addAttribute("nList", nList);
		return "forward:/adminNotice/AdminNoticeList.jsp";

	}


	@GetMapping("noticeDetail")
	public String noticeDetail(int notice_num, Model model)
	{
		NoticeVo nVo = adminNoticeLogic.noticeDetail(notice_num);
		model.addAttribute("nVo", nVo);
		return "forward:/adminNotice/AdminNoticeDetail.jsp";
	}


	@GetMapping("noticeDelete")
	public String noticeDelete(int notice_num)
	{
		int result = adminNoticeLogic.noticeDelete(notice_num);
		return "redirect:/notice/noticeList";

	}


	@GetMapping("noticeInsert")
	public String noticeInsert(@RequestParam Map<String, Object> pMap)
	{
		int result = adminNoticeLogic.noticeInsert(pMap);
		return "redirect:/notice/noticeList";

	}


	@GetMapping("noticeUpdate")
	public String noticeUpdate(@RequestParam Map<String, Object> pMap)  
	{
		int result = adminNoticeLogic.noticeUpdate(pMap);
		return "redirect:/notice/noticeList";

	}

}
