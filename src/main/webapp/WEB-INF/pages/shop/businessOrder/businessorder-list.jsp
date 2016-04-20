<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/select.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/select-ui.min.js"></script>
<style type="text/css">
.scaleTd{height:25px;line-height:25px;}
</style>
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
	
	function showScale(boId){
		
		$.ajax({
			type:'POST',
			url:baseUrl + "/admin/business/scale/userScale.html",
			data:{boId: boId},
			dataType:"json",
			cache: false,
			async:false,
			success: function(data){
				
				var html = '<table border="1" width="100%">';
				html += '<tr><th width="10%">分成</th><th width="40%">用户</th><th>备注</th></tr>';
				
				for(var i = 0; i< data.length; i++){
					html += '<tr>';
					html += '<td class="scaleTd" style="text-align:center;">'+ data[i].total + '</td>';
					html += '<td class="scaleTd" style="text-align:center;">'+ data[i].nickName + '</td>';
					html += '<td>'+ data[i].remark + '</td>';
	      			html += '</tr>';
				}
				html += '</table>';
				
				$("#showInfo").html(html);
			},
			error:function (msg) {
				alert("提交出错，请联系系统管理员");
	        }
		});
		$(".tip").fadeIn(200);
	}
	
	function search(pageNo) {
		var fm = document.searchForm;
		if (typeof pageNo != 'undefined') {
			fm.currPage.value = pageNo;
		}
		
		<c:if test="${!empty isAdmin && isAdmin }">
		fm.bidName.value = $("#bidName").val();
	    </c:if>
		
		fm.isScan.value = $("#isScan").val();
		fm.gtMoney.value = $("#gtMoney").val();
		fm.ltMoney.value = $("#ltMoney").val();
		fm.gtCreateTime.value = $("#gtCreateTime").val();
		fm.ltCreateTime.value = $("#ltCreateTime").val();
  		
  		$("#searchForm").submit();
	}
	
</script>

<script type="text/javascript">
$(document).ready(function(e) {
	$(".select3").uedSelect({
		width : 100
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
	<form id="searchForm" name="searchForm" action="${baseUrl}/admin/business/order/list.html" method="post" >
		<input type="hidden" name="bidName" value="${bidName}" />
		<input type="hidden" name="isScan" value="${isScan}" />
		<input type="hidden" name="gtMoney" value="${gtMoney}" />
		<input type="hidden" name="ltMoney" value="${ltCreateTime}" />
		<input type="hidden" name="gtCreateTime" value="${gtCreateTime}" />
		<input type="hidden" name="ltCreateTime" value="${ltCreateTime}" />
		
		<input type="hidden" name="currPage" value="${page.currPage}" />
		<input type="hidden" name="pageSize" value="${page.pageSize}" />
	</form>

  <ul class="seachform">
  	
  	<c:if test="${!empty isAdmin && isAdmin }">
	<li><label>商户名称</label><input id="bidName" type="text" value="${bidName}" class="scinput"></li>
    </c:if>
  	
    
    
    <li><label>是否扫描</label>
      <div class="vocation">
	    <select id="isScan" id="isScan" class="select3">
	      <option value="">全部</option>
	      <option value="1">是</option>
	      <option value="0">否</option>
	    </select>
	  </div>
      <script type="text/javascript">
        $("#isScan").val("${isScan}");
      </script>
    </li>
    <li><label>消费金额</label>
      <input id="gtMoney" type="text" value="${gtMoney }" class="scinput" style="width:50px;"> 至 
      <input id="ltMoney" type="text" value="${ltMoney }" class="scinput" style="width:50px;">
    </li>
    <li><label>消费时间</label>
      <input id="gtCreateTime" type="text" value="${gtCreateTime }" class="scinput"> 至 
      <input id="ltCreateTime" type="text" value="${ltCreateTime }" class="scinput">
    </li>
    
    <li><label>&nbsp;</label><input onclick="search();" type="button" class="scbtn" value="查询"></li>
    
    </ul>
  <table class="imgtable">
	<thead>
      <tr>
    	<th width="30px;" style="text-align:center;"><input type="checkbox"/></th>
    	<th style="wdith:auto;text-align:center;">商户名称</th>
    	<th width="150px;" style="text-align:center;">是否扫描</th>
    	<th width="150px;" style="text-align:center;">消费用户</th>
    	<th width="300px;" style="text-align:center;">单号</th>
    	<th width="100px;" style="text-align:center;">消费金额</th>
    	<th width="150px;" style="text-align:center;">消费时间</th>
    	<th width="100px;" style="text-align:center;">查看分成</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="bo" varStatus="vs">
	  <tr>
    	<td style="text-align:center;"><input type="checkbox" name="sbox" value="${bo.id }" /></td>
    	<td>${bo.bizName }</td>
    	<td style="text-align:center;">
    		<c:if test="${bo.userId == null }">
    		未扫描
    		</c:if>
    		<c:if test="${bo.userId != null }">
    		已扫描
    		</c:if>
    	</td>
    	<td style="text-align:center;">
    		${jsfn:base64Encoding(bo.nickName)}
    	</td>
    	<td>${bo.orderNum }</td>
    	<td tyle="text-align:center;">${bo.total }</td>
    	<td style="text-align:center;"><fmt:formatDate value="${bo.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
    	<td style="text-align:center;">
    		<c:if test="${bo.userId != null }">
    		 <a href="#" onclick="showScale(${bo.id})">查看佣金分成</a>
    		</c:if>
    	</td>
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
