<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript">
	function submitForm() {
		/*var scaleType = $("[name=scaleType]:checked").val();
		var total = $("[name=total]").val();
		if (scaleType == 1 && !/^\d+\.{0,1}0*$/.test(total)) {
			alert("返现金额请填写正整数");
			return;
		} else if (scaleType == 2 && (!/^0\.\d{0,2}$/.test(total) || parseFloat(total) >= 1) ) {
			alert("返现金额请填写小于1的两位小数");
			return;
		}
		JS.saveDate("form1",baseUrl + "/admin/wxbid/updateType.html");*/
		
		//var mobileReg = /^((\+?86)|(\(\+86\)))?(13[0-9]{9}|15[0-9]{9}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
		//var emailReg = /^([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$/;
		//var emailReg = /^\w+@\w+(\.com(\.cn)?|\.net)$/;
		
		var phoneReg = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
		var mobileReg = /^1[3-9]\d{9}$/;
		var birthdayReg = /^\d{4}-\d{2}-\d{2}$/;
		
		var fm = document.forms[0];
		
		//判断必填  开始
		var username = fm.username.value;
		if (!/^\w+$/.test(username)) {
			alert("用户名请填写英文或者数字");
			return;
		}
		var name = fm.name.value;
		if ($.trim(name) == "") {
			alert("呢称不能为空");
			return;
		}
		
		var bid = fm.bid.value;
		if (!/^\d+$/.test(bid)) {
			alert("所属商户ID为数字");
			return;
		}
		
		var mobile = fm.mobile.value;
		if (!mobileReg.test(mobile)) {
			alert("请输入正确的手机号码");
			return;
		}
		
		var phone = fm.phone.value;
		if (!mobileReg.test(mobile) && !phoneReg.test(phone)) {
			alert("电话号码请填写正确的固话或者手机号码");
			return;
		}
		
		var email = fm.email.value;
		if ($.trim(email) == "") {
			alert("邮件格式有误，请重新填写。");
			return;
		}
		/*if (!emailReg.test(email)) {
			alert("邮件格式有误，请重新填写。");
			return;
		}*/
		
		var birthday = fm.birthday.value;
		if (birthday != "" && !birthdayReg.test(birthday)) {
			alert("出声日期格式错误，正确格式为：1947-10-01");
			return;
		}
		//判断必填  结束
		//$form.serializeArray()
		
		var data = $(fm).serializeArray();
		
		$.ajax({
			type:'POST',
			url: '${baseUrl}/admin/auth/user/save.html',
			data: data,
			dataType:"json",
			cache: false,
			success: function(data) {
				if(data.status == 200) {
					alert("保存成功");
					window.location.href = baseUrl + '/admin/auth/user/list.html';
				}
				else{
					alert(data.message);
				}
			},
			error:function (msg) {
				alert("提交出错，请联系系统管理员");
	        }
		});
		
	}
	
	function selectUser(sender) {
		if (sender && sender.id)
			$("#userId").val(sender.id);
	}
