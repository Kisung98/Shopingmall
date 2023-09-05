package com.example.demo.memberDao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberQnADao
{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int memberqnaInsert(Map<String, Object> pMap)
	{
		int result = sqlSessionTemplate.insert("memberqnaInsert", pMap);
		return result;

	}


	public int memberqnaDelete(String qna_num)
	{
		int result = sqlSessionTemplate.delete("memberqnaDelete", qna_num);
		return result;
	}
}
