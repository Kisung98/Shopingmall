package com.example.demo.adminDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDao
{
    Logger logger = LoggerFactory.getLogger(AdminProductDao.class);

    @Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String, Object>> productList(Map<String, Object> pMap) {
        List<Map<String,Object>> pList = null;
        pList = sqlSessionTemplate.selectList("adminProductList",pMap);
        return pList;
    }

    public List<Map<String, Object>> productDetail(Map<String, Object> pMap) {
        List<Map<String,Object>> pList = null;
        List<Map<String,Object>> rList = null;
        Map<String,Object> rmap = new HashMap<>();
        pList = sqlSessionTemplate.selectList("adminProductList",pMap);
        rList = sqlSessionTemplate.selectList("adminReviewList",pMap);
        rmap.put("product_reivew", rList);
        pList.add(rmap);
        return pList;
    }

    public int productInsert(Map<String, Object> pMap) {
        int result = sqlSessionTemplate.insert("adminProductInsert", pMap);
        return result;
    }

    public int productUpdate(Map<String, Object> pMap) {
        int result = sqlSessionTemplate.update("adminProductUpdate", pMap);
        return result;
    }

    public int productDelete(int product_num) {
        int result = sqlSessionTemplate.delete("adminProductDelete", product_num);
        return result;
    }

}
