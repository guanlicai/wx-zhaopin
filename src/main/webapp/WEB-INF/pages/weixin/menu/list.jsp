<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript">
function toValue(name, pid, type, state, orderNo, id) {
	$("#name").val(name);
	$("#pid").val(pid);
	$("#type").val(type);
	$("#state").val(state);
	$("#orderNo").val(orderNo);
	$("#resourceid").val(id);
}

function save() {
	JS.saveDate("form1",baseUrl + "/admin/weixin/menu/update.html");
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
    
  <table class="imgtable">
  	<tr>
  		<td width="70%;">
	  		<table id="wxmenuTable" style="margin: 0;padding: 0;width: 100%">
	  		<thead style="text-align: center;">菜单示意图</thead>
	  		<tbody>
	  		<tr>
			<c:forEach items="${wxmenusTop}" var="top">
		    	<td style="text-align:center;">
		    		<a href="javascript:void(0);" onclick="toValue('${top.name}','${top.pid}','${top.type}','${top.state}', '${top.orderNo}','${top.resourceid}');">
		    		一级(${top.orderNo}):${top.name}(id:${top.resourceid})
		    		</a>
		    	</td>
			</c:forEach>
			</tr>
			
			<c:forEach items="${wxmenus}" var="wxmenu" varStatus="st">
			<c:if test="${st.first || st.index%3 == 0}"><tr></c:if>
				<td style="text-align:center;">
					<c:if test="${!empty wxmenu}">
					<a href="javascript:void(0);" onclick="toValue('${wxmenu.name}','${wxmenu.pid}','${wxmenu.type}','${wxmenu.state}', '${wxmenu.orderNo}','${wxmenu.resourceid}');">
					二级(${wxmenu.orderNo}):${wxmenu.name}(id:${wxmenu.resourceid}|PID:${wxmenu.pid})
					</a>
					</c:if>
				</td>
			<c:if test="${((st.index + 1)%3) == 0 || st.last}"></tr></c:if>
			</c:forEach>
			
		    </tbody>
	  		</table>
  		</td>
  		
  		<td>
  		<form id="form1" name="form1" action="" method="post">
  		<table>
  		<thead>菜单编辑</thead>
	  		<tr>
	  			<td>菜单名称:</td>
	  			<td>
	  				<input id="resourceid" name="resourceid" type="hidden" />
	  				<input id="name" name="name" /></td>
	  		</tr>
	  		
	  		<tr>
	  			<td>父菜单ID:</td>
	  			<td><input id="pid" name="pid" /></td>
	  		</tr>	
	  		
	  		<tr>
	  			<td>菜单类型</td>
	  			<td><input id="type" name="type" /></td>
	  		</tr>
	  		
	  		<tr>
	  			<td>菜单状态</td>
	  			<td><input id="state" name="state" /></td>
	  		</tr>
	  		
	  		<tr>
	  			<td>菜单顺序</td>
	  			<td><input id="orderNo" name="orderNo" /></td>
	  		</tr>
	  			
	  		<tr>
	  			<td colspan="2">
	  			<input type="button" value="保存配置" onclick="save();" />
	  			</td>
	  		</tr>
  		</table>
  		</form>
  		</td>
  	</tr>
  </table>
    
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
