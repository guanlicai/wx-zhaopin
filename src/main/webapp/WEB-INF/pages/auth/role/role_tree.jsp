<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="baseURL" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${baseURL }/assets/component/tree/css/tree.css"/>
<script type="text/javascript" src="${baseURL }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseURL }/assets/js/common.js"></script>
<script type="text/javascript" src="${baseURL }/assets/component/tree/js/tree.js"></script>

<script type="text/javascript">

	var baseURL = "${baseURL}";

	var menuMap = null, tv = null;
	// 点击节点
	treeview.prototype.onnodeclick = function(sender){
		if ('${type}' == "user") {
			parent.treeRightFrame.location.href= "${baseURL}/admin/auth/role/user/list.html?roleId="+sender.id;
		} else {
			parent.treeRightFrame.location.href= "${baseURL}/admin/auth/role/list.html?roleId="+sender.id;
		}
		return false;
	}
	// 双击节点
	treeview.prototype.onnodedblclick = function(sender){
		return false;
	}
	// 选中的变化
	treeview.prototype.onselectchange = function(before,after){
		return false;
	}
	
	$(document).ready(function(){
		${content}
		//$('#menuTree').css('height',parseInt(getBody().clientHeight)-32);
		$('#menuTree').css('overflow','auto');
	});
	
	$(window).resize(function(){
  		//$('#menuTree').css('height',parseInt(getBody().clientHeight)-32);
		$('#menuTree').css('overflow','auto');
 	});
</script>
<title>选择菜单</title>
<body>
<div id="menuTree" style="width:250px;background:#fff;text-align:left;"></div>
</body>