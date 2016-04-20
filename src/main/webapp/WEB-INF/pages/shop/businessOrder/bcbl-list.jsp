<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#newBtn").click(function(){
	  	window.location.href = "${baseUrl}/admin/business/new.html";
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
	
	});
	
	
</script>
</head>


<body>
<!-- 位置信息 -->
<div class="place">
  <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">商户管理</a></li>
      <li><a href="#">商户管理</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
  <ul class="seachform">
    
    <li><label>商户名称</label><input name="bidName" type="text" value="${bidName }" class="scinput"></li>
    
    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"></li>
    
    </ul>
  <table class="imgtable">
	<thead>
      <tr>
    	<th width="30px;" style="text-align:center;"><input type="checkbox"/></th>
    	<th style="wdith:auto;text-align:center;">商户名称</th>
    	<th style="wdith:auto;text-align:center;">标题</th>
    	<th width="150px;" style="text-align:center;">佣金比例</th>
    	<th width="150px;" style="text-align:center;">创建时间</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="usc" varStatus="vs">
	  <tr>
    	<td style="text-align:center;"><input type="checkbox" name="sbox" value="${usc.id }" /></td>
    	<td>${usc.bizName }</td>
    	<td style="text-align:center;">${usc.title }</td>
    	<td style="text-align:center;">${usc.scale }</td>
    	<td><fmt:formatDate value="${usc.createTime }" pattern="yyyy-MM-dd" /></td>
      </tr>
	  </c:forEach>
    </tbody>
  </table>
  
  <div class="pagin">
	<div class="message">共<i class="blue">${page.total}</i>条记录，当前显示第&nbsp;<i class="blue">${page.currPage}&nbsp;</i>页</div>
    <ul class="paginList">
       <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
       <li class="paginItem"><a href="javascript:;">1</a></li>
       <li class="paginItem current"><a href="javascript:;">2</a></li>
       <li class="paginItem"><a href="javascript:;">3</a></li>
       <li class="paginItem"><a href="javascript:;">4</a></li>
       <li class="paginItem"><a href="javascript:;">5</a></li>
       <li class="paginItem more"><a href="javascript:;">...</a></li>
       <li class="paginItem"><a href="javascript:;">10</a></li>
       <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
    </ul>
  </div>
    
    
    
    
    </div>
    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>

</html>
