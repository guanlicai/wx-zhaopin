<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="baseURL" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseURL}/assets/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${baseURL}/assets/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})

function chageTopMenu(href) {
	parent.location = href;
}
</script>


</head>

<body style="background:url(${baseURL}/assets/images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.html" target="_parent"><img src="${baseURL}/assets/images/logo.png" title="系统首页" /></a>
    </div>
        <!--  -->
    <ul class="nav">
    <c:forEach items="${menus}" var="menu" varStatus="st">
    <c:if test=""></c:if>
    <c:set var="selected" value="${!empty meunParentId ? (menu.id eq meunParentId) : st.index == 0}"></c:set>
    <li><a href="javascript:void(0);" <c:if test="${selected}">class="selected"</c:if> onclick="chageTopMenu('${baseURL}${menu.url}?menuId=${menu.id}');" ><img title="${menu.name}" src="${baseURL}${menu.ico}" title="工作台" /><h2>${menu.name}</h2></a></li>
    </c:forEach>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="${baseURL}/assets/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="${baseURL }/admin/auth/loginout.html" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${username}</span>
    <i>消息</i>
    <b>5</b>
    </div>    
    
    </div>

</body>
</html>
