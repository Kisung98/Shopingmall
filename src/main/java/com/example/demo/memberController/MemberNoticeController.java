package com.example.demo.memberController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.adminLogic.AdminNoticeLogic;
import com.example.demo.vo.NoticeVo;

@Controller
@RequestMapping("/notice/*")
public class MemberNoticeController
{
	@Autowired
	private AdminNoticeLogic adminNoticeLogic;

	// 공지사항 목록
	@GetMapping("membernoticeList")
	public String noticeList(Model model)
	{
		List<NoticeVo> nList = adminNoticeLogic.noticeList();
		model.addAttribute("nList", nList);
		return "forward:/memberNotice/MemberNoticeList.jsp";

	}


	@GetMapping("membernoticeSearch")
	public String noticeSearch(Model model, String notice_title)
	{
		List<NoticeVo> nList = adminNoticeLogic.noticeSearch(notice_title);
		model.addAttribute("nList", nList);
		return "forward:/memberNotice/MemberNoticeList.jsp";

	}


	@GetMapping("membernoticeDetail")
	public String noticeDetail(int notice_num, Model model)
	{
		NoticeVo nVo = adminNoticeLogic.noticeDetail(notice_num);
		model.addAttribute("nVo", nVo);
		return "forward:/memberNotice/MemberNoticeDetail.jsp";
	}
}
