package com.dal.dalgona.common;

import java.util.Calendar;

public class CreateRndNum { // productcode에 삽입 불가능/불필요시 삭제
	
	public static String rndNum() {
		
		Calendar cal=Calendar.getInstance();
 
		int y=cal.get(Calendar.YEAR);
		int m=cal.get(Calendar.MONTH)+1;
		int d=cal.get(Calendar.DATE);
 
		StringBuilder sb=new StringBuilder();
		sb.append(y).append(m).append(d);
 
		for (int i=0; i<10; i++) {
			int random=(int)(Math.random()*10);
			sb.append(random);
		}
		
		return sb.toString();
		
	}

}
