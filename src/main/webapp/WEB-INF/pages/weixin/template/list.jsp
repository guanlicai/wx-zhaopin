<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#newBtn").click(function(){
	  	window.location.href = "${baseUrl}/admin/wxtemplate/edit.html";
	  });
	  $("#modifyBtn").click(function(){
	  	
	  	if(JS.selectOne()){
	  		window.location.href = "${baseUrl}/admin/wxtemplate/edit.html?id="+JS.getSelect();
	  	}
	  	else{
	  		alert("请选择一条数据");
	  	}
	  });
	  $("#delBtn").click(function(){
	  	if(JS.selectOne()){
	  		JS.deleteDate("${baseUrl}/admin/wxtemplate/del.html?roleId=${roleId}");
	  	}
	  	else{
	  		alert("请选择待删除数据");
	  	}
	  });
	  
	  
	  $(".tiptop a").click(function(){
	  	$(".tip").fadeOut(200);
	  });
	
	  $(".sure").click(function(){
	  $(".tip").fadeOut(100);
	});
	
	  $(".cancel").click(function(){
	  $(".tip").fadeOut(100);
	});
	
	  
	  $(".scbtn").click(function (){
			//var url = "${baseUrl}/admin/wxbid/list.html?st=" + new Date().getTime();
	  		/* var wxGzhName = $("#name").val();
	  		if (wxGzhName != "") {
	  			//url += "&wxGzhName=" + encodeURI(wxGzhName);
	  			$("#wxGzhName").val(wxGzhName);
	  		}
	  		$("#searchForm").submit(); */
	  		//alert(url);
	  		//location.href = url;
		  search();
	  	});
	});
	function search(pageNo) {
		var fm = document.searchForm;
		if (typeof pageNo != 'undefined') {
			fm.pageNo.value = pageNo;
		}
		var wxGzhName = $("#name").val();
  		if (wxGzhName != "") {
  			$("#wxGzhName").val(wxGzhName);
  		}
  		$("#searchForm").submit();
	}
</script>
</head>


<body>
<!-- 位置信息 -->
<div class="place">
  <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">微信管理</a></li>
      <li><a href="#">模板管理</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
	  <li id="newBtn" class="click"><span><img src="${baseUrl }/assets/images/t01.png" /></span>添加</li>
	  <li id="modifyBtn" class="click"><span><img src="${baseUrl }/assets/images/t02.png" /></span>修改</li>
	  <li id="delBtn"><span><img src="${baseUrl }/assets/images/t03.png" /></span>删除</li>
	  <li id="searchBtn"><span><img src="${baseUrl }/assets/images/t06.png" /></span>查询</li>
	</ul>
	
	<c:if test="${isAdmin}">
	<form action="${baseUrl}/admin/wxbid/list.html" method="post" name="searchForm" id="searchForm">
		<input type="hidden" name="wxGzhName" id="wxGzhName" />
		<input type="hidden" name="pageNo" value="${page.currPage}" />
		<input type="hidden" name="pageSize" value="${page.pageSize}" />
	</form>
	<ul class="seachform" >
	    <li><label>名称</label><input id="name" value="${wxGzhName}" type="text" class="scinput" /></li>
	    <li><label>&nbsp;</label><input type="button" class="scbtn" value="查询"></li>
  	</ul>
  	</c:if>
  </div>
    
  <table class="imgtable">
	<thead>
      <tr>
    	<th width="30px;" style="text-align:center;"><input type="checkbox"/></th>
    	<c:if test="${isAdmin}">
    	<th width="200px" style="text-align:center;">所属商户</th>
    	</c:if>
    	<th width="120px;" style="text-align:center;">模板编码</th>
    	<th width="200px;" style="text-align:center;">模板名称</th>
    	<th style="text-align:center;">模板ID</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="t" varStatus="s">
	  <tr>
    	<td style="text-align:center;"><input type="checkbox" name="sbox" value="${t.id}" /></td>
    	<c:if test="${isAdmin}">
    	<td>${t.bid }</td>
    	</c:if>
    	
    	<td style="text-align:center;">${t.code}</td>
    	<td>
    		<c:if test="${t.code eq 'invite' }">新好友提醒</c:if>
    		<c:if test="${t.code eq 'scale' }">佣金提醒</c:if>
    		<c:if test="${t.code eq 'application' }">提现审核</c:if>
    	</td>
    	<td>${t.template }</td>
      </tr>
	  </c:forEach>
    </tbody>
  </table>
  
  <jsp:include page="${baseURL }/common/admin_page.jsp">
  	<jsp:param value="${page.total}" name="total"></jsp:param>
  	<jsp:param value="${page.currPage}" name="curPage"></jsp:param>
  	<jsp:param value="${page.pageSize}" name="pageSize"></jsp:param>
  </jsp:include>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${baseURL }/assets/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${baseURL }/assets/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>

</html>
