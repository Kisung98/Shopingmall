package com.example.demo.adminDao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminQnADao
{
	Logger logger = LoggerFactory.getLogger(AdminQnADao.class);
    @Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	public List<Map<String, Object>> qnaList()
	{
		List<Map<String, Object>> qList = sqlSessionTemplate.selectList("qnaList");
		logger.info(qList.toString());
		return qList;
	}

	public Map<String, Object> qnaDetail(int qna_num)
	{
		Map<String, Object> qMap = sqlSessionTemplate.selectOne("qnaDetail",qna_num);
		logger.info(qMap.toString());
		
		return qMap;
	}

	public int qnaReply(Map<String, Object> pMap)
	{
		int result = sqlSessionTemplate.insert("qnaReply", pMap);
		return result;
	}
}
