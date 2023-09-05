package com.example.demo.memberController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.adminLogic.AdminProductLogic;
import com.example.demo.memberDao.MemberMainpageDao;
import com.example.demo.memberLogic.MemberMainpageLogic;

@RequestMapping("MemberMainpage/*")
@Controller
public class MemberMainpageController
{
	@Autowired
	private AdminProductLogic adminProductLogic;

	@Autowired
	MemberMainpageLogic memberMainpageLogic;
	
	@Autowired
	MemberMainpageDao memberMainpageDao;

	@GetMapping("MemberMainpage")
	public String MemberMainpage(@RequestParam Map<String, Object> pMap, Model model)
	{
		List<Map<String, Object>> pList = adminProductLogic.productList(pMap);
		model.addAttribute("pList", pList);
		return "forward:/memberPage.jsp";
	}


	@GetMapping("MemberHeaderCategory")
	public String MemberHeaderCatrgory(String product_category, Model model)
	{
		List<Map<String, Object>> pList = memberMainpageLogic.productList(product_category);
		model.addAttribute("pList", pList);
		return "forward:/memberPage.jsp";
	}


	@GetMapping("memberProductDetail")
	public String MemberProductDetail(@RequestParam int product_num, Model model)
	{
		List<Map<String, Object>> pList = null;
		pList = adminProductLogic.productDetail(product_num);
		model.addAttribute("pList", pList);
		return "forward:/memberProductPage/MemberProductDetail.jsp";
	}
	
	@GetMapping("productSearch")
	public String productSearch(String product_name , Model model)
	{
		List<Map<String, Object>> pList = memberMainpageDao.productSearch(product_name);
		model.addAttribute("pList",pList);
		return "forward:/memberPage.jsp";
		
		
		
	}

}
