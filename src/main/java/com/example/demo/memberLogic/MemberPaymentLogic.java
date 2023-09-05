package com.example.demo.memberLogic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberPaymentDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberPaymentLogic
{
	@Autowired
	private MemberPaymentDao memberPaymentDao = null;

	public int kakaopayInsert(Map<String, Object> pMap)
	{
		log.info("kakaopayInsert");
		int result = -1;
		result = memberPaymentDao.kakaopayInsert(pMap);
		return result;
	}


	public int payInsert(Map<String, Object> pMap)
	{
		int result = memberPaymentDao.payInsert(pMap);
		return result;
	}


	public int insertOrders(int member_num)
	{
		int result = memberPaymentDao.insertOrders(member_num);
		return result;
	}


	public int cartDeleteAll(int member_num)
	{
		int result = memberPaymentDao.cartDeleteAll(member_num);
		return result;
	}

}
