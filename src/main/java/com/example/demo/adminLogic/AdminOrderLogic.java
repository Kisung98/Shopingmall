package com.example.demo.adminLogic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.adminDao.AdminOrderDao;

@Service
public class AdminOrderLogic
{
    Logger logger = LoggerFactory.getLogger(AdminOrderLogic.class);
    @Autowired
    private AdminOrderDao adminOrderDao = null;
    
    public List<Map<String, Object>> orderList(Map<String, Object> pMap) {
        List<Map<String,Object>> oList = null;
        oList = adminOrderDao.orderList(pMap);
        return oList;
    }

    public List<Map<String, Object>> orderDetail(int order_num) {
        List<Map<String,Object>> oList = null;
        Map<String,Object> pMap = new HashMap<>();
        pMap.put("order_num", order_num);
        oList = adminOrderDao.orderList(pMap);
        return oList;
    }

    public int orderDelete(int order_num) {
        int result = adminOrderDao.orderDelete(order_num);
        return result;
    }


}