</script>
</head>
<body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">表单</a></li>
      <li>${empty entity ? '添加用户' : '修改用户' }</li>
    </ul>
  </div>
  
  <form id="form1" action="${baseUrl}/admin/auth/user/save.html" method="post">
  <input type="hidden" name="id" value="${entity.id}"/>
  
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li>
      	<label>用户名</label>
      	<input name="username" value="${entity.username}" type="text" <c:if test="${!empty entity.username}">readonly="readonly"</c:if> class="dfinput" /><i>必填,请填写英文账号</i>
      </li>
      <li>
      	<label>呢称</label>
      	<input name="name" value="${entity.name}" type="text" class="dfinput" /><i>必填</i>
      </li>
      <li>
      	<label>所属商户</label>
      	<input name="bid" readonly="readonly" onclick="showBid();" value="${entity.bid}" type="text" class="dfinput" /><i>必填,填写商户id</i>
      </li>
      <li>
      	<label>手机号</label>
      	<input name="mobile" value="${entity.mobile}" type="text" class="dfinput" /><i>必填</i>
      </li>
      <li>
      	<label>电话号码</label>
      	<input name="phone" value="${entity.phone}" type="text" class="dfinput" /><i>固话(020-88888888或者88888888)或者手机号码</i>
      </li>
      <li>
      	<label>邮箱</label>
      	<input name="email" value="${entity.email}" type="text" class="dfinput" /><i>必填</i>
      </li>
      <li>
      	<label>性别</label>
      	<input name="sex" value="0" type="radio" <c:if test="${empty entity || entity.sex == 0}">checked="checked"</c:if> /> 男
      	<input name="sex" value="1" type="radio" <c:if test="${entity.sex == 1}">checked="checked"</c:if> /> 女
      </li>
      <li>
      	<label>出生日期</label>
      	<input name="birthday" value="${entity.birthday}" type="text" class="dfinput" /><i>例子:1947-10-01</i>
      </li>
      <li>
      	<label>公司名称</label>
      	<input name="company" value="${entity.company}" type="text" class="dfinput" />
      </li>
      <li>
      	<label>地址</label>
      	<input name="address" value="${entity.address}" type="text" class="dfinput" />
      </li>
      
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  
  <div class="tip" style="height: 300px;">
	<div class="tiptop"><span>获取商家</span><a></a></div>
	<div align="center" style="margin-top: 8px;">
		<strong>商家名称</strong>&nbsp;&nbsp;
		<input value="" class="dfinput" id="bidName" style="width: 180px;" />
		<input name="" type="button"  class="sure" value="查询" onclick="bidSearch();" />
	</div>
	<div class="tipinfo" id="showInfo">
	</div>
	<div class="tipbtn">
        <input name="" type="button"  class="sure" id="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
	</div>
  </div>
  
  </form>
</body>

<script>
$(document).ready(function(){
	$(".tiptop a").click(function(){
		$(".tip").fadeOut(200);
	});
	
	$("#sure").click(function(){
	  var checks = $("input[name=check]:checked");
	  if (checks.length == 0) {
		  alert("请选择一个商户");
		  return;
	  } else if (checks.length > 1) {
		  alert("只能选择一个商户");
		  return;
	  }
	  document.forms[0].bid.value = checks[0].value
	  $(".tip").fadeOut(100);
	});

	$(".cancel").click(function(){
		$(".tip").fadeOut(100);
	});
});


function showBid(){
	$(".tip").fadeIn(200);
}

function bidSearch() {
	var bidName = $("#bidName").val();
	if (bidName == "") {
		alert("请填写查询商家的名称");
		return;
	}
	$("#showInfo").html("正在查询。。。");
	$.ajax({
		type:'POST',
		url:baseUrl + "/admin/wxbid/ajax/list.html",
		data:{pageSize:20, wxGzhName: bidName},
		dataType:"json",
		cache: false,
		async:false,
		success: function(data){
			var html = '<table border="1" width="100%">';
			html += '<tr><th width="5%"><input type="checkbox" id="all" /></th><th width="20%">商户名称</th><th width="40%">公众号ID</th><th>appId</th></tr>';
			for(var i = 0; i< data.length; i++){
				html += '<tr>';
				html += '<td class="scaleTd" style="text-align:center;"><input type="checkbox" name="check" value="' + data[i].id + '" /></td>';
				html += '<td class="scaleTd" style="text-align:center;">'+ data[i].wxGzhName + '</td>';
				html += '<td class="scaleTd" style="text-align:center;">'+ data[i].appId + '</td>';
				html += '<td>'+ data[i].wxGzhId + '</td>';
      			html += '</tr>';
			}
			html += '</table>';
			
			$("#showInfo").html(html);
		},
		error:function (msg) {
			alert("提交出错，请联系系统管理员");
        }
	});
}
</script>

</html>
