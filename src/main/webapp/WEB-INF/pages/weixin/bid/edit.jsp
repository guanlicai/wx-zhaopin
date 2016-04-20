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
<script type="text/javascript">
	function submitForm() {
		var scaleType = $("[name=scaleType]:checked").val();
		var total = $("[name=total]").val();
		//alert(scaleType + "," + (parseFloat(total) >= 1) + "," + (!/^\d+\.\d{0,2}$/.test(total)));
		if (scaleType == 1 && !/^\d+\.{0,1}0*$/.test(total)) {
			alert("返现金额请填写正整数");
			return;
		} else if (scaleType == 2 && (!/^0\.\d{0,2}$/.test(total) || parseFloat(total) >= 1) ) {
			alert("返现金额请填写小于1的两位小数");
			return;
		}
		JS.saveDate("form1",baseUrl + "/admin/wxbid/updateType.html");
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
  <form id="form1" action="${baseUrl}/admin/wxbid/updateType.html" method="post">
  <input type="hidden" name="wxGzhId" value="${wxBid.wxGzhId}"/>
  <div class="formbody">
	<div class="formtitle"><span>基本信息</span></div>
	<ul class="forminfo">
      <li>
      	<label>返现方式</label>
      	<input name="scaleType" value="1" type="radio" /> 按固定返现
      	<input name="scaleType" value="2" type="radio" /> 按消费金额返现
      </li>
      <li>
      	<label>返现额</label>
      	<input name="total" value="${wxBid.total}" type="text" class="dfinput" /><i>填写整数值</i>
      </li>
      <li><label>&nbsp;</label><input type="button" class="btn" onclick="submitForm()" value="确认保存"/></li>
    </ul>
  </div>
  </form>
</body>
</html>
