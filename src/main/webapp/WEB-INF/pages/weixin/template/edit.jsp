<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/select.css" />

<script type="text/javascript" src="${baseUrl }/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/select-ui.min.js"></script>
<script type="text/javascript">
	
	function submitForm() {
		JS.saveDate("form1",baseUrl + "/admin/wxtemplate/save.html");
	}
	
	$(function (){
		
		$("#code").val("${wxTemplate.code }");
		
		$(".select3").uedSelect({
			width : 100
		});
	});
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
  <form id="form1" action="${baseUrl}/admin/wxtemplate/save.html" method="post">
  <input type="hidden" name="id" value="${wxTemplate.id }">
  <input type="hidden" name="bid" value="${wxTemplate.bid }">
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li>
      	<label>模板类型</label>
      	<div class="vocation">
	      	<select id="code" name="code" class="select3">
	      		<option value="invite">新好友提醒</option>
	      		<option value="scale">佣金提醒</option>
				<option value="application">提现审核</option>
	      	</select>
      	</div>
      </li>
      <li>
      	<label>模板类型</label>
      	<div class="vocation">
	      	<input id="template" name="template" value="${wxTemplate.template }" type="text" class="dfinput" />
      	</div>
      </li>
      
      <li style="padding-top:30px;"><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
</body>
</html>

