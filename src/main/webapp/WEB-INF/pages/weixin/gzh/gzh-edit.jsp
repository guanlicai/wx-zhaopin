<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/select.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/select-ui.min.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>

<script type="text/javascript" src="${baseUrl }/assets/component/ui/ajaxform/jquery.form.js"></script>
<link rel="stylesheet" href="${baseUrl }/assets/component/easyui/themes/default/easyui.css" />
<script type="text/javascript" src="${baseUrl }/assets/component/easyui/easyloader.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/easyui/plugins/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/easyui/plugins/jquery.validatebox.js"></script>

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
				$('#myForm').attr("action","${baseUrl }/file/upload.html?path=bid");
				$('#myForm').ajaxSubmit({
		            success: function(responseText, statusText, xhr, $form){
		            	$('#myFile').val("");
		            	
		            
		            	if(responseText!=''){
		            		
		            		var result = eval("(" + responseText + ")");
			            	
		            		$("#logo").val(result.url);
		            		$("#showPic").attr("src","${baseServerUrl}" + result.url);
		            	}else{
		            		alert("上传失败");
		            	}
		            }
		        });
			}
		},2000);
	}

	function submitForm(){
		
		JS.saveDate("form1",baseUrl + "/admin/gzh/save.html");
	}
	
	$(document).ready(function(e) {
		
		$("#scaleType").val("${gzh.scaleType }");
		
		$("#type").val("${gzh.type }");
		
		$("#linkDirect").val("${gzh.linkDirect }");
		
		$("#template").val("${gzh.template }");
		
		
		
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
  <form id="myForm" enctype="multipart/form-data" method="POST">
	<input id="myFile" name="myFile" type="file" onclick="uploadIcon()" style="position: absolute;margin-top: 110px;margin-left: 250px;">
  </form>
  <form id="form1" action="${baseUrl }/admin/gzh/save.html" method="post">
  <input type="hidden" name="id" value="${gzh.id }"/>
  <input type="hidden" id="logo" name="logo" value="${gzh.logo }"/>
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
	  <li><label>商户图标</label><img id="showPic" src="${baseServerUrl}${gzh.logo}" title="未上传" style="width:100px;height:100px;"><i style="color:red;">请上传 120 * 120 规则图片</i></li>
      <li><label>商户名称</label><input id="name" name="name" value="${gzh.name }" type="text" class="dfinput" /><i>标题不能超过30个字符</i></li>
      <li><label>商户地址</label><input id="address" name="address" value="${gzh.address }" type="text" class="dfinput" /><i>多个关键字用,隔开</i></li>
      <li><label>联系人</label><input id="relMan" name="relMan" value="${gzh.relMan }" type="text" class="dfinput" />&nbsp;&nbsp;
     	  <i style="color:#000;">联系电话&nbsp;&nbsp;&nbsp;</i><input id="relPhone" name="relPhone" value="${gzh.relPhone }" type="text" class="dfinput" />
      </li>
      <li>
      	<label>公众号id</label><input id="wxGzhId" name="wxGzhId" value="${gzh.wxGzhId }" type="text" class="dfinput" />
      	<i style="color:#000;">公众号名称&nbsp;&nbsp;&nbsp;</i><input id="wxGzhName" name="wxGzhName" value="${gzh.wxGzhName }" type="text" class="dfinput" />
      </li>
      <li>
      	<label>appid</label><input id="appId" name="appId" value="${gzh.appId }" type="text" class="dfinput" />
      	<i style="color:#000;">appSecret&nbsp;&nbsp;&nbsp;</i><input id="appSecret" name="appSecret" value="${gzh.appSecret }" type="text" class="dfinput" />
      </li>
      <li>
      	<label>返现方式</label>
      	<div class="vocation">
      	<select id="scaleType" name="scaleType" class="select3">
      		<option value="1">固定</option>
      		<option value="2">百分比</option>
      	</select>
      	</div>
      	<i style="color:#000;">返现比率&nbsp;&nbsp;&nbsp;</i><input id="total" name="total" value="${gzh.total }" type="text" class="dfinput" />
      </li>
      <li>
      	<label>行业类型</label>
      	<div class="vocation">
      	<select id="type" name="type" class="select3">
      		<option value="1">酒店</option>
      		<option value="2">车行</option>
      	</select>
      	</div>
      	<i style="color:#000;">返现层级&nbsp;&nbsp;&nbsp;</i><input id="level" name="level" value="${gzh.level }" type="text" class="dfinput" />
      </li>
      <li>
      	<label>使用模板</label>
      	<div class="vocation">
      	<select id="template" name="template" class="select3">
      		<option value="bsct">百索餐厅</option>
      	</select>
      	</div>
      	<i></i></li>
      <li>
      	<label>第三方</label>
      	<div class="vocation">
      	<select id="linkDirect" name="linkDirect" class="select3">
      		<option value="-1">存在</option>
      		<option value="1">不存在</option>
      	</select>
      	</div>
      	<i style="color:#000;">原有链接&nbsp;&nbsp;&nbsp;</i><input id="linkUrl" name="linkUrl" value="${gzh.linkUrl }" type="text" class="dfinput" style="width:400px"/>
      	<i style="color:#000;">token&nbsp;&nbsp;&nbsp;</i><input id="token" name="token" value="${gzh.token }" type="text" class="dfinput" style="width:100px"/>
      </li>
      <li><label>商户简介</label><textarea id="summary" name="summary" style="border:solid 1px #a7b5bc;width:650px;height:100px;">${gzh.summary }</textarea><i>标题不能超过30个字符</i></li>
      <li><label>商户详情</label><textarea id="content" name="content">${gzh.content }</textarea><i></i></li>

      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
</body>
</html>
