package com.example.demo.adminDao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class fileinsertDao
{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int Insert(Map<String, String> params)
	{
		int result = sqlSessionTemplate.insert("fileInsert", params);
		return result;
	}


	public List<Map<String, Object>> Check()
	{
		List<Map<String, Object>> fList = sqlSessionTemplate.selectList("fileCheck");
		return fList;
	}

}
