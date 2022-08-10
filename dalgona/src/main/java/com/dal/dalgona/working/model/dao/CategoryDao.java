package com.dal.dalgona.working.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Category;
import com.dal.dalgona.common.model.vo.Product;
@Repository
public interface CategoryDao extends JpaRepository<Category, Long> {
	
	Category findByCategoryName(String categoryName);
	
	Category save(Category cate);
	
	Category findByProducts(Product p);
	
}
