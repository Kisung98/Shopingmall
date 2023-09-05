package com.example.demo.memberDao;

import java.util.List;
import java.util.Map;

import org.apache.tomcat.websocket.server.WsRemoteEndpointImplServer;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberMypageDao
{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int updateMember(Map<String, Object> pMap)
	{
		String temp1 = pMap.get("member_address").toString();
		String temp2 = pMap.get("member_addressdetail").toString();
		String member_address = temp1 + " " + temp2;
		pMap.put("member_address", member_address);
		int result = sqlSessionTemplate.update("updateMember", pMap);
		return result;

	}


	public int deleteMember(int member_num)
	{
		int result = sqlSessionTemplate.delete("deleteMember", member_num);
		return result;

	}


	public List<Map<String, Object>> payList(Map<String, Object> pMap)
	{
		List<Map<String, Object>> pList = sqlSessionTemplate.selectList("payList", pMap);
		return pList;
	}

}
