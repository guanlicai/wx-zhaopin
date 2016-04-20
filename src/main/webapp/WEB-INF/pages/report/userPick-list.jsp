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
function search(pageNo) {
	var fm = document.searchForm;
	if (typeof pageNo != 'undefined') {
		fm.currPage.value = pageNo;
	}
	
	fm.geCreateTime.value = $("#geCreateTime").val();
	fm.leCreateTime.value = $("#leCreateTime").val();
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
      <li><a href="#">${type == 1 ? '佣金发放': '佣金提现'}数</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
	<form id="searchForm" name="searchForm" action="${baseUrl}/admin/reprot/userPick/list.html" method="post" >
		<input type="hidden" name="type" value="${type}" />
		<input type="hidden" name="geCreateTime" value="${geCreateTime}" />
		<input type="hidden" name="leCreateTime" value="${leCreateTime}" />
	</form>

  <ul class="seachform">
    <li><label>发展时间</label>
      <input id="geCreateTime" type="text" value="${geCreateTime }" class="scinput"> 至 
      <input id="leCreateTime" type="text" value="${leCreateTime }" class="scinput">
    </li>
    <li><label>&nbsp;</label><input onclick="search();" type="button" class="scbtn" value="查询"></li>
    
    </ul>
  <table class="imgtable">
	<tbody>
	  <tr>
    	<td align="right" width="100px;">${type == 1 ? '佣金发放': '佣金提现'}数：</td>
    	<td>${total}</td>
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
