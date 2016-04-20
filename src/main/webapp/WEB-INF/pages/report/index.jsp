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
  		
  		$("#searchForm").submit();
	}
	
	function toGraphical(type) {
		type = type || 0;
		var year = $("#year").val();
		location.href = "${baseUrl}/admin/reprot/graphicalReport.html?year=" + year + "&type=" + type;
	}
	
	function toDetailReport(type,month) {
		type = type || 0;
		var year = $("#year").val();
		location.href = "${baseUrl}/admin/reprot/detailReport.html?year=" + year + "&month="+ month +"&type=" + type;
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

	<form action="${baseUrl}/admin/reprot/list.html" method="post" name="searchForm" id="searchForm">
  	<input type="hidden" name="year" value="${year}" />
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
    </li>
    
    <li><label>&nbsp;</label><input onclick="search();" type="button" class="scbtn" value="查询"></li>
  </ul>
    
    </ul>
	<table id="sample-table-1"	class="imgtable">
	<thead>
		<tr>
			<th>&nbsp;</th>
			<c:forEach begin="1" end="12" var="m" step="1">
			<th style="text-align:center;">${m }月</th>
			</c:forEach>
			<th>&nbsp;</th>
		</tr>
	</thead>						
	<!-- 数据表格数据区域 -->
	<tbody id="tableBody">
		<tr>
	  		<td>回流数</td>
	  		<c:forEach begin="1" end="12" var="ms" step="1">
	  		<c:set var="total" value="0" />
			<c:forEach items="${userShareTemplateList}" var="ust" varStatus="vs">
				<c:if test="${ust['createTime'] eq ms }">
				<c:set var="total" value="${ust['total'] }" />
				</c:if>
			</c:forEach>
			<td style="text-align:center;font-size:10pt;">
				<c:if test="${total eq 0 }">
				${total }
				</c:if>
				<c:if test="${total gt 0 }">
				<a href="javascript:void(1);" onclick="toDetailReport(1,${ms});">${total }</a>
				</c:if>
			</td>
			
			</c:forEach>
			<td><a href="javascript:void(1);" onclick="toGraphical(1);">查看图形报表</a></td>
	  	</tr>
		<tr>
	  		<td>分享数</td>
	  		<c:forEach begin="1" end="12" var="ms" step="1">
	  		<c:set var="total" value="0" />
			<c:forEach items="${userShareRecordList}" var="usr" varStatus="vs">
				<c:if test="${usr['createTime'] eq ms }">
				<c:set var="total" value="${usr['total'] }" />
				</c:if>
			</c:forEach>
			<td style="text-align:center;font-size:10pt;">
				<c:if test="${total eq 0 }">
				${total }
				</c:if>
				<c:if test="${total gt 0 }">
				<a href="javascript:void(1);" onclick="toDetailReport(2,${ms});">${total }</a>
				</c:if>
				
			</td>
			
			</c:forEach>
			<td><a href="javascript:void(1);" onclick="toGraphical(2);">查看图形报表</a></td>
	  	</tr>
	  	<tr>
	  		<td>发展人数</td>
	  		<c:forEach begin="1" end="12" var="ms" step="1">
	  		<c:set var="total" value="0" />
			<c:forEach items="${userShareList}" var="us" varStatus="vs">
				<c:if test="${us['createTime'] eq ms }">
				<c:set var="total" value="${us['total'] }" />
				</c:if>
			</c:forEach>
			<td style="text-align:center;font-size:10pt;">
				<c:if test="${total eq 0 }">
				${total }
				</c:if>
				<c:if test="${total gt 0 }">
				<a href="javascript:void(1);" onclick="toDetailReport(3,${ms});">${total }</a>
				</c:if>
				
			</td>
			
			</c:forEach>
			<td><a href="javascript:void(1);" onclick="toGraphical(3);">查看图形报表</a></td>
	  	</tr>
	  	<tr>
	  		<td>消费数</td>
	  		<c:forEach begin="1" end="12" var="ms" step="1">
	  		<c:set var="total" value="0" />
			<c:forEach items="${consumeList}" var="consume" varStatus="vs">
				<c:if test="${consume['createTime'] eq ms }">
				<c:set var="total" value="${consume['total']}" />
				</c:if>
			</c:forEach>
			<td style="text-align:center;font-size:10pt;">
				<c:if test="${total eq 0 }">
				${total }
				</c:if>
				<c:if test="${total gt 0 }">
				<a href="javascript:void(1);" onclick="toDetailReport(4,${ms});">${total }</a>
				</c:if>
			</td>
			
			</c:forEach>
			<td><a href="javascript:void(1);" onclick="toGraphical(4);">查看图形报表</a></td>
	  	</tr>
	  	<tr>
	  		<td>佣金提现</td>
	  		<c:forEach begin="1" end="12" var="ms" step="1">
	  		<c:set var="total" value="0" />
			<c:forEach items="${userPickList}" var="upl" varStatus="vs">
				<c:if test="${upl['createTime'] eq ms }">
				<c:set var="total" value="${upl['total'] }" />
				</c:if>
			</c:forEach>
			<td style="text-align:center;font-size:10pt;">
				<c:if test="${total eq 0 }">
				${total }
				</c:if>
				<c:if test="${total gt 0 }">
				<a href="javascript:void(1);" onclick="toDetailReport(5,${ms});">${total }</a>
				</c:if>
			</td>
			
			</c:forEach>
			<td><a href="javascript:void(1);" onclick="toGraphical(5);">查看图形报表</a></td>
	  	</tr>
	  	<tr>
	  		<td>佣金发放</td>
	  		<c:forEach begin="1" end="12" var="ms" step="1">
	  		<c:set var="total" value="0" />
			<c:forEach items="${userPickSendList}" var="upsl" varStatus="vs">
				<c:if test="${upsl['createTime'] eq ms }">
				<c:set var="total" value="${upsl['total'] }" />
				</c:if>
			</c:forEach>
			<td style="text-align:center;font-size:10pt;">
				<c:if test="${total eq 0 }">
				${total }
				</c:if>
				<c:if test="${total gt 0 }">
				<a href="javascript:void(1);" onclick="toDetailReport(6,${ms});">${total }</a>
				</c:if>
			</td>
			
			</c:forEach>
			<td><a href="javascript:void(1);" onclick="toGraphical(6);">查看图形报表</a></td>
	  	</tr>
	  	<tr>
	  		<td>消费统计</td>
	  		<c:forEach begin="1" end="12" var="ms" step="1">
	  		<c:set var="total" value="0" />
			<c:forEach items="${consumeList}" var="consume" varStatus="vs">
				<c:if test="${consume['createTime'] eq ms }">
				<c:set var="total" value="${consume['total'] }" />
				</c:if>
			</c:forEach>
			<td style="text-align:center;font-size:10pt;">
				<c:if test="${total eq 0 }">
				${total }
				</c:if>
				<c:if test="${total gt 0 }">
				<a href="javascript:void(1);" onclick="toDetailReport(1,${ms});">${total }</a>
				</c:if>
			</td>
			
			</c:forEach>
			<td><a href="javascript:void(1);" onclick="toGraphical(4);">查看图形报表</a></td>
	  	</tr>
	</tbody>
</table>

  <div class="tip">
	<div class="tiptop"><span>消费分成详情</span><a></a></div>
	<div class="tipinfo" id="showInfo">
	</div>
        
	<div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
	</div>
  </div>
    
    </div>
    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>

</html>