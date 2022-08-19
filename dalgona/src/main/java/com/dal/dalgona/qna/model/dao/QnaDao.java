package com.dal.dalgona.qna.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Qna;

public interface QnaDao {
	List<Qna> selectQnasTop8(SqlSessionTemplate session);
}
