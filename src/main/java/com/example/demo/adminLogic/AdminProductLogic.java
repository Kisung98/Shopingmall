package com.example.demo.adminLogic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.adminDao.AdminProductDao;

@Service
public class AdminProductLogic
{

    @Autowired
    private AdminProductDao adminProductDao = null;

    public List<Map<String, Object>> productList(Map<String, Object> pMap) {
        List<Map<String,Object>> pList = null;
        pList = adminProductDao.productList(pMap);
        return pList;
    }

    public List<Map<String, Object>> productDetail(int product_num) {
        List<Map<String,Object>> pList = null;
        Map<String, Object> pMap = new HashMap<>();
        pMap.put("product_num", product_num);
        pList = adminProductDao.productDetail(pMap);
        return pList;
    }

    public int productInsert(Map<String, Object> pMap) {
        int result = adminProductDao.productInsert(pMap);
        return result;
    }

    public int productUpdate(Map<String, Object> pMap) {
        int result = adminProductDao.productUpdate(pMap);
        return result;

    }

    public int productDelete(int product_num) {
        int result = adminProductDao.productDelete(product_num);
        return result;

    }
}
