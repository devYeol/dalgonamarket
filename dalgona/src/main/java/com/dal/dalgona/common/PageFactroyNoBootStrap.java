package com.dal.dalgona.common;

public class PageFactroyNoBootStrap {
	public static String getPageBar(long totalData, int numPerpage, int cPage, String url) {
		String pageBar="";
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<a href='#'>이전 </a>";
		} else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<a href='#'>"+pageNo+"</a>";
			} else {
				pageBar+="<a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<a href='#'> 다음</a>";
		} else {
			pageBar+="<a href='javascript:fn_paging("+pageNo+")'>다음</a>";
		}
		
		pageBar+="<script>";
		pageBar+="function fn_paging(pageNo){";
		pageBar+="location.assign('"+url+"?cPage='+pageNo)";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
}
