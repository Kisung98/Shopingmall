package com.example.demo.memberDao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberPaymentDao
{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	// 배선영
	public int kakaopayInsert(Map<String, Object> pMap)
	{
		log.info("kakaopayInsert");
		log.info(pMap.toString()); // 사용자가 입력한 값 제대로 넘어왔는지 확인인
		int result = -1;
		result = sqlSessionTemplate.insert("kakaopayInsert", pMap);
		return result;
	}


//배선영
	public int payInsert(Map<String, Object> pMap)
	{
		int result = sqlSessionTemplate.insert("payInsert", pMap);
		return result;
	}


	public int insertOrders(int member_num)
	{
		int result = sqlSessionTemplate.insert("insertOrders", member_num);
		return result;
	}


	public int cartDeleteAll(int member_num)
	{
		int result = sqlSessionTemplate.delete("cartDeleteAll",member_num);
		return result;
	}
}
