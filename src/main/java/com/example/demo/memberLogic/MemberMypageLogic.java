package com.example.demo.memberLogic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberMypageDao;

@Service
public class MemberMypageLogic
{
	@Autowired
	private MemberMypageDao memberMypageDao;

	public int updateMember(Map<String, Object> pMap)
	{
		int result = memberMypageDao.updateMember(pMap);
		return result;
	}


	public int deleteMember(int member_num)
	{
		int result = memberMypageDao.deleteMember(member_num);
		return result;
	}


	public List<Map<String, Object>> payList(int member_num)
	{	
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("member_num", member_num);
		List<Map<String, Object>> pList = memberMypageDao.payList(pMap);
		return pList;
	}


	public List<Map<String, Object>> payDetail(int order_num) 
	{
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("order_num", order_num);
		List<Map<String, Object>> pList = memberMypageDao.payList(pMap);
		return pList;
	}

}
