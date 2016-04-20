<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/select.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/ui/ajaxform/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/component/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/select-ui.min.js"></script>

<script type="text/javascript">
$(document).ready(function(e) {
	$(".select3").uedSelect({
		width : 100
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

		JS.saveDate("form1",baseUrl + "/admin/activity/void/save.html");
		
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
      <li>${empty entity ? '添加投票' : '修改修改' }</li>
    </ul>
  </div>
  
  <form id="myForm" enctype="multipart/form-data" method="POST">
	<input id="myFile" name="myFile" type="file" onclick="uploadIcon()" style="position: absolute;margin-top: 80px;margin-left: 360px;">
  </form>
  
  <form id="form1" action="${baseUrl}/admin/activity/void/save.html" method="post">
  <input type="hidden" name="id" value="${entity.id}"/>
  <input type="hidden" id="img" name="showPic" value="${entity.showPic}"/>
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
	  <li>
      	<label>logo</label>
      	<img src="${baseServerUrl }${entity.showPic}" id="showImg" alt="未上传" style="width:200px;height:100px;" />
      	<i style="color:red;">请上传600*400格式图片</i>
      </li>
      <li>
      	<label>标题</label>
      	<input name="title" value="${entity.title}" type="text" class="dfinput" /><i>必填</i>
      </li>
      <li>
      	<label>状态</label>
        <div class="vocation">
	      <select id="status" name="status" class="select3">
	        <option value="1">正常</option>
	        <option value="0">不可用</option>
	      </select>
	    </div>
        <script type="text/javascript">
          $("#status").val("${entity.status}");
        </script>
      </li>
      <li>
      	<label>投票开始时间</label>
      	<input name="strStartTime" value="${entity.startTime}" type="text" class="dfinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/><i>必填</i>
      </li>
      <li>
      	<label>投票结束时间</label>
      	<input name="strEndTime" value="${entity.endTime}" type="text" class="dfinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/><i>必填</i>
      </li>
      
    </ul>
    <div class="formtitle"><span>投票选顶</span></div>
    <ul class="forminfo">
      <li>
      	<table border="0" >
		  <tr style="text-align:center;">
		  	<td width="86px">选项1</td>
		  	<td><input name="option1" value="" type="text" class="dfinput" style="width:350px;"/></td>
		  	<td style="width:80px;">	
		  		<img src="${baseUrl }/assets/images/t01.png">&nbsp;&nbsp;
		  		<img src="${baseUrl }/assets/images/t03.png">
		  	</td>
	      </tr>
	      <tr style="text-align:center;">
		  	<td width="86px">选项2</td>
		  	<td><input name="option2" value="" type="text" class="dfinput" style="width:350px;"/></td>
		  	<td style="width:80px;">	
		  		<img src="${baseUrl }/assets/images/t01.png">&nbsp;&nbsp;
		  		<img src="${baseUrl }/assets/images/t03.png">
		  	</td>
	      </tr>
		</table>
      </li>
      
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  
  </form>
</body>
</html>
