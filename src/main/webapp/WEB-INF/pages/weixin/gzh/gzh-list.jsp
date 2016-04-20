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
	  	window.location.href = "${baseUrl}/admin/gzh/edit.html";
	  });
	  
	  $("#modifyBtn").click(function(){
		  	if(JS.selectOne()){
		  		window.location.href = "${baseUrl}/admin/gzh/edit.html?id="+JS.getSelect();
		  	}
		  	else{
		  		alert("请选择一条数据");
		  	}
	  });
	  
	  $("#delBtn").click(function(){
	  	if(JS.getSelect()){
	  		JS.deleteDate("${baseUrl}/admin/gzh/del.html?ids=" + JS.getSelect());
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
		  var name = $("#name").val();
	  	  location.href = "${baseUrl}/admin/gzh/list.html?name=" + name;
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
	</ul>
	
	<c:if test="${!empty isAdmin && isAdmin }">
	<ul class="seachform">
    <li><label>商户名称</label><input id="name" type="text" value="${name}" class="scinput"></li>
    <li><label>&nbsp;</label><input type="button" class="scbtn" value="查询"></li>
    </ul>
    </c:if>
  </div>
    
  <table class="imgtable">
	<thead>
      <tr>
    	<th width="30px;" style="text-align:center;"><input type="checkbox"/></th>
    	<th width="80px;" style="text-align:center;">商户ID</th>
    	<th style="width:auto;text-align:center;">商户名称</th>
    	<th width="200px;" style="text-align:center;">商户地址</th>
    	<th width="55px;" style="text-align:center;">联系人</th>
    	<th width="100px;" style="text-align:center;">联系电话</th>
    	<th width="100px;" style="text-align:center;">返现方式</th>
    	<th width="100px;" style="text-align:center;">返现比率</th>
    	<th width="100px;" style="text-align:center;">企业类型</th>
    	<th width="100px;" style="text-align:center;">加入时间</th>
    	<th width="100px;" style="text-align:center;">操作</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="gzh" varStatus="vs">
	  <tr>
    	<td style="text-align:center;"><input type="checkbox" name="sbox" value="${gzh.id }" /></td>
    	<td>${gzh.id }</td>
    	<td>${gzh.name }</td>
    	<td style="text-align:center;">${gzh.address }</td>
    	<td>${gzh.relMan }</td>
    	<td>${gzh.relPhone }</td>
    	<td>${gzh.scaleType }</td>
    	<td>${gzh.total }</td>
    	<td>${gzh.type }</td>
    	<td style="text-align:center;"><fmt:formatDate value="${gzh.createTime }" pattern="yyyy-MM-dd" /></td>
    	<td style="text-align:center;"><a href="${baseUrl }/admin/weixin/menu/setMenu.html?id=${gzh.id }" >设置菜单</a></td>
      </tr>
	  </c:forEach>
    </tbody>
  </table>
  
  <jsp:include page="/common/admin_page.jsp">
  	<jsp:param value="${page.total}" name="total"></jsp:param>
  	<jsp:param value="${page.currPage}" name="curPage"></jsp:param>
  	<jsp:param value="${page.pageSize}" name="pageSize"></jsp:param>
  </jsp:include>
    
    
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
