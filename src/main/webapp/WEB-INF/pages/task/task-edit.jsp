<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseURL }/assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseURL }/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${baseURL }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseURL }/assets/component/datepicker/WdatePicker.js"></script>
<script type="text/javascript">


	function submitForm(){
		
		$('#form1').submit();
	}
</script>
</head>
<body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">个人事务</a></li>
      <li><a href="#">新增任务</a></li>
    </ul>
  </div>
  <form id="form1" action="${baseURL }/task/save" method="post">
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li><label>任务名称</label><input id="title" name="title" value="${task.title }" type="text" class="dfinput" /><i>请填写任务名称，40字以内</i></li>
      <li><label>单位</label>
      	<select id="unit" name="unit" style="width:50px;" class="dfinput">
      	  <option value="1">年</option>
      	  <option value="2">月</option>
      	  <option value="3">日</option>
      	</select>
      <i>请选择任务计算单位</i></li>
      <li><label>时间</label>
      	<input type="text" id="startTime" name="startTime" style="width:120px;" value="<fmt:formatDate value="${task.startTime}" pattern="yyyy-MM-dd" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" class="dfinput" />
      	&nbsp;&nbsp;至&nbsp;&nbsp;
      	<input type="text" id="endTime" name="endTime" style="width:120px;" value="<fmt:formatDate value="${task.endTime}" pattern="yyyy-MM-dd" />" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" class="dfinput" />
      </li>
      <li><label>备注</label>
      	<textarea id="remark" name="remark" style="height:100px;" class="dfinput">${task.remark }</textarea>
      </li>
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
</body>
</html>
