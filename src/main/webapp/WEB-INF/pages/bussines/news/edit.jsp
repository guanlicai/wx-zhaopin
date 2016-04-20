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
var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="content"]', {
		uploadJson : '${baseUrl}/file/upload.html?path=product',
		themeType : 'simple',
		items : [
					'justifyleft', 'justifycenter', 'justifyright', '|','insertorderedlist', 'insertunorderedlist', '|', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough','|','table', 'hr', 'image','|','quickformat','lineheight','baidumap','link'
				]
	});
	
	K('#uploadImg').click(function () {
		editor.loadPlugin('image', function () {
			editor.plugin.imageDialog({
				imageUrl: K('#logo').val(),
				clickFn: function (url, title, width, height, border, align) {
					K('#logo').val(url);
					editor.hideDialog();
				}
			});
		});
	});
});
</script>
<script type="text/javascript">
	function submitForm() {
		var fm = document.forms[1];
		
		//判断必填  开始
		var title = fm.title.value;
		if ($.trim(title) == "") {
			alert("标题不能为空");
			return;
		}

		var intro = fm.intro.value;
		if ($.trim(intro) == "") {
			alert("摘要不能为空");
			return;
		}
		
		if (editor.html() == "") {
			alert("请填写内容");
		}
		
		$("#content").text(editor.html().replace(new RegExp("<","gm"),"&lt;").replace(new RegExp(">","gm"),"&gt;"));
		
		var data = $(fm).serializeArray();
		
		$.ajax({
			type:'POST',
			url: '${baseUrl}/admin/business/news/save.html',
			data: data,
			dataType:"json",
			cache: false,
			success: function(data) {
				if(data.status == 200) {
					alert("保存成功");
					window.location.href = baseUrl + '/admin/business/news/list.html';
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
				$('#myForm').attr("action","${baseUrl }/file/upload.html?path=bid");
				$('#myForm').ajaxSubmit({
		            success: function(responseText, statusText, xhr, $form){
		            	$('#myFile').val("");
		            
		            	if(responseText!=''){
		            		var result = eval("(" + responseText + ")");
			            	alert(result.url);
			            	
		            		$("#img").val(result.url);
		            		$("#showImg").attr("src","${baseServerUrl}" + result.url);
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
      <li>${empty entity ? '添加用户' : '修改用户' }</li>
    </ul>
  </div>
  
  <form id="myForm" enctype="multipart/form-data" method="POST">
	<input id="myFile" name="myFile" type="file" onclick="uploadIcon()" style="position: absolute;margin-top: 204px;margin-left: 360px;">
  </form>
  
  <form id="form1" action="${baseUrl}/admin/business/news/save.html" method="post">
  <input type="hidden" name="id" value="${entity.id}"/>
  <input type="hidden" id="img" name="img" value="${entity.img}"/>
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li>
      	<label>用户名</label>
      	<input name="title" value="${entity.title}" type="text" class="dfinput" /><i>必填</i>
      </li>
      <li>
      	<label>摘要</label>
      	<input name="intro" value="${entity.intro}" type="text" class="dfinput" /><i>必填</i>
      </li>
      <li>
      	<label>logo</label>
      	<img src="${baseServerUrl }${entity.img}" id="showImg" alt="未上传" style="width:200px;" />
      	<i style="color:red;">请上传600*400格式图片</i>
      </li>
      <li>
      	<label>内容</label>
      	<textarea name="content" id="content" rows="" cols="">${entity.content}</textarea>
      </li>
      
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  
  </form>
</body>
</html>
