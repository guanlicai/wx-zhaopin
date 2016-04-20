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
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
	
	var a = $(".menuson:first li:first a");
	if (a.length > 0) {
		a.click();
		parent.rightFrame.location.href = a.attr("href");
	}
})
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>通讯录</div>
    
    <dl class="leftmenu">
    <c:forEach items="${menus}" var="menu">
    <dd>
    <div class="title" style="margin-left:20px;">
    ${menu.name}
    </div>
    	<ul class="menuson">
    	<c:forEach items="${menuItemMap[menu.id]}" var="itemMenu">
    	<li><cite></cite><a href="${baseURL}${itemMenu.url}" target="rightFrame">${itemMenu.name}</a><i></i></li>
    	</c:forEach>
        <%-- <li class="active"><cite></cite><a href="right.html" target="rightFrame">数据列表</a><i></i></li>
        <li><cite></cite><a href="imgtable.html" target="rightFrame">图片数据表</a><i></i></li>
        <li><cite></cite><a href="form.html" target="rightFrame">添加编辑</a><i></i></li>
        <li><cite></cite><a href="imglist.html" target="rightFrame">图片列表</a><i></i></li>
        <li><cite></cite><a href="imglist1.html" target="rightFrame">自定义</a><i></i></li>
        <li><cite></cite><a href="tools.html" target="rightFrame">常用工具</a><i></i></li>
        <li><cite></cite><a href="filelist.html" target="rightFrame">信息管理</a><i></i></li>
        <li><cite></cite><a href="tab.html" target="rightFrame">Tab页</a><i></i></li>
        <li><cite></cite><a href="error.html" target="rightFrame">404页面</a><i></i></li>
        <li><cite></cite><a href="${baseURL}/task/list.do" target="rightFrame">任务管理</a><i></i></li>
        <li><cite></cite><a href="${baseURL}/admin/auth/menu/item" target="rightFrame">菜单管理</a><i></i></li>
        <li><cite></cite><a href="${baseURL}/admin/auth/role/item" target="rightFrame">权限管理</a><i></i></li>
        <li><cite></cite><a href="${baseURL}/user/user_item.jsp" target="rightFrame">用户管理</a><i></i></li> --%>
        </ul>    
    </dd>
    </c:forEach>
    
    <%-- <dd>
    <div class="title">
    <span><img src="${baseURL}/assets/images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="index.html" target="rightFrame">首页模版</a><i></i></li>
        <li class="active"><cite></cite><a href="right.html" target="rightFrame">数据列表</a><i></i></li>
        <li><cite></cite><a href="imgtable.html" target="rightFrame">图片数据表</a><i></i></li>
        <li><cite></cite><a href="form.html" target="rightFrame">添加编辑</a><i></i></li>
        <li><cite></cite><a href="imglist.html" target="rightFrame">图片列表</a><i></i></li>
        <li><cite></cite><a href="imglist1.html" target="rightFrame">自定义</a><i></i></li>
        <li><cite></cite><a href="tools.html" target="rightFrame">常用工具</a><i></i></li>
        <li><cite></cite><a href="filelist.html" target="rightFrame">信息管理</a><i></i></li>
        <li><cite></cite><a href="tab.html" target="rightFrame">Tab页</a><i></i></li>
        <li><cite></cite><a href="error.html" target="rightFrame">404页面</a><i></i></li>
        <li><cite></cite><a href="${baseURL}/task/list.do" target="rightFrame">任务管理</a><i></i></li>
        <li><cite></cite><a href="${baseURL}/admin/auth/menu/item" target="rightFrame">菜单管理</a><i></i></li>
        <li><cite></cite><a href="${baseURL}/admin/auth/role/item" target="rightFrame">权限管理</a><i></i></li>
        <li><cite></cite><a href="${baseURL}/user/user_item.jsp" target="rightFrame">用户管理</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="${baseURL}/assets/images/leftico02.png" /></span>其他设置
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="${baseURL}/admin/business/list.html" target="rightFrame">商户管理</a><i></i></li>
        <li><cite></cite><a href="#" >产品管理</a><i></i></li>
        <li><cite></cite><a href="#">订单管理</a><i></i></li>
        <li><cite></cite><a href="#">报表统计</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="${baseURL}/assets/images/leftico03.png" /></span>微信设置</div>
    <ul class="menuson">
        <li><cite></cite><a href="${baseURL}/admin/gzh/list.html" target="rightFrame">公众号设置</a><i></i></li>
        <li><cite></cite><a href="#">常用资料</a><i></i></li>
        <li><cite></cite><a href="#">信息列表</a><i></i></li>
        <li><cite></cite><a href="#">其他</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="${baseURL}/assets/images/leftico04.png" /></span>日期管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="#">自定义</a><i></i></li>
        <li><cite></cite><a href="#">常用资料</a><i></i></li>
        <li><cite></cite><a href="#">信息列表</a><i></i></li>
        <li><cite></cite><a href="#">其他</a><i></i></li>
    </ul>
    
    </dd>    --%>
    
    </dl>
    
</body>
</html>
