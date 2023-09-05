package com.example.demo.memberDao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberNoticeDao
{
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate = null;
}
