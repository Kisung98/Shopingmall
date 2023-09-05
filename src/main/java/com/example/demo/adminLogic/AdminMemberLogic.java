package com.example.demo.adminLogic;

import java.util.List;

//import java.util.List;
//import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.adminDao.AdminMemberDao;
import com.example.demo.vo.MemberVo;

@Service
public class AdminMemberLogic
{
	@Autowired
	private AdminMemberDao adminMemberDao;

	public List<MemberVo> memberList()
	{
		List<MemberVo> mList = adminMemberDao.memberList();
		return mList;
	}


	public List<MemberVo> memberSearch(String member_name)
	{
		List<MemberVo> mList = adminMemberDao.memberSearch(member_name);
		return mList;
	}


	

}
