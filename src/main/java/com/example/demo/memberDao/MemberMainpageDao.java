package com.example.demo.memberDao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberMainpageDao
{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> productList(String product_category)
	{
		List<Map<String, Object>> pList = sqlSessionTemplate.selectList("product_categortList", product_category);
		return pList;
	}


	public List<Map<String, Object>> productSearch(String product_name)
	{
		List<Map<String, Object>> pList = sqlSessionTemplate.selectList("productSearch", product_name);
		return pList;
	}

}
