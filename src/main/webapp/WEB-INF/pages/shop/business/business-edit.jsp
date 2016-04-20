<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseURL }/assets//css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseURL }/assets//js/jquery.form.js"></script>
<script type="text/javascript" src="${baseURL }/assets//js/jquery.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		if ($.browser.msie) {
			$(".upload2").show();
			$("#myFile").bind('click',function(){
				uploadIcon();
			});
		}else{
			$("#myIcon").bind('click',function(){
				$("#myFile").click();
				uploadIcon();
			});
		}
	});

	// 上传图标
	function uploadIcon(){
		var interval = window.setInterval(function(){
			var filepath = $('#myFile').val();
			
			if(filepath != ""){
				window.clearInterval(interval);
				$("#upForm").attr("action","${baseURL }/manager/menu/upload");
				
				$("#upForm").ajaxSubmit({
	           		success: function(responseText, statusText, xhr, $form){
	           			alert(responseText);
	            	}
	       		});
			}
		},1000);
	}

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
  <form id="form1" action="${baseURL }/admin/business/save.html" method="post">
  <input type="hidden" name="id" value="${business.id }"/>
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li><label>商户名称</label><input id="name" name="name" value="${business.name }" type="text" class="dfinput" /><i>标题不能超过30个字符</i></li>
      <li><label>商户地址</label><input id="code" name="code" value="${business.address }" type="text" class="dfinput" /><i>多个关键字用,隔开</i></li>
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
</body>
</html>
