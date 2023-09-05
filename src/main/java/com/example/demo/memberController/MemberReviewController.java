package com.example.demo.memberController;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.example.demo.memberLogic.MemberReviewLogic;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller //출력이 jsp로 나가므로 @RestController가 아닌 @Controller로 사용
@RequestMapping("/review/*")
public class MemberReviewController {
	@Autowired
	//변조를 막기 위해 private로 선언
	private MemberReviewLogic memberReviewLogic = null;

	// 리뷰 목록
	@GetMapping("reviewList")
	public String reviewList(@RequestParam Map<String, Object> pMap, Model model) {
		log.info("reviewList");
		List<Map<String, Object>> rList = null;
		rList = memberReviewLogic.reviewList(pMap);
		model.addAttribute("rList", rList);
		return "forward:reviewList.jsp";
	}

	// 리뷰 등록
	@GetMapping("reviewInsert")
	public String reviewInsert(@RequestParam Map<String, Object> pMap) {
		log.info("reviewInsert");
		log.info(pMap.toString());
		int result = -1;
		result = memberReviewLogic.reviewInsert(pMap);
		int member_num = Integer.parseInt(pMap.get("review_writer").toString());
		//값의 변경과 화면 전환이 이루어지므로 redirect로 선언
		return "redirect:/MemberMypage/payList?member_num="+member_num;
	}

	// 리뷰 수정
	@GetMapping("reviewUpdate")
	public String reviewUpdate(int review_no) {
		log.info("reviewUpdate");
		log.info("review_no"+ review_no);
		int result = -1;
		result = memberReviewLogic.reviewUpdate(review_no);
		return "redirect:/review/reviewList";
	}

	// 리뷰 삭제
	@GetMapping("reviewDelete")
	public String reviewDelete(int review_no) {
		log.info("reviewDelete");
		log.info("review_no"+ review_no);
		int result = -1;
		result = memberReviewLogic.reviewDelete(review_no);
		return "redirect:/review/reviewList";
	}
}