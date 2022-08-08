package com.dal.dalgona.working.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Category;
@Repository
public interface CategoryDao extends JpaRepository<Category, Long> {
	
	Category findByCategoryName(String categoryName);
	
	Category save(Category cate);
	
}
