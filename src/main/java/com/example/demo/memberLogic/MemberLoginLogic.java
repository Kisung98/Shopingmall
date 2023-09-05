package com.example.demo.memberLogic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberLoginDao;

@Service
public class MemberLoginLogic
{
	@Autowired
	private MemberLoginDao memberLoginDao;

	public int login(Map<String, Object> pMap)
	{
		int result = memberLoginDao.login(pMap);
		return result;
	}


	public Map<String, Object> member(String member_id)
	{
		Map<String, Object> member =  memberLoginDao.member(member_id);
		return member;
	}


	public Map<String, Object> findMyid(Map<String, Object>pMap)
	{
		Map<String, Object> idMap =memberLoginDao.findMyid(pMap);
		return idMap;
	}


	public Map<String, Object> findMypw(String member_id)
	{
		Map<String, Object> pwMap =memberLoginDao.findMypw(member_id);
		return pwMap;
	}


	public int memberpwUpdate(Map<String, Object> pMap)
	{
		int result = memberLoginDao.memberpwUpdate(pMap);
		return result;
	}

}
