package com.example.demo.memberController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.memberLogic.MemberCartLogic;
import com.example.demo.memberLogic.MemberPaymentLogic;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/payment/*")
public class MemberPaymentController
{
	@Autowired
	private MemberPaymentLogic memberPaymentLogic = null;

	@Autowired
	private MemberCartLogic memberCartLogic;

	// 장바구니목록을 주문목록에담고 결제창으로 이동하는 컨트롤러
	@GetMapping("doPayment")
	public String doPayment(int member_num, Model model)
	{
		List<Map<String, Object>> cList = memberCartLogic.cartList(member_num);
		model.addAttribute("cList", cList);
		return "forward:/memberPayment/doPayment.jsp";
	}


	// 카카오페이결제 버튼을 눌렀을때
	@GetMapping("kakaopay")
	public String kakaopay(@RequestParam Map<String, Object> pMap, Model model)
	{	
		// 결제정보를 결제테이블에 넣어준다.
		int result2 = memberPaymentLogic.insertOrders(Integer.parseInt(pMap.get("member_num").toString()));
		int result = memberPaymentLogic.payInsert(pMap);
		// 결제를 했으니 장바구니 목록을 비워준다
		int result1 = memberPaymentLogic.cartDeleteAll(Integer.parseInt(pMap.get("member_num").toString()));
		// 카카오페이결제루틴
		// 이름이랑 총결제금액,담은물품들
		model.addAttribute("pMap",pMap);
		return "forward:/memberPayment/kakaoPayment.jsp";
	}


	// 무통장입금
	@GetMapping("pay")
	public String pay(@RequestParam Map<String, Object> pMap)
	{
		int result2 = memberPaymentLogic.insertOrders(Integer.parseInt(pMap.get("member_num").toString()));
		int result = memberPaymentLogic.payInsert(pMap);
		int result1 = memberPaymentLogic.cartDeleteAll(Integer.parseInt(pMap.get("member_num").toString()));
		return "redirect:/memberPayment/paySuccess.jsp";
	}


	// 결제창에서 카카오페이를 눌렀을때 카카오페이결제가 실행되는 컨트롤러
	//
	@GetMapping("kakaoPayment")
	public String kakaoPayment(int member_num)
	{

		return "redirect:/payment/kakaopay";

	}

}
