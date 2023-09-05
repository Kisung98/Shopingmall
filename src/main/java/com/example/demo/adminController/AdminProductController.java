package com.example.demo.adminController;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.adminLogic.AdminProductLogic;

@Controller
@RequestMapping("/product/*")
public class AdminProductController
{
	//이거를 자기 컴퓨터 절대경로 따오는데 하는법이 webapp밑에 images폴더 우클릭 프로퍼티스 맨밑에 누르고 경로보이면 그거 복사하셈
	// ex) C:\Users\godbu\Desktop\returnHappy\src\main\webapp\images 이렇게 나오는데 밑에 코드처럼 역슬래쉬 두개씩 붙히셈
	String projectPath = "C:\\Users\\godbu\\Desktop\\returnHappy\\src\\main\\webapp\\images";
	@Autowired
	private AdminProductLogic adminProductLogic = null;

	// 상품 목록
	/*
	 * SELECT product_num, product_category, product_name, product_image FROM product ORDER BY product_num desc
	 */
	@GetMapping("productList")
	public String productList(@RequestParam Map<String, Object> pMap, Model model)
	{
		List<Map<String, Object>> pList = null;
		pList = adminProductLogic.productList(pMap);
		model.addAttribute("pList", pList);
		return "forward:/adminProduct/AdminProductList.jsp";
	}

	// 상품명 검색
	/*
	 * SELECT product_num, product_category, product_name, product_image FROM product WHERE product_name = #{product_name} ORDER BY product_num desc
	 */


	// 상품 상세
	/*
	 * SELECT * FROM product WHERE product_num = #{product_num}
	 * 
	 * SELECT review_num, review_writer, review_grade, review_content FROM review WHERE review_order_num IN ( SELECT order_num as review_order_num FROM orders WHERE
	 * order_product = #{product_num} ) ORDER BY review_num;
	 */
	@GetMapping("productDetail")
	public String productDetail(@RequestParam int product_num, Model model)
	{
		List<Map<String, Object>> pList = null;
		pList = adminProductLogic.productDetail(product_num);
		model.addAttribute("pList", pList);
		return "forward:/adminProduct/AdminProductDetail.jsp";
	}


	@GetMapping("productGoInsert")
	public String productGoInsert()
	{
		return "forward:/adminProduct/AdminProductInsert.jsp";
	}


	// 상품 등록
	/*
	 * INSERT INTO product(product_num, product_category, product_name, product_image, product_color, product_storage, product_describe, product_price)
	 * VALUES(seq_product_num.nextval, #{product_category}, #{product_name}, #{product_image}, #{product_color}, #{product_storage}, #{product_describe},
	 * #{product_price})
	 */
	@PostMapping("productInsert")
	public String productInsert(@RequestParam Map<String, Object> pMap,
			@RequestParam("product_image") MultipartFile file)
	{
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		// webapp/images 경로
		// 각자 바꿔주세요 
	
		File dest = new File(projectPath, fileName);
		try
		{
			file.transferTo(dest);
			String filePath = "/images/" + fileName;
			pMap.put("product_image", filePath);
			int result = adminProductLogic.productInsert(pMap);
		} catch (Exception e)
		{
			// TODO: handle exception
		}
		return "redirect:/product/productList";
	}


	// 상품 수정
	/*
	 * UPDATE product SET prodcut_category = #{product_category}, prodcut_name = #{product_name}, prodcut_image = #{product_image}, prodcut_color =
	 * #{product_color}, prodcut_storage = #{product_storage}, prodcut_describe = #{product_describe}, prodcut_color = #{product_color} WHERE product_num =
	 * #{product_num}
	 */
	@PostMapping("productUpdate")
	public String productUpdate(@RequestParam Map<String, Object> pMap,
			@RequestParam(value = "product_image", required = false) MultipartFile file)
	{
		if (file != null && !file.isEmpty())
		{
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			// webapp/images 경로 각자 컴경로로 바꿔주세요
			
			File dest = new File(projectPath, fileName);
			try
			{
				file.transferTo(dest);
				String filePath = "/images/" + fileName;
				pMap.put("product_image", filePath);
				int result = adminProductLogic.productUpdate(pMap);
			} catch (Exception e)
			{
				// TODO: handle exception
			}
		} else
		{
			int result = adminProductLogic.productUpdate(pMap);
		}
		return "redirect:/product/productList";
	}


	// 상품 삭제
	/*
	 * DELETE FROM prodcut WHERE product_num=#{product_num}
	 */
	@GetMapping("productDelete")
	public String productDelete(@RequestParam int product_num)
	{
		int result = adminProductLogic.productDelete(product_num);
		return "redirect:/product/productList";
	}
}
