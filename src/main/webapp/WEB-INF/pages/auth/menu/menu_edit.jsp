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

<link rel="stylesheet" href="${baseUrl }/assets/component/kindeditor-4.1.7/themes/default/default.css" />
<link rel="stylesheet" href="${baseUrl }/assets/component/kindeditor-4.1.7/plugins/code/prettify.css" />
<script charset="utf-8" src="${baseUrl }/assets/component/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="${baseUrl }/assets/component/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script charset="utf-8" src="${baseUrl }/assets/component/kindeditor-4.1.7/plugins/code/prettify.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '${baseUrl }/assets/component/kindeditor-4.1.7/plugins/code/prettify.css',
				uploadJson : '${baseUrl }/common/upload_json.jsp',
				fileManagerJson : '${baseUrl }/common/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	});

	// 上传图标
	function uploadIcon(){
		var interval = window.setInterval(function(){
			var filepath = $('#myFile').val();
			
			if(filepath != ""){
				window.clearInterval(interval);
				$("#upForm").attr("action","${baseUrl }/manager/menu/upload");
				
				$("#upForm").ajaxSubmit({
	           		success: function(responseText, statusText, xhr, $form){
	           			alert(responseText);
	            	}
	       		});
			}
		},1000);
	}

	function submitForm(){
		
		JS.saveDate("form1",baseUrl + "/admin/auth/menu/save.html");
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
  <form id="form1" action="${baseUrl }/manager/menu/save.do" method="post">
  <input type="hidden" name="id" value="${menu.id }"/>
  <input type="hidden" name="parentId" value="${menu.parentId }"/>
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li><label>菜单名称<i color="red">*</i></label><input id="name" name="name" value="${menu.name }" type="text" class="dfinput" /><i>标题不能超过30个字符</i></li>
      <li><label>菜单编码</label><input id="code" name="code" value="${menu.code }" type="text" class="dfinput" /><i>多个关键字用,隔开</i></li>
      <li><label>URL</label><input name="url" type="text" value="${menu.url }" class="dfinput" /></li>
      <li><label>排序号</label><input name="orderNo" type="text" value="${menu.orderNo }" class="dfinput" /></li>
      <li><label>图标</label><input name="ico" type="text" value="${menu.ico }" class="dfinput" /></li>
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
</body>
</html>
