package com.example.demo.memberDao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

//@Repository는 외부 라이브러리를 연계하는 경우를 지원하기 위해서 별도로 제공되는 어노테이션임.
@Slf4j
@Repository 
public class MemberReviewDao {
	@Autowired
	// SqlSessionTemplate는 myBatis 진영과 spring 을 연결시켜주는 클래스임.
	// SqlSessionTemplate는 DatabaseConfiguration.java에 선언되어 있어 인스턴스를 따로 하지 않아도 됨.
	//변조를 막기 위해 private로 선언
	private SqlSessionTemplate sqlSessionTemplate = null;

	//리뷰목록
	public List<Map<String, Object>> reviewList(Map<String, Object> pMap) {
		log.info("reviewList");
		List<Map<String, Object>> rList = null;
		rList = sqlSessionTemplate.selectList("reviewList", pMap);
		return rList;
	}

	//리뷰입력
	public int reviewInsert(Map<String, Object> pMap) {
		log.info("reviewInsert");
		log.info(pMap.toString()); //사용자가 입력한 값 제대로 넘어왔는지 확인인
		int result = -1;
		result = sqlSessionTemplate.insert("reviewInsert", pMap);
		return result;
	}

	//리뷰수정
	public int reviewUpdate(int review_num) {
		log.info("reviewUpdate");
		int result = -1;
		result = sqlSessionTemplate.update("reviewUpdate", review_num);
		return result;
	}

		//리뷰삭제
	public int reviewDelete(int review_num) {
		log.info("reviewDelete");
		int result = 0;
		result = sqlSessionTemplate.delete("reviewDelete", review_num);
		return result;
	}

}