<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<custom:loadCom components="base-css"/>
<custom:loadCom components="base-js"/>
<title>无标题文档</title>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#newBtn").click(function(){
	  	window.location.href = "${baseUrl}/admin/auth/role/user/createIndex.html?roleId=${roleId}";
	  });
	  $("#modifyBtn").click(function(){
	  	
	  	if(JS.selectOne()){
	  		window.location.href = "${baseUrl}/admin/auth/menu/edit.html?id="+JS.getSelect();
	  	}
	  	else{
	  		alert("请选择一条数据");
	  	}
	  });
	  $("#delBtn").click(function(){
	  	if(JS.selectOne()){
	  		JS.deleteDate("${baseUrl}/admin/auth/role/user/delete.html?roleId=${roleId}");
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
			/*var url = "${baseUrl}/admin/user/list.html?st=" + new Date().getTime();
	  		var userName = $("[name=userName]").val();
	  		if (userName != "") {
	  			url += "&userName=" + encodeURI(userName);
	  		}
	  		var bid = $("[name=bid]").val();
	  		if (bid != "") {
	  			url += "&bid=" + bid;
	  		}
	  		var total = $("[name=total]").val();
	  		if (total != "") {
	  			url += "&total=" + total;
	  		}
	  		var mobile = $("[name=mobile]").val();
	  		if (mobile != "") {
	  			url += "&mobile=" + mobile;
	  		}
	  		location.href = url;*/
	  		/* var fm = document.searchForm;
	  		fm.userName.value = $("#userName").val();
	  		fm.bid.value = $("#bid").val();
	  		fm.total.value = $("#total").val();
	  		fm.mobile.value = $("#mobile").val();
	  		$("#searchForm").submit(); */
		  search();
	  	});
	  
	});
	function search(pageNo) {
		var fm = document.searchForm;
		if (typeof pageNo != 'undefined') {
			fm.pageNo.value = pageNo;
		}
		
		<c:if test="${!empty isAdmin && isAdmin }">
		fm.name.value = $("#name").val();
	    </c:if>
  		
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
	<form action="${baseUrl}/admin/user/list.html" method="post" name="searchForm" id="searchForm">
		<input type="hidden" name="name" />
		<input type="hidden" name="mobile" />
		<input type="hidden" name="pageNo" value="${page.currPage}" />
		<input type="hidden" name="pageSize" value="${page.pageSize}" />
	</form>

    <ul class="seachform">
  	  <c:if test="${!empty isAdmin && isAdmin }">
	    <li><label>所属商户</label><input id="name" value="${name}" type="text" class="scinput" /></li>
      </c:if>
      <li><label>手机号码</label><input id="mobile" value="${mobile}" type="text" class="scinput" /></li>
      <li><label>&nbsp;</label><input type="button" class="scbtn" value="查询"></li>
    </ul>
  
    <table class="imgtable">
	  <thead>
        <tr>
    	  <th width="30px;" style="text-align:center;"><input type="checkbox"/></th>
    	  <th style="text-align:center;">微信呢称</th>
    	  <th style="text-align:center;">姓名</th>
    	  <th width="150px;" style="text-align:center;">所属商户</th>
    	  <th width="100px;" style="text-align:center;">当前金额</th>
    	  <th width="100px;" style="text-align:center;">手机号码</th>
    	  <th width="200px;" style="text-align:center;">查看</th>
        </tr>
      </thead>
	  <tbody>
	    <c:forEach items="${page.resultList}" var="user" varStatus="s">
	      <tr style="text-align:center;">
    	    <td><input type="checkbox" name="sbox" value="${user.id}" /></td>
    	    <td>${user.nickName}</td>
    	    <td>${user.realName}</td>
    	    <td>${user.name}</td>
    	    <td>${user.total}</td>
    	    <td>${user.mobile}</td>
    	    <td>
    		  <a href="${baseUrl}/admin/user/orderList.html?userId=${user.id}">查看消费</a>
    		  <a href="${baseUrl}/admin/user/recordList.html?userId=${user.id}">提现记录</a>
    		  <a href="${baseUrl}/admin/user/member.html?userId=${user.id}&bid=${user.bid}">下级会员</a>
    	    </td>
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
