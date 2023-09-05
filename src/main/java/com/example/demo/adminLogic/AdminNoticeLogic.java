package com.example.demo.adminLogic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.adminDao.AdminNoticeDao;
import com.example.demo.vo.NoticeVo;

@Service
public class AdminNoticeLogic
{
	@Autowired
	private AdminNoticeDao adminNoticeDao;

	public List<NoticeVo> noticeList()
	{
		List<NoticeVo> nList = adminNoticeDao.noticeList();
		return nList;

	}


	public List<NoticeVo> noticeSearch(String notice_title)
	{
		List<NoticeVo> nList = adminNoticeDao.noticeSearch(notice_title);
		return nList;
	}


	public NoticeVo noticeDetail(int notice_num)
	{
		NoticeVo nVO = adminNoticeDao.noticeDetail(notice_num);
		adminNoticeDao.noticeCount(notice_num);
		return nVO;
	}


	public int noticeDelete(int notice_num)
	{
		int result = adminNoticeDao.noticeDelete(notice_num);
		return result;
	}


	public int noticeInsert(Map<String, Object> pMap)
	{
		int result = adminNoticeDao.noticeInsert(pMap);
		return result;
	}


	public int noticeUpdate(Map<String, Object> pMap)
	{
		int result = adminNoticeDao.noticeUpdate(pMap);
		return result;
	}

}
