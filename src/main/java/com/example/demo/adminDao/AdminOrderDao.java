package com.example.demo.adminDao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOrderDao
{
    Logger logger = LoggerFactory.getLogger(AdminOrderDao.class);

    @Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String, Object>> orderList(Map<String, Object> pMap) {
        List<Map<String,Object>> oList = null;
        oList = sqlSessionTemplate.selectList("adminOrderList",pMap);
        logger.info(oList.toString());
        return oList;
    }

    public int orderDelete(int order_num) {
        int result = sqlSessionTemplate.delete("adminOrderDelete",order_num);
        return result;
    }

}
