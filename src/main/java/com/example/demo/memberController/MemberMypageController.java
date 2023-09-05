package com.example.demo.memberController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.memberLogic.MemberLoginLogic;
import com.example.demo.memberLogic.MemberMypageLogic;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/MemberMypage/*")
public class MemberMypageController
{

	@Autowired
	private MemberMypageLogic memberMypageLogic;
	@Autowired
	private MemberLoginLogic memberLoginLogic;

	// 마이페이지 기능들인데 장바구니는 따로빼놨어요... 하다보니 정신없어서 지송

	// 회원수정기능
	@GetMapping("updateMember")
	public String updateMember(HttpSession session, @RequestParam Map<String, Object> pMap)
	{

		int result = memberMypageLogic.updateMember(pMap);
		if (result == 1)
		{
			// 옛날세션 받아오고
			Map<String, Object> oldMember = (Map) session.getAttribute("member");

			// 거기서 멤버아이디값빼오고
			String member_id = oldMember.get("MEMBER_ID").toString();

			// 앞서만든 멤버정보뺴오는함수를 넣는다
			Map<String, Object> member = memberLoginLogic.member(member_id);

			// 다시받아와서 새로만든 세션값을 세션에 넣어준다.
			session.setAttribute("member", member);

		}
		return "redirect:/MemberMainpage/MemberMainpage";

	}


	// 회원수정기능에서 회원 탈퇴
	@GetMapping("deleteMember")
	public String deleteMeber(int member_num, HttpSession session)
	{
		int result = memberMypageLogic.deleteMember(member_num);
		session.invalidate();
		return "redirect:/MemberMainpage/MemberMainpage";
	}


	// 구매목록보기
	@GetMapping("payList")
	public String payList(int member_num, Model model)
	{
		List<Map<String, Object>> pList = memberMypageLogic.payList(member_num);
		model.addAttribute("pList", pList);
		return "forward:/memberMypage/payList.jsp";
	}

	// 구매목록상세
	@GetMapping("payDetail")
    public String orderDetail(@RequestParam("order_num") int order_num, Model model){
        List<Map<String, Object>> pList = null;
        pList = memberMypageLogic.payDetail(order_num);
        model.addAttribute("pList", pList);
        return "forward:/memberMypage/payDetail.jsp";
    }

}
