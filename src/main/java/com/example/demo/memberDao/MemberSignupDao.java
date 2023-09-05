package com.example.demo.memberDao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberSignupDao
{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int signupInsert(Map<String, Object> pMap)
	{

		try
		{
			String temp = pMap.get("member_address").toString();
			String temp2 = pMap.get("member_addressdetail").toString();
			// 두 개의 값을 가져온 후 값을 이어서 member_address에 덮어쓰기를 한다.
			pMap.put("member_address", temp + " " + temp2);
			int result = sqlSessionTemplate.insert("signupInsert", pMap);
			return result;

		}

		catch (Exception e)
		{
			e.printStackTrace();
			return 0;
		}

	}


	public int member_delete(String member_id)
	{
		int result = sqlSessionTemplate.delete("member_delete", member_id);
		return result;
	}


	public int member_idCheck(String member_id)
	{
		int result = sqlSessionTemplate.selectOne("member_idCheck", member_id);
		return result;
	}


	public int member_emailCheck(String member_email)
	{
		int result = sqlSessionTemplate.selectOne("member_emailCheck", member_email);
		return result;
	}
}
