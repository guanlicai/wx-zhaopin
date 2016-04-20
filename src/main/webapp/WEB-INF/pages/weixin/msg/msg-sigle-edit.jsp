<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/appmsg.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/kindeditor/kindeditor-min.js"></script>

<script type="text/javascript" src="${baseUrl }/assets/component/ui/ajaxform/jquery.form.js"></script>
<link rel="stylesheet" href="${baseUrl }/assets/component/easyui/themes/default/easyui.css" />
<script type="text/javascript" src="${baseUrl }/assets/component/easyui/easyloader.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/easyui/plugins/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/easyui/plugins/jquery.validatebox.js"></script>

</head>
<body>
<!-- 位置信息 -->
<div class="place">
  <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">系统管理</a></li>
      <li><a href="#">菜单管理</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
    
  <table border="0" style="width:100%;">
  	<tr>
  		
  		<td>
  		<div class="row" style="padding-left:50px;">
		<div class="span5 msg-preview" id="nrdiv1" style="width:350px;float:left;">
			<div class="msg-item-wrapper" relid="">
				<div id="appmsgItem1" class="msg-item">
					<h4 class="msg-t">
						<span class="i-title m-title" rel="title">${singleMsg.title }</span>
					</h4>
					<p class="msg-meta">
						<span class="msg-date"><fmt:formatDate value="${singleMsg.id eq null || singleMsg.id eq 0 ? dateNow : singleMsg.updateTime }" type="date" dateStyle="default"/></span>
					</p>
					<div class="cover">
						<c:set value="${baseServerUrl }${singleMsg.img }" var="imgurl"></c:set>
						<img id="myIcon" class="i-img m-img" relobj="elfinder_pscgztw" src="${imgurl }" style="width: 440px;height: 180px;">
					</div>
					<p class="msg-text m-desc" rel="desc">${msg.description }</p>
					<div rel="con" class="m-con" style="display: none;"></div>
					<div rel="url" class="m-url" style="display: none;"></div>
				</div>
				<div class="msg-hover-mask"></div>
				<div class="msg-mask">
					<span class="dib msg-selected-tip"></span>
				</div>
			</div>
		</div>
		<div class="span7" style="width:550px;float:left;padding-left:30px;">
			<div class="msg-editer-wrapper">
				<div class="msg-editer" style="width:400px;">
					<form id="myForm" enctype="multipart/form-data" method="POST">
						<input id="myFile" name="myFile" type="file" onclick="uploadIcon()">
						<div>(必须上传一张图片)封面图片规格建议300*160, 大小在20k以内</div>
	          		</form>
					<form id="myForm1" method="post" action="${baseUrl }/admin/weixin/msg/sigle/save.html">
						<input id="id" name="id" type="hidden" value="${singleMsg.id }">
						<input id="type" type="hidden" value="${singleMsg.type eq null ? 0 : singleMsg.type }">
						<input type="hidden" name="bid" value="${singleMsg.bid }" />
						<input id="img" name="img" type="hidden" value="${singleMsg.img }">
						<table style="border: 0px solid #ccc;width:400px;">
							<tr><th align="left" class="p12">标题*(必填,不能超过64个字)</th>
							<tr><td><input type="text" id="title" name="title" value="${singleMsg.title }" style="width:98%;" class="dfinput" onkeyup="$('.m-title').text(this.value)"/></td>
							<tr><th align="left" class="p12">摘要* (不能超过120个字)</th>
							<tr><td><textarea id="description" name="description" style="width:98%;height:80px;border:solid 1px #a7b5bc;">${singleMsg.description }</textarea></td>
							<tr><th align="left" class="p12">正文*(正文和链接地址至少填写一项)</th>
							<tr><td><textarea id="detail" name="detail" style="width: 98%;height: 250px;" class="required">${singleMsg.detail }</textarea></td>
							<tr><th align="left" class="p12">地址 (请输入正确的URL链接格式)</th>
							<tr><td><input type="text" id="url" name="url" value="${singleMsg.url }" style="width:98%;" class="dfinput" /></td>
							<tr><th align="left" class="p12">标签 (方便您快速识别该记录)</th>
							<tr><td><input type="text" id="label" name="label" value="${singleMsg.label }" style="width:98%;" class="dfinput" /></td>
							<tr><th align="left" class="p12">是否设置分享 <input type="checkbox" id="isshare" name="isshare" style="margin: 5px; outline: none;"></th>
							<tr><td></td>
						    <tr><td colspan="2" align="center">
						    	<button id="save-btn" type="button" onclick="savemsg();" class="btn btn-small">保存</button>
						    	<button id="cancel-btn" type="button" class="btn btn-small" onclick="location.href='${baseURL }/wx/msg/list'">返回</button>
						    </td></tr>
						</table>
					</form>
				</div>
				<span class="abs msg-arrow a-out" style="margin-top: 0px;"></span>
				<span class="abs msg-arrow a-in" style="margin-top: 0px;"></span>
			</div>
		</div>
	</div>
  		</td>
  	</tr>
  </table>
    
</div>
</body>

<script type="text/javascript">
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="detail"]', {
			uploadJson : '${baseUrl }/file/upload.html?path=msg',
			themeType : 'simple',
			items : [
				'source','|','justifyleft', 'justifycenter', 'justifyright', '|','insertorderedlist', 'insertunorderedlist', '|', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough','|','table', 'hr', 'image','|','quickformat','lineheight','baidumap','link'
			]
		});
	});
	
	$(document).ready(function(){
		if ($.browser.msie) {
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
				$('#myForm').attr("action","${baseUrl }/file/upload.html?path=msg");
				$('#myForm').ajaxSubmit({
		            success: function(responseText, statusText, xhr, $form){
		            	$('#myFile').val("");
		            	
		            
		            	if(responseText!=''){
		            		
		            		var result = eval("(" + responseText + ")");
			            	
		            		$("#img").val(result.url);
		            		$("#myIcon").attr("src","${baseServerUrl}" + result.url);
		            	}else{
		            		alert("上传失败");
		            	}
		            }
		        });
			}
		},2000);
	}
	
	function savemsg(){
		$("#detail").text(editor.html().replace(new RegExp("<","gm"),"&lt;").replace(new RegExp(">","gm"),"&gt;"));
		
		$("#myForm1").submit();
	}
</script>
</html>