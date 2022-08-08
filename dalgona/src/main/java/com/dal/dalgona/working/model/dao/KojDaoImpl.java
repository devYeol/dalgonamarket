package com.dal.dalgona.working.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dal.dalgona.common.model.vo.Product;

public class KojDaoImpl implements KojDao {

	@Override
	public Product selectProduct(SqlSession session,long productCode) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectProduc",productCode);
	}

}
