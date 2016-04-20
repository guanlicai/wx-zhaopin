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
	
	function search(pageNo) {
		var fm = document.searchForm;
		if (typeof pageNo != 'undefined') {
			fm.pageNo.value = pageNo;
		}
		
  		fm.userName.value = $("#userName").val();
  		fm.bid.value = $("#bid").val();
  		fm.total.value = $("#total").val();
  		fm.mobile.value = $("#mobile").val();
  		
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
      <li><a href="#">系统管理</a></li>
      <li><a href="#">菜单管理</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
	<form action="${baseUrl}/admin/user/submember.html" method="post" name="searchForm" id="searchForm">
		<input type="hidden" name="userId" value="${userId }"/>
		<input type="hidden" name="bid" value="${bid }"/>
		<input type="hidden" name="findLevel" value="${findLevel }"/>
		
		<input type="hidden" name="pageNo" value="${page.currPage}" />
		<input type="hidden" name="pageSize" value="${page.pageSize}" />
	</form>
  
  <table class="imgtable">
	<thead>
      <tr>
    	<th style="text-align:center;">微信呢称</th>
    	<th style="text-align:center;">姓名</th>
    	<th width="100px;" style="text-align:center;">当前金额</th>
    	<th width="150px;" style="text-align:center;">手机号码</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="user" varStatus="s">
	  <tr style="text-align:center;">
    	<td>${user.nickName}</td>
    	<td>${user.realName}</td>
    	<td>${user.total}</td>
    	<td>${user.mobile}</td>
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
        <span><%-- <img src="${baseURL }/assets/images/ticon.png" /> --%></span>
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
