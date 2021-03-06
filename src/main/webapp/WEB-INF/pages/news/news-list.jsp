<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资讯管理</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>

<script type="text/javascript">

$(function (){
	$("#newBtn").click(function (){
		window.location.href = "${baseUrl}/admin/news/edit.html";
	});
	
	$("#modifyBtn").click(function (){
		if (JS.selectOne()) {
			window.location.href = "${baseUrl}/admin/news/edit.html?id=" + JS.getSelect();
		} else {
			alert("请选择一条记录");
		}
	});
	
	$("#delBtn").click(function (){
		if(JS.getSelect()){
	  		JS.deleteDate("${baseUrl}/admin/bussiness/news/del.html?ids=" + JS.getSelect());
	  	}
	  	else{
	  		alert("请选择待删除数据");
	  	}
	});
});

function search(pageNo) {
	var fm = document.searchForm;
	if (typeof pageNo != 'undefined') {
		fm.currPage.value = pageNo;
	}
	
	fm.title.value = $("#title").val();
	fm.name.value = $("#name").val();
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
      <li><a href="#">资讯列表</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
	  <li id="newBtn" class="click"><span><img src="${baseUrl }/assets/images/t01.png" /></span>添加</li>
	  <li id="modifyBtn" class="click"><span><img src="${baseUrl }/assets/images/t02.png" /></span>修改</li>
	  <li id="delBtn"><span><img src="${baseUrl }/assets/images/t03.png" /></span>删除</li>
	  <%-- <li id="delBtn"><span><img src="${baseUrl }/assets/images/t03.png" /></span>删除</li> --%>
	</ul>
  </div>
  
  <form action="${baseUrl}/admin/business/news/list.html" method="post" name="searchForm" id="searchForm">
  	<input type="hidden" name="title" value="${title}" />
	<input type="hidden" name="name" value="${name}" />
  	
  	<input type="hidden" name="currPage" value="${page.currPage}" />
	<input type="hidden" name="pageSize" value="${page.pageSize}" />
  </form>
  
  <ul class="seachform">
    <li><label>标题</label><input id="title" type="text" value="${title}" class="scinput"></li>
    
    <li><label>&nbsp;</label><input onclick="search();" type="button" class="scbtn" value="查询"></li>
  </ul>

  <table class="imgtable">
	<thead>
      <tr>
      	<th width="30px;" style="text-align:center;"><input type="checkbox"/></th>
      	<th style="text-align:center;" width="100px;">显示图片</th>
    	<th style="text-align:center;">标题</th>
    	<th style="text-align:center;" width="150px;">创建时间</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="entity" varStatus="s">
	  <tr style="text-align:center;">
	  	<td><input type="checkbox" name="sbox" value="${entity.id}" /></td>
	  	<td><img src="${baseServerUrl}${entity.showPic}" style="width:100px;height:50px;"/></td>
	  	<td>${entity.title}</td>
	  	<td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd" /></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
  <jsp:include page="${baseURL }/common/admin_page.jsp">
  	<jsp:param value="${page.total}" name="total"></jsp:param>
  	<jsp:param value="${page.currPage}" name="curPage"></jsp:param>
  	<jsp:param value="${page.pageSize}" name="pageSize"></jsp:param>
  </jsp:include>
  
</div>

<script type="text/javascript">
$('.imgtable tbody tr:odd').addClass('odd');
</script>
</body>

</html>
