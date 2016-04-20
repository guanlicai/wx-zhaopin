<%@page import="com.shop.base.hibernate.helper.Page"%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%!
public int formatNumber(Object obj, int def) {
	int number = def;
	try {
		number = new Integer(obj.toString()).intValue();
	} catch (NumberFormatException e) {
		e.printStackTrace();
	}
	return number;
}
%>
<%
	int curPage = formatNumber(request.getParameter("curPage"), 1);
	int pageSize = formatNumber(request.getParameter("pageSize"), 1);
	int total = formatNumber(request.getParameter("total"), 1);

	int pageTotal = total / pageSize + (total % pageSize == 0 ? 0 : 1);
	
	int begin = 0;//显示五个
	int end = 0;
	int showNum = 5;
	if (pageTotal <= showNum) {
		begin = 1;
		end = pageTotal;
	} else {
		if (curPage > (showNum/2 + 1)) {
			begin = curPage - showNum/2;
		} else {
			begin = curPage;
		}
		if (pageTotal <= (end - showNum/2)) {
			end = (end - showNum/2);
		} else {
			end = (begin + showNum - 1) > pageTotal ? pageTotal : (begin + showNum - 1);
		}
	}
	
	pageContext.setAttribute("curPage", curPage);
	pageContext.setAttribute("pageSize", pageSize);
	pageContext.setAttribute("total", total);
	pageContext.setAttribute("pageTotal", pageTotal);
	pageContext.setAttribute("begin", begin);
	pageContext.setAttribute("end", end);
	
	/*Page pageObj = new page();
	pageObj.setCurrPage(curPage);
	pageObj.setTotal(total);
	pageObj.setPageSize(pageSize);
	pageContext.setAttribute("page", pageObj);*/
%>
<div class="pagin">
	<div class="message">共<i class="blue"> ${total} </i>条记录，当前显示第&nbsp;<i class="blue">${curPage}&nbsp;</i>页</div>
    <ul class="paginList">
       <c:if test="${curPage != 1 && pageTotal > 1}">
       		<li class="paginItem"><a href="javascript:turnPage('${curPage - 1}');"><span class="pagepre"></span></a></li>
       </c:if>
       <c:if test="${begin > 1}"><li class="paginItem"><a href="javascript:turnPage(1);">1</a></li></c:if>
       <c:if test="${begin > 2}"><li class="paginItem more"><a href="javascript:;">...</a></li></c:if>
       
       <c:forEach begin="${begin}" end="${end}" varStatus="st">
       		<li class="paginItem <c:if test="${st.index == curPage}">current</c:if>"><a href="javascript:turnPage('${st.index}');">${st.index}</a></li>
       </c:forEach>
       <c:if test="${end < pageTotal - 1}"><li class="paginItem more"><a href="javascript:;">...</a></li></c:if>
       <c:if test="${end < pageTotal}"><li class="paginItem"><a href="javascript:turnPage('${pageTotal}');">${pageTotal}</a></li></c:if>
       <c:if test="${curPage < pageTotal}">
       		<li class="paginItem"><a href="javascript:turnPage('${curPage + 1}');"><span class="pagenxt"></span></a></li>
       	</c:if>
       <!-- <li class="paginItem"><a href="javascript:;">1</a></li>
       <li class="paginItem current"><a href="javascript:;">2</a></li>
       <li class="paginItem"><a href="javascript:;">3</a></li>
       <li class="paginItem"><a href="javascript:;">4</a></li>
       <li class="paginItem"><a href="javascript:;">5</a></li>
       <li class="paginItem more"><a href="javascript:;">...</a></li>
       <li class="paginItem"><a href="javascript:;">10</a></li> -->
    </ul>
</div>
  
  
  
  