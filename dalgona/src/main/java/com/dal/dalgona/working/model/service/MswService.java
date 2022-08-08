package com.dal.dalgona.working.model.service;

import java.util.List;


import com.dal.dalgona.working.model.vo.Msw;

public interface MswService {

	
	List<Msw> cartList();

	List<Msw> zzimList();
	
	List<Msw> orderList();
}
