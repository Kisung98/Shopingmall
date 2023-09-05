package com.example.demo.memberLogic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberCartDao;

@Service
public class MemberCartLogic
{
	@Autowired
	private MemberCartDao memberCartDao;

	public List<Map<String, Object>> cartList(int member_num)
	{
		List<Map<String, Object>> cList = memberCartDao.cartList(member_num);
		return cList;
	}

	public int cartInsert(Map<String, Object> pMap)
	{
		int result = memberCartDao.cartInsert(pMap);
		return result;
	}

	public int cartDelete(Map<String, Object> pMap)
	{
		int result = memberCartDao.cartDelete(pMap);
		return result;
	}

}
