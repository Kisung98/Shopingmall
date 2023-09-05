package com.example.demo.memberLogic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberSignupDao;
import com.example.demo.vo.MemberVo;

@Service
public class MemberSignupLogic
{
	@Autowired
    private MemberSignupDao memberSignupDao ;

	public int signupInsert(Map<String, Object> pMap)
	{
		int result = memberSignupDao.signupInsert(pMap); 
		return result;
	}

	public int member_idCheck(String member_id)
	{
		int result = memberSignupDao.member_idCheck(member_id);
		return result;
	}
	
	public int member_delete(String member_id)
	{
		int result = memberSignupDao.member_delete(member_id);
		return result;
	}

	public int member_emailCheck(String member_email)
	{
		int result = memberSignupDao.member_emailCheck(member_email);
		return result;
	}

	
}
