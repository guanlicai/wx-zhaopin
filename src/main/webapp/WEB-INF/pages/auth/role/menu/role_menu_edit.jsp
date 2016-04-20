<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript">
	function submitForm() {
		//JS.saveDate("form1",baseUrl + "/admin/auth/role/menu/save.html");
		var url = baseUrl + "/admin/auth/role/menu/save.html";
		var data = new Object();
		data["menuId"] = $("#menuId").val();
		data["roleId"] = '${roleId}';
		$.ajax({url: url, data: data, dataType: "json", success: function (json){
			if (json) {
				if (json.status == "success") {
					alert("保存成功");
					parent.location.href = baseUrl + json.url;
				} else {
					alert("保存出错，请联系管理员");
				}
			}
		}});
	}
	
	function selectMenu(sender) {
		if (sender && sender.id)
			$("#menuId").val(sender.id);
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
  <div class="upload2" id="tplupld" style="position:relative;top: 562px; left: 898px;z-index: 1000;display: none;">
	<a href="javascript:void(0);" class="upload-btn">
		<em>上传图片</em>
		<form id="upForm" method="post" enctype="multipart/form-data">
			<input id="myFile" name="myFile" type="file" class="simulate_upload2" />
         </form>
	</a>
  </div>
  <form id="form1" action="${baseUrl}/admin/auth/role/menu/save.html" method="post">
  <input type="hidden" name="roleId" value="${roleId}"/>
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li><label>选择菜单</label><input id="menuId" readonly="readonly" name="menuId" value="" type="text" class="dfinput" /><i>点击右面菜单选择</i></li>
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
</body>
</html>
