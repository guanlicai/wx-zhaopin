<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理列表</title>
<custom:loadCom components="base-css"/>
<custom:loadCom components="base-js"/>

<script type="text/javascript">

$(function (){
	$("#newBtn").click(function (){
		window.location.href = "${baseUrl}/file/teacher/edit.html";
	});
	
	$("#modifyBtn").click(function (){
		if (JS.selectOne()) {
			window.location.href = "${baseUrl}/file/teacher/edit.html?id=" + JS.getSelect();
		} else {
			alert("请选择一条记录");
		}
	});
	
	$("#delBtn").click(function (){
		if (JS.getSelect()) {
			
			JS.deleteDate("${baseUrl}/file/teacher/delete.html");
		} else {
			alert("请至少选择一条记录");
		}
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
      <li><a href="#">系统管理</a></li>
      <li><a href="#">用户管理</a></li>
    </ul>
</div>


<div class="rightinfo">
  <!-- 按钮信息开始 -->
  <div class="tools">
  	<ul class="toolbar">
	  <li id="newBtn" class="click"><span><img src="${baseUrl}/assets/images/t01.png" /></span>添加</li>
	  <li id="modifyBtn" class="click"><span><img src="${baseUrl}/assets/images/t02.png" /></span>修改</li>
	  <li id="delBtn"><span><img src="${baseUrl}/assets/images/t03.png" /></span>删除</li>
    </ul>
  </div>
  <!-- 按钮信息结束 -->
  
  <!-- 查询form开始 -->
  <form action="${baseUrl}/file/teacher/list.html" method="post" name="searchForm" id="searchForm">
    <ul class="seachform">
      <!--
      <li><label>用户名</label><input id="username" name="username" type="text" value="${condition.username}" class="scinput"></li>
      -->
      <li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询"></li>
    </ul>
  </form>
  <!-- 查询form结束 -->

  <!-- 数据table开始 -->
  <table class="imgtable">
	<thead>
      <tr>
      	<th width="30px;" style="text-align:center;"><input type="checkbox" onclick="JS.selectAll(this)"/></th>
    	<th>姓名</th>
    	<th>性别</th>
    	<th>毕业时间</th>
    	<th>毕业院校</th>
    	<th>婚姻状态</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="entity" varStatus="vs">
	  <tr style="text-align:center;">
		  <td style="text-align:center;"><input type="checkbox" name="sbox" value="${entity.id}" /></td>
		  <td>${entity.name}</td>
		  <td>${entity.sex}</td>
		  <td>${entity.graduateTime}</td>
		  <td>${entity.graduateSchool}</td>
		  <td>${entity.marriage}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <!-- 数据table结束 -->
  
  <!-- 分页数据 -->
  <custom:pagelist page="${page}" condition="${condition}" url="${baseUrl}/file/teacher/list.html" />
  
</div>

<script type="text/javascript">
  $('.imgtable tbody tr:odd').addClass('odd');
</script>
</body>

</html>