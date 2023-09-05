package com.example.demo.memberLogic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.memberDao.MemberReviewDao;

import lombok.extern.slf4j.Slf4j;

//@Service는 모델계층을 정의할 때 사용하는 어노테이션으로 서비스 계층을 의미함.
@Slf4j
@Service
public class MemberReviewLogic {
  @Autowired
  //변조를 막기 위해 private로 선언
  private MemberReviewDao memberReviewDao = null;

  public List<Map<String, Object>> reviewList(Map<String, Object> pMap) {
    log.info("reviewList");
    List<Map<String, Object>> rList = null;
    rList = memberReviewDao.reviewList(pMap);
    return rList;
  }

  //리뷰 입력
  public int reviewInsert(Map<String, Object> pMap) {
    log.info("reviewInsert");
    int result = -1;
    result = memberReviewDao.reviewInsert(pMap); 
    return result;
  }

  //리뷰 수정
  public int reviewUpdate(int review_num) {
    log.info("reviewUpdate");
    int result = -1;
    result = memberReviewDao.reviewUpdate(review_num);
    return result;
  }
  
  //리뷰 삭제
  public int reviewDelete(int review_num) {
    log.info("reviewDelete");
    int result = 0;
    result = memberReviewDao.reviewDelete(review_num);
    return result;
  }

}