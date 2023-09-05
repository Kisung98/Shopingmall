package com.example.demo.adminController;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.adminLogic.AdminOrderLogic;

@Controller
@RequestMapping("/order/*")
public class AdminOrderController {
    
	@Autowired
	private AdminOrderLogic AdminOrderLogic = null;
	Logger logger = LoggerFactory.getLogger(AdminOrderController.class);

      //주문 목록

/* 	        SELECT	o.order_num, m.member_id, p.product_name, p.product_price, o.order_date
        FROM orders o
            JOIN member m ON o.order_member = m.member_num
            JOIN product p ON o.order_product = p.product_num
		ORDER BY o.order_num desc
 */
	@GetMapping("orderList")
	public String orderList(@RequestParam Map<String,Object> pMap, Model model){
		List<Map<String,Object>> oList = null;
		oList = AdminOrderLogic.orderList(pMap);
		model.addAttribute("oList", oList);
	return "forward:/adminOrder/AdminOrderList.jsp";
	}

		//주문 검색 (작성자 아이디)
/* 
SELECT o.order_num, m.member_id, p.product_name, p.product_price, o.order_date
FROM order o 
JOIN member u ON o.order_member = m.member_num 
JOIN product p ON o.order_product = p.product_num 
WHERE m.member_id = #{member_id}
ORDER BY o.order_num desc
 */

        //주문 상세
/*  
SELECT	o.order_num, o.order_date, m.member_id, m.member_name, m.member_phone, m.member_address, 
		p.product_num, p.product_category, p.product_name, p.product_image, p.product_color, p.product_storage, 
		p2.pay_method, p2.pay_amount 
FROM order o
JOIN member m ON o.order_member = m.member_num
JOIN product p ON o.order_product = p.product_num
JOIN pay p2 ON o.order_pay = p2.pay_num
WHERE o.order_num = #{order_num}
 */
	@GetMapping("orderDetail")
	public String orderDetail(@RequestParam int order_num, Model model){
		List<Map<String,Object>> oList = null;
		oList = AdminOrderLogic.orderDetail(order_num);
		model.addAttribute("oList", oList);
	return "forward:/adminOrder/AdminOrderDetail.jsp";
	}
    
        //주문 삭제
/* 
DELETE FROM order WHERE order_num=#{order_num}
 */
	@GetMapping("orderDelete")
	public String orderDelete(int order_num){;
		int result = AdminOrderLogic.orderDelete(order_num);
	return "redirect:/order/orderList";
	}
}
