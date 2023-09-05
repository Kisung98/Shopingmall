package com.example.demo.memberLogic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberNoticeDao;

@Service
public class MemberNoticeLogic
{
	@Autowired(required=false)
    private MemberNoticeDao memberNoticeDao = null;
}
