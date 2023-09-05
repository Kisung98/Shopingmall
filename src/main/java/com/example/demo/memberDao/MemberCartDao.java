package com.example.demo.memberDao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberCartDao
{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> cartList(int member_num)
	{
		List<Map<String, Object>> cList = sqlSessionTemplate.selectList("cartList", member_num);
		return cList;
	}


	public int cartInsert(Map<String, Object> pMap)
	{
		int result = sqlSessionTemplate.insert("cartInsert", pMap);
		return result;
	}


	public int cartDelete(Map<String, Object> pMap)
	{
		int result = sqlSessionTemplate.delete("cartDelete",pMap);
		return result;
	}
	
	
	
	

}
