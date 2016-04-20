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
  <form id="myForm" enctype="multipart/form-data" method="POST">
	<input id="myFile" name="myFile" type="file" onclick="uploadIcon()" style="position: absolute;margin-top: 110px;margin-left: 250px;">
  </form>
  <form id="form1" action="" method="post">
  <input type="hidden" name="id" value="${entity.id}" />
  <input type="hidden" id="logo" name="logo" value="${entity.logo}" />
  <input type="hidden" name="bid" value="${entity.bid}" />
  <input type="hidden" name="state" value="${entity.state}" />
  
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
	
	  <li><label>产品图片</label><img id="showPic" src="${baseServerUrl}${entity.logo}" title="未上传" style="width:100px;height:100px;"><i style="color:red;">请上传 120 * 120 规则图片</i></li>
      <li>
      	<label>产品标题</label>
      	<input name="title" value="${entity.title}" type="text" class="dfinput" />
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
