<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript">
function submitForm(){
	var pwd = $("#pwd").val();
	var newPwd = $("#newPwd").val();
	var newPwd2 = $("#newPwd").val();
	if (!pwd || $.trim(pwd) == "" || !newPwd || $.trim(newPwd) == ""
			|| !newPwd2 || $.trim(newPwd2) == "") {
		alert("请填写全部密码");
		return;
	}
	if (newPwd != newPwd2) {
		alert("2次输入的新密码不一致");
		return;
	}
	var url = "${baseUrl}/admin/auth/update.html";
	var data = new Object();
	data["pwd"] = pwd;
	data["newPwd"] = newPwd;
	data["newPwd2"] = newPwd2;
	$.ajax({url: url, data: data, type: "POST", dataType: "JSON",success: function (json) {
		json = $.parseJSON(json);
		if (json) {
			if (json.status == 200) {
				alert("修改成功");
				location.reload();
			} else {
				alert(json.message);
			}
		} else {
			alert("修改密码失败");
		}
	}});
}
</script>
</head>
<body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">表单</a></li>
    </ul>
  </div>
  <form id="form1" action="${baseUrl}/admin/auth/update.html" method="post">
  <input type="hidden" name="id" value="${menu.id }"/>
  <input type="hidden" name="parentId" value="${menu.parentId }"/>
  <div class="formbody">
	<div class="formtitle"><span>修改密码</span></div>
	<ul class="forminfo">
      <li><label>原始密码</label><input id="pwd" name="pwd" value="" type="password" class="dfinput" /></li>
      <li><label>输入新密码</label><input id="newPwd" name="newPwd" value="" type="password" class="dfinput" /><i></i></li>
      <li><label>重复新密码</label><input name="newPwd2" type="password" value="" class="dfinput" /></li>
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
</body>
</html>
