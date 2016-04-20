<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.form.js"></script>
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
	

	$(document).ready(function(){
		
		$(".tiptop a").click(function(){
			  $(".tip").fadeOut(200);
			});
	
	  $(".tiptop a").click(function(){
		  $(".tip").fadeOut(200);
		});

		  $(".sure").click(function(){
		  $(".tip").fadeOut(100);
		});

		  $(".cancel").click(function(){
		  $(".tip").fadeOut(100);
		});
	
	});


	function submitForm() {
		var bid = $("[name=bid]").val();
		var title = $("[name=title]").val();
		bid = $.trim(bid);
		title = $.trim(title);
		if (bid == "") {
			alert("请输入商家公众号");
			return;
		}
		if (title == "") {
			alert("请输入产品标题");
			return;
		}
		
		$("#content").text(editor.html().replace(new RegExp("<","gm"),"&lt;").replace(new RegExp(">","gm"),"&gt;"));
		
		JS.saveDate("form1",baseUrl + "/admin/wxBidProduct/save.html");
		/*return;
		var url = baseUrl + "/admin/wxbid/updateType.html";
		var data = new Object();
		data["scaleType"] = scaleType;
		data["total"] = total;
		data["wxGzhId"] = '${wxBid.wxGzhId}';
		$.ajax({url: url, data: data, dataType: "json", success: function (json){
			if (json) {
				if (json.status == "success") {
					alert("保存成功");
					parent.location.href = baseUrl + json.url;
				} else {
					alert("保存出错，请联系管理员");
				}
			}
		}});*/
	}
	
	function selectUser(sender) {
		if (sender && sender.id)
			$("#userId").val(sender.id);
	}
	
	$(function (){
		$("input:radio[value=${empty wxBid.scaleType ? 1 : wxBid.scaleType}]").attr("checked", "checked");
		$("input:radio[name=scaleType]").click(function (){
			var message = "";
			if (this.value == 1) {
				message = "填写整数值";
			} else {
				message = "填写不大于1的小数";
			}
			$("[name=total]").next().html(message);
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
  <div class="upload2" id="tplupld" style="position:relative;top: 562px; left: 898px;z-index: 1000;display: none;">
	<a href="javascript:void(0);" class="upload-btn">
		<em>上传图片</em>
		<form id="upForm" method="post" enctype="multipart/form-data">
			<input id="myFile" name="myFile" type="file" class="simulate_upload2" />
         </form>
	</a>
  </div>
  <form id="form1" action="" method="post">
  <input name="id" value="${entity.id}" />
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li>
      	<label>商家公众号</label>
      	<input name="bid" value="${entity.bid}" type="text" class="dfinput" />
      </li>
      <li>
      	<label>产品标题</label>
      	<input name="title" value="${entity.title}" type="text" class="dfinput" />
      </li>
      <li>
      	<label>产品Logo</label>
      	<input id="logo" name="logo" value="${entity.logo}" type="text" class="dfinput" />&nbsp;
      	<input type="button" value="上传图片" id="uploadImg">
      </li>
      <li>
      	<label>产品详情</label>
      	<textarea id="content" name="content" class="dfinput" rows="10">${entity.content}</textarea>
      </li>
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
    
  <div class="tip">
	<div class="tiptop"><span>消费分成详情</span><a></a></div>
	<div class="tipinfo" id="showInfo">
	  <form id="uploadForm" enctype="multipart/form-data" method="POST" style="padding:10px 20px 10px 40px;">
			<p>商品名称:<input id="myFile" name="myFile" type="file" onclick="uploadIcon()"></p>
		</form>
	</div>
        
	<div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
	</div>
  </div>
</body>
</html>
