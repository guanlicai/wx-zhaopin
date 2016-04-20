<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${empty entity.id ? "添加" : "修改" }教师信息</title>
<custom:loadCom components="base-css,base-js,datePicker"/>
<script type="text/javascript">
	
	function submitForm(){
		JS.saveDate("form1",baseUrl + "/file/teacher/save.html");
	}
</script>
</head>
<body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">表单</a></li>
      <li>${empty entity.id ? "添加" : "修改" }教师信息</li>
    </ul>
  </div>
  
  <form id="form1" action="" method="post">
  <input type="hidden" id="id" name="id" value="${entity.id}"/>
  
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
	  <li>
      	<label>姓名</label>
		  <input type="text" name="name" value="${entity.name}" class="dfinput" require="true" number="false" maxlength=100/><i>姓名不能为空</i>
	  </li>
	  <li>
      	<label>性别</label>
		  <input type="text" name="sex" value="${entity.sex}" class="dfinput" require="true" number="true" maxlength=255/><i>性别不能为空</i>
	  </li>
	  <li>
      	<label>毕业时间</label>
		  <input type="text" name="graduateTime" value="${entity.graduateTime}" class="dfinput" require="true" readonly onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/><i>毕业时间不能为空</i>
	  </li>
	  <li>
      	<label>毕业院校</label>
		  <input type="text" name="graduateSchool" value="${entity.graduateSchool}" class="dfinput" require="true" number="false" maxlength=50/><i>毕业院校不能为空</i>
	  </li>
	  <li>
      	<label>婚姻状态</label>
		  <input type="text" name="marriage" value="${entity.marriage}" class="dfinput" require="true" number="true" maxlength=255/><i>婚姻状态不能为空</i>
	  </li>
	  <li>
      	<label>isDeleted</label>
		  <input type="text" name="isDeleted" value="${entity.isDeleted}" class="dfinput" require="true" number="true" maxlength=255/><i>isDeleted不能为空</i>
	  </li>
	  <li>
      	<label>version</label>
		  <input type="text" name="version" value="${entity.version}" class="dfinput" require="true" number="true" maxlength=255/><i>version不能为空</i>
	  </li>
      
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  
  </form>
</body>
</html>