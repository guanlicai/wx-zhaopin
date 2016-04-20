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
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/select-ui.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#passBtn").click(function(){
		  	if(JS.getSelect()){
		  		
		  		var url = baseUrl + "/admin/userPickRecord/updateState.html";
				var data = new Object();
				data["state"] = 1;
				data["ids"] = JS.getSelect();
				
				$.ajax({url: url, data: data, dataType: "json", success: function (json){
					if (json) {
						if (json.status == "success") {
							alert("审核成功");
							window.location.href = baseUrl + json.url;
						} else {
							alert("保存出错，请联系管理员");
						}
					}
				}});
		  		
		  	} else{
		  		alert("请选择审核通过数据数据");
		  	}
		});
	  	
		$("#unpassBtn").click(function(){
		  	if(JS.getSelect()){
		  		var remark = $("#remark").val();
		  		remark = remark.replace(/\s+/g, "");
		  		if (remark == "") {
		  			alert("请填写审核不通过理由");
		  			return;
		  		}
		  		remark = encodeURI(remark);
		  		var url = baseUrl + "/admin/userPickRecord/updateState.html";
				var data = new Object();
				data["state"] = -1;
				data["ids"] = JS.getSelect();
				data["remark"] = remark;
				$.ajax({url: url, data: data, dataType: "json", success: function (json){
					if (json) {
						if (json.status == "success") {
							alert("保存成功");
							window.location.href = baseUrl + json.url;
						} else {
							alert("保存出错，请联系管理员");
						}
					}
				}});
		  		//JS.deleteDate("${baseUrl}/admin/userPickRecord/updateState.html?state=-1&ids=" + JS.getSelect() + "&remark=" + remark);
		  	} else{
		  		alert("请选择审核不通过数据数据");
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
		
	  	$("#allCheckbox").click(function () {
	  		var allSelected = this.checked;
	  		$.each($("[name=sbox]"), function (i, d){
	  			d.checked = allSelected;
	  		});
	  	});
	  	
	  	$(".scbtn").click(function (){
	  		var state = $("[name=state]").val();
	  		var mobile = $("[name=mobile]").val();
	  		location.href = "${baseUrl}/admin/userPickRecord/list.html?state=" + state + "&mobile=" + mobile;
	  	});
	});
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
      <li><a href="#">系统管理</a></li>
      <li><a href="#">菜单管理</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
	  <%-- <li id="newBtn" class="click"><span><img src="${baseUrl }/assets/images/t01.png" /></span>添加</li> --%>
	  <li id="passBtn" class="click"><span><img src="${baseUrl}/assets/images/t02.png" /></span>审核通过</li>
	  <li id="unpassBtn" class="click"><span><img src="${baseUrl }/assets/images/t03.png" /></span>审核不通过</li>
	  <label>审核不通过理由</label>
      <input name="remark" id="remark" value="" type="text" class="dfinput" />
	  <%-- <li id="delBtn"><span><img src="${baseUrl }/assets/images/t03.png" /></span>删除</li>
	  <li id="searchBtn"><span><img src="${baseUrl }/assets/images/t06.png" /></span>查询</li> --%>
	</ul>
  </div>
  
  <ul class="seachform">
    <li><label>审核状态</label>  
    <div class="vocation">
    <select name="state" class="select3">
	    <option value="99" <c:if test="${param.state == 99}">selected="selected"</c:if> >全部</option>
		<option value="-1" <c:if test="${param.state == -1}">selected="selected"</c:if> >审核不通过</option>
	   	<option value="0" <c:if test="${param.state == 0}">selected="selected"</c:if> >未审核</option>
	   	<option value="1" <c:if test="${param.state == 1}">selected="selected"</c:if> >审核通过</option>
    </select>
    </div>
    </li>
    <li><label>申请人电话</label><input value="${mobile}" name="mobile" class="scinput"></li>
    <li><label>&nbsp;</label><input type="button" class="scbtn" value="查询"></li>
  </ul>

  <table class="imgtable">
	<thead>
      <tr>
    	<th width="30px;" style="text-align:center;"><input id="allCheckbox" type="checkbox"/></th>
    	<th width="80px;" style="text-align:center;">提现数量</th>
    	<th width="80px;" style="align:center;">审核状态</th>
    	<th width="150px;" style="text-align:center;">创建时间</th>
    	<th width="80px;" style="text-align:center;">申请人</th>
    	<th width="80px;" style="text-align:center;">呢称</th>
    	<th width="120px;" style="text-align:center;">银行卡</th>
    	<th width="150px;" style="text-align:center;">卡号</th>
    	<th width="100px;" style="text-align:center;">联系电话</th>
    	<th style="text-align:center;">备注</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${page.resultList}" var="record" varStatus="s">
	  <tr>
    	<td style="text-align:center;"><input type="checkbox" name="sbox" value="${record.id}" /></td>
    	<td style="text-align:center;">${record.total}</td>
    	<td>
    		<c:if test="${record.state == -1}">审核不通过</c:if>
    		<c:if test="${empty record.state || record.state ==  0}">未审核</c:if>
    		<c:if test="${record.state ==  1}">审核通过</c:if>
    	</td>
    	<td><fmt:formatDate value="${record.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	<td style="text-align:center;">${record.realName}</td>
    	<td style="text-align:center;">${record.nickName}</td>
    	<td style="text-align:center;">${record.bank}</td>
    	<td style="text-align:center;">${record.cradNumber}</td>
    	<td style="text-align:center;">${record.mobile}</td>
    	<td>${record.remark }</td>
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

</body>

</html>
