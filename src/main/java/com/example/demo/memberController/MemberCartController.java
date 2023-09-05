package com.example.demo.memberController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.adminLogic.AdminMemberLogic;
import com.example.demo.memberLogic.MemberCartLogic;
import com.example.demo.memberLogic.MemberLoginLogic;
import com.example.demo.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cart/*")
public class MemberCartController
{

	@Autowired
	private MemberCartLogic memberCartLogic;

	@GetMapping("cartList")
	public String cartList(int member_num, Model model)
	{
		List<Map<String, Object>> cList = memberCartLogic.cartList(member_num);
		model.addAttribute("cList", cList);
		return "forward:/memberMypage/cartList.jsp";
	}


	@GetMapping("cartInsert")
	public String cartInsert(@RequestParam Map<String, Object> pMap)
	{
		log.info(pMap.toString());
		int member_num = Integer.parseInt(pMap.get("cart_member_num").toString());
		pMap.put("cart_user_num", member_num);
		int result = memberCartLogic.cartInsert(pMap);

		return "redirect:/cart/cartList?member_num=" + member_num;

	}


	@GetMapping("cartDelete")
	public String cartDelete(@RequestParam Map<String, Object> pMap) {
		int member_num = Integer.parseInt(pMap.get("cart_member_num").toString());
		int result = memberCartLogic.cartDelete(pMap);
		return "redirect:/cart/cartList?member_num=" + member_num;
	}

}
