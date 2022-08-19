package com.dal.dalgona.qna.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Qna;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Override
	public List<Qna> selectQnasTop8(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("qna.selectQnasTop8");
	}

}
