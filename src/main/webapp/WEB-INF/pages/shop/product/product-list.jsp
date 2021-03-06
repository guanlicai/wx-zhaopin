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
  <div class="tools">
    <ul class="toolbar">
	  <li id="newBtn" class="click"><span><img src="${baseUrl }/assets/images/t01.png" /></span>添加</li>
	  <li id="modifyBtn" class="click"><span><img src="${baseUrl }/assets/images/t02.png" /></span>修改</li>
	  <li id="delBtn"><span><img src="${baseUrl }/assets/images/t03.png" /></span>删除</li>
	  <li id="searchBtn"><span><img src="${baseUrl }/assets/images/t06.png" /></span>查询</li>
	</ul>
  </div>
    
  <table class="imgtable">
	<thead>
      <tr>
    	<th width="30px;" style="text-align:center;"><input type="checkbox"/></th>
    	<th style="wdith:auto;text-align:center;">商户名称</th>
    	<th width="150px;" style="text-align:center;">商户地址</th>
    	<th width="300px;" style="text-align:center;">联系人</th>
    	<th width="100px;" style="text-align:center;">联系电话</th>
    	<th width="100px;" style="text-align:center;">商户类别</th>
    	<th width="100px;" style="text-align:center;">加入时间</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="business" varStatus="vs">
	  <tr>
    	<td style="text-align:center;"><input type="checkbox" name="sbox" value="${business.id }" /></td>
    	<td>${business.name }</td>
    	<td style="text-align:center;">${business.address }</td>
    	<td>${business.relMan }</td>
    	<td>${business.relPhone }</td>
    	<td>${business.category }</td>
    	<td style="text-align:center;"><fmt:formatDate value="${business.createTime }" pattern="yyyy-MM-dd" /></td>
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
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${baseUrl }/assets/images/ticon.png" /></span>
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
        <span><img src="${baseUrl }/assets/images/ticon.png" /></span>
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
