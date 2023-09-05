package com.example.demo.adminLogic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.adminDao.AdminQnADao;

@Service
public class AdminQnALogic
{
	@Autowired
	private AdminQnADao adminQnADao;

	public List<Map<String, Object>> qnaList()
	{
		List<Map<String, Object>> qList =adminQnADao.qnaList();
		return qList;
	}


	public Map<String, Object> qnaDetail(int qna_num)
	{
		Map<String, Object> qMap = adminQnADao.qnaDetail(qna_num);
		return qMap;
	}


	public int qnaReply(Map<String, Object> pMap)
	{
		int result = adminQnADao.qnaReply(pMap);
		return result;
	}
}
