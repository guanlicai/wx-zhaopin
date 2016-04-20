<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/ui/ajaxform/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/kindeditor/kindeditor-min.js"></script>

<script type="text/javascript">
	function submitForm() {
		var fm = document.forms[1];
		
		//判断必填  开始
		var img = fm.img.value;
		if ($.trim(img) == "") {
			alert("请上传图片");
			return;
		}
		
		var data = $(fm).serializeArray();
		
		$.ajax({
			type:'POST',
			url: '${baseUrl}/admin/business/introimg/save.html',
			data: data,
			dataType:"json",
			cache: false,
			success: function(data) {
				if(data.status == "success") {
					alert("保存成功");
					window.location.href = baseUrl + '/admin/business/introimg/list.html';
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
	
	
	function uploadIcon(){
		var interval = window.setInterval(function(){
			var filepath = $('#myFile').val();
			if(filepath != ""){
				window.clearInterval(interval);
				$('#myForm').attr("action","${baseUrl }/file/upload.html?path=introimg");
				$('#myForm').ajaxSubmit({
		            success: function(responseText, statusText, xhr, $form){
		            	$('#myFile').val("");
		            
		            	if(responseText!=''){
		            		var result = eval("(" + responseText + ")");

		            		$("#img").val(result.url);
		            		$("#showPic").attr("src","${baseServerUrl}" + result.url);
		            	}else{
		            		alert("上传失败");
		            	}
		            }
		        });
			}
		},2000);
	}
</script>
</head>
<body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">表单</a></li>
      <li>${empty entity ? '添加图片' : '修改图片' }</li>
    </ul>
  </div>
  
  <form id="myForm" enctype="multipart/form-data" method="POST">
	<input id="myFile" name="myFile" type="file" onclick="uploadIcon()" style="position: absolute;margin-top: 104px;margin-left: 390px;">
  </form>
  
  <form id="form1" action="${baseUrl}/admin/business/news/save.html" method="post">
  <input type="hidden" name="id" value="${entity.id}"/>
  <input type="hidden" name="bid" value="${entity.bid}"/>
  
  <input type="hidden" id="img" name="img" value="${entity.img}"/>
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
	  <li><label>广告图片</label><img id="showPic" src="${baseServerUrl}${entity.img}" title="未上传" style="width:250px;height:150px;"><i style="color:red;">请上传 120 * 120 规则图片</i></li>
      
      
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  
  </form>
</body>
</html>
