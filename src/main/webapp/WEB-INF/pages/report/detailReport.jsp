<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<style type="text/css">
.scaleTd{height:25px;line-height:25px;}
</style>

<script type="text/javascript">

	function search() {
		var fm = document.searchForm;
		
		fm.year.value = $("#year").val();
		fm.month.value = $("#month").val();
  		
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
      <li><a href="#">运营报表</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">

	<form action="${baseUrl}/admin/reprot/detailReport.html" method="post" name="searchForm" id="searchForm">
  	<input type="hidden" name="type" value="${type}" />
  	<input type="hidden" name="year" value="${year}" />
  	<input type="hidden" name="month" value="${month}" />
  </form>
  
  <ul class="seachform">
    <li><label>年份</label>
    	<select id="year" class="select">
			<c:forEach begin="2015" end="2025" var="d">
				<option value="${d }">${d }</option>
			</c:forEach>
		</select>
		<script type="text/javascript">
			$("#year").val("${year}");
		</script>
		
		&nbsp;&nbsp;
		<select id="month" class="select">
			<c:forEach begin="1" end="12" var="m">
				<option value="${m }">${m }月</option>
			</c:forEach>
		</select>
		<script type="text/javascript">
			$("#month").val("${month}");
		</script>
    </li>
    
    <li><label>&nbsp;</label><input onclick="search();" type="button" class="scbtn" value="查询"></li>
  </ul>
    
    </ul>
	<table id="sample-table-1"	class="imgtable">
	<thead>
		<tr>
			<th>日期</th>
			<th style="text-align:center;">数量</th>
		</tr>
	</thead>						
	<!-- 数据表格数据区域 -->
	<tbody id="tableBody">
		<c:forEach begin="1" end="${endDay }" var="ms" step="1">
			<c:set var="total" value="0" />
			<c:forEach items="${values }" var="r" varStatus="vs">
				<c:if test="${r['createTime'] eq ms }">
					<c:set var="total" value="${r['total'] }" />
				</c:if>
			</c:forEach>
			<tr>
		  		<td>${year }-${month }-${ms }</td>
				<td style="text-align:center;font-size:10pt;">
					${total }
				</td>
		  	</tr>
		</c:forEach>
	</tbody>
</table>
    
    </div>
    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>

</html>
