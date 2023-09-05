package com.example.demo.adminDao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.vo.MemberVo;

@Repository
public class AdminMemberDao
{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	public List<MemberVo> memberList()
	{
		List<MemberVo> mList = sqlSessionTemplate.selectList("memberList");
		return mList;
	}


	public List<MemberVo> memberSearch(String member_name)
	{
		List<MemberVo> mList = sqlSessionTemplate.selectList("memberSearch", member_name);
		return mList;
	}

}
