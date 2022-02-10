package com.turtle.spring.common;

import java.util.Map;

public class PageFactory {

	public static String getPageBar(int totalData, int cPage, int numPerpage, int pageBarSize, String url, Map param) {
		String pageBar="";
		String title = (String) param.get("title");
		String selectedValue = (String) param.get("selectedValue");
		System.out.println("title : "+title);
		System.out.println("selectedValue : "+selectedValue);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
			pageBar+="</li>";
		}
		
		pageBar+="</ul>";
		pageBar+="\n";
		pageBar+="<script>";
		pageBar+="\n";
		pageBar+="let title = $('.title').val();";
		pageBar+="\n";
		pageBar+="console.log(title);";
		pageBar+="\n";
		pageBar+="let selectedValue = $('.selectedValue').val();";
		pageBar+="\n";
		pageBar+="console.log(selectedValue);";
		pageBar+="\n";
		pageBar+="function fn_paging(cPage){";
		
		if(title==null && selectedValue==null) {
			pageBar+="location.assign('"+url+"cPage='+cPage);";
		}else if(title!=null && selectedValue==null) {
			System.out.println("메롱");
			
			pageBar+="location.assign('"+url+"cPage='+cPage+'&title='+title);";
		}else if(title!=null && selectedValue!=null) {
			pageBar+="location.assign('"+url+"cPage='+cPage+'&title='+title+'&selectedValue='+selectedValue);";
			
		}
		pageBar+="}";
		pageBar+="\n";
		pageBar+="</script>";
		
		return pageBar;
	}
		
}

