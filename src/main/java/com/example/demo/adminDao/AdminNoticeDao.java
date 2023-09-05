package com.example.demo.adminDao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.NoticeVo;

@Repository
public class AdminNoticeDao
{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<NoticeVo> noticeList()
	{
		List<NoticeVo> nList = sqlSessionTemplate.selectList("noticeList");
		return nList;
	}


	public List<NoticeVo> noticeSearch(String notice_title)
	{
		List<NoticeVo> nList = sqlSessionTemplate.selectList("noticeSearch", notice_title);
		return nList;

	}


	public NoticeVo noticeDetail(int notice_num)
	{
		NoticeVo nVo = sqlSessionTemplate.selectOne("noticeDetail", notice_num);
		return nVo;

	}


	public int noticeDelete(int notice_num)
	{
		int result = sqlSessionTemplate.delete("noticeDelete", notice_num);
		return result;
	}


	public int noticeInsert(Map<String, Object> pMap)
	{
		int result = sqlSessionTemplate.insert("noticeInsert", pMap);
		return result;
	}


	public int noticeUpdate(Map<String, Object> pMap)
	{
		int result = sqlSessionTemplate.update("noticeUpdate", pMap);
		return result;

	}
	
	public int noticeCount(int notice_num)
	{
		int result = sqlSessionTemplate.insert("noticeCount", notice_num);
		return result;
	}
	
	

}
