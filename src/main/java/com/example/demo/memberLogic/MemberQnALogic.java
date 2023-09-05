package com.example.demo.memberLogic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberQnADao;

@Service
public class MemberQnALogic
{
	@Autowired
	private MemberQnADao memberQnADao;

	public int memberqnaInsert(Map<String, Object> pMap)
	{
		int result = memberQnADao.memberqnaInsert(pMap);
		return result;
	}


	public int memberqnaDelete(String qna_num)
	{
		int result = memberQnADao.memberqnaDelete(qna_num);
		return result;
	}
}
