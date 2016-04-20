<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${r'${empty entity.id ? "添加" : "修改" }'}${title}</title>
<custom:loadCom components="base-css,base-js,datePicker"/>
<script type="text/javascript">
	
	function submitForm(){
		JS.saveDate("form1",baseUrl + "${saveUrl}");
	}
</script>
</head>
<body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">表单</a></li>
      <li>${r'${empty entity.id ? "添加" : "修改" }'}${title}</li>
    </ul>
  </div>
  
  <form id="form1" action="" method="post">
  <input type="hidden" id="id" name="id" value="${r'${entity.id}'}"/>
  
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
	  <#list itemList as item>
        <#assign name="${item['name']}">
        <#assign type="${item['type']}">
        <#assign require="${item['require']}">
        <#assign number="${item['number']}">
        <#assign date="${item['date']}">
        <#assign maxlength="${item['maxlength']}">
      	<#if type == 'id'>
      	<#elseif date == 'true'>
	  <li>
      	<label>${name}</label>
		  <input type="text" name="${type}" value="${r'${entity.'}${type}}" class="dfinput" require="${require}" readonly onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/><#if require == 'true'><i>${name}不能为空</i></#if>
	  </li>
		<#else>
	  <li>
      	<label>${name}</label>
		  <input type="text" name="${type}" value="${r'${entity.'}${type}}" class="dfinput" require="${require}" number="${number}" maxlength=${maxlength}/><#if require == 'true'><i>${name}不能为空</i></#if>
	  </li>
		</#if>
      </#list>
      
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  
  </form>
</body>
</html>