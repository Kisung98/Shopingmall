package com.example.demo.memberLogic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberMainpageDao;



@Service
public class MemberMainpageLogic
{
	@Autowired
	private MemberMainpageDao memberMainpageDao;

	public List<Map<String, Object>> productList(String product_category)
	{
		List<Map<String, Object>> pList = memberMainpageDao.productList(product_category);
		return pList;
	}


}
