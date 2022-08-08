package com.dal.dalgona.working.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dal.dalgona.common.model.vo.Product;

public interface KojDao {
	
	Product selectProduct(SqlSession session, long productCode);

}
