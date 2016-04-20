<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${baseUrl }/assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/appmsg.css" />
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/appmsg-mul.css" />
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
  		<form class="form-horizontal" id="validation-form" 
										method="post" action="${baseUrl }/wp/weichat/msg/sigle/save.html"
										onsubmit="return validateCallback(this);">
										<input type="hidden" id="mid" name="mid" value="${resourceid }" />
										<input type="hidden" id="bid" name="bid" value="${bid }" />
										
										<div class="row" style="padding-left:120px;">
		<div class="span5 msg-preview" id="nrdiv1" style="width:350px;float:left;">
			<div class="msg-item-wrapper" relid="">
				<c:if test="${msg eq null }">
					<div class="appmsgItem msg-item sub-msg-opr-show">
						<p class="msg-meta">
							<span class="msg-date"><fmt:formatDate value="${dateNow }" type="date" dateStyle="default"/></span>
						</p>
						<div class="cover">
							<img id="myIcon1" class="i-img m-img" src="${baseURL }/assets/images/fmdtp.jpg" style="height: 172px;">
							<h4 class="msg-t">
								<span class="i-title m-title" id="span-title-1">标题</span>
							</h4>
							<ul class="abs tc sub-msg-opr">                 
								<li class="b-dib sub-msg-opr-item">                   
									<a href="javascript:;" onclick="edititem(this, 1);" class="th opr-icon edit-icon">编辑</a>                 
								</li>               
							</ul>
							<img class="i-img" style="">
						</div>
					</div>
					<div class="rel sub-msg-item appmsgItem">              
						<span class="thumb">                    
						<img id="myIcon2" class="i-img m-img" src="${baseURL }/assets/images/ddspic.png" style="width: 72px;height: 72px;">
						</span>       
						<h4 class="msg-t">                    
						<span class="i-title m-title" id="span-title-2">标题</span>                
						</h4>       
						<ul class="abs tc sub-msg-opr">         
							<li class="b-dib sub-msg-opr-item">           
								<a href="javascript:;" onclick="edititem(this, 2);" class="th opr-icon edit-icon">编辑</a>         
							</li>         
							<li class="b-dib sub-msg-opr-item">           
								<a href="javascript:;" onclick="delitem(this, 2);" class="th opr-icon del-icon">删除</a>         
							</li>       
						</ul>    
					</div>
					<div class="sub-add">            
					<a href="javascript:;" class="block tc sub-add-btn" onclick="addaline();">
					<span class="vm dib sub-add-icon"></span>增加一条</a>           
					</div>
				</c:if>
				<c:if test="${msg ne null }">
					<c:forEach items="${msg }" var="d" varStatus="ss">
						<c:if test="${ss.count eq 1 }">
							<div class="appmsgItem msg-item sub-msg-opr-show">
								<p class="msg-meta">
									<span class="msg-date">${d.updateTime }</span>
								</p>
								<div class="cover">
									<img id="myIcon${ss.count }" class="i-img m-img" src="${baseServerUrl }/yesm/attachs/msg/${d.img }" style="height: 176px;">
									<h4 class="msg-t">
										<span class="i-title m-title" id="span-title-${ss.count }">${d.title }</span>
									</h4>
									<ul class="abs tc sub-msg-opr">
										<li class="b-dib sub-msg-opr-item">
											<a href="javascript:;" onclick="edititem(this, ${ss.count });" class="th opr-icon edit-icon">编辑</a>                 
										</li>               
									</ul>
									<img class="i-img" style="">
								</div>
							</div>
						</c:if>
						<c:if test="${ss.count gt 1 }">
							<div class="rel sub-msg-item appmsgItem">              
								<span class="thumb">                    
								<img id="myIcon${ss.count }" class="i-img m-img" src="${baseServerUrl }/yesm/attachs/msg/${d.img }" style="width: 72px;height: 72px;">
								</span>       
								<h4 class="msg-t">                    
								<span class="i-title m-title" id="span-title-${ss.count }">${d.title }</span>                
								</h4>       
								<ul class="abs tc sub-msg-opr">         
									<li class="b-dib sub-msg-opr-item">           
										<a href="javascript:;" onclick="edititem(this, ${ss.count });" class="th opr-icon edit-icon">编辑</a>         
									</li>         
									<li class="b-dib sub-msg-opr-item">           
										<a href="javascript:;" onclick="delitem(this,${ss.count });" class="th opr-icon del-icon">删除</a>         
									</li>       
								</ul>    
							</div>
						</c:if>
					</c:forEach>
						<div class="sub-add">            
							<a href="javascript:;" class="block tc sub-add-btn" onclick="addaline();">
							<span class="vm dib sub-add-icon"></span>增加一条</a>           
						</div>
				</c:if>
			</div>
		</div>
		<div class="span7" style="float:left;padding-left:30px;">
			<c:if test="${msg eq null }">
				<c:forEach begin="1" end="2" step="1" var="s">
					<div id="msgediter-${s }" class="msg-editer-wrapper ${s gt 1 ? 'msg-hide' : ''}"  style="margin-top: 40px;">
						<div class="msg-editer" style="width:570px;">
							<form id="form${s}"></form>
							
							<form id="myForm${s}" enctype="multipart/form-data" method="POST">
								<input id="myFile${s}" name="myFile" type="file" onclick="uploadIcon(${s}, 0)">
								<div>(必须上传一张图片)封面图片规格建议300*160, 大小在20k以内</div>
			          		</form>
							<form id="dataForm-${s }" >
								<input id="index${s }" type="hidden" value="${s }">
								<input id="id${s }" type="hidden" value="0">
								<input id="type${s }" type="hidden" value="1">
								<input id="img${s }" type="hidden" value="">
								<table style="border: 0px solid #ccc;width:550px;">
									<tr id="btnTr${s }">
										<input type="button" value="上传图片" id="myFile${s }">
										<span id="myFileTip">
											<c:if test="${s eq 1 }">
											图片规则建议900*500像素
											</c:if>
											<c:if test="${s ne 1 }">
											图片规则建议200*200像素
											</c:if>
										</span>
									</tr>
									<tr><th align="left" class="p12">标题*(必填,不能超过64个字)</th>
									<tr><td>
									<input type=text id="title${s }" value="" style="width:98%;" style="width:98%;" class="dfinput" onkeyup="$('#span-title-${s}').text(this.value)"/>
									</td>
									<tr><th align="left" class="p12">正文*(正文和链接地址至少填写一项)</th>
									<tr><td><textarea id="details${s }" name="details" style="width: 98%; height: 240px;"></textarea></td>
									<tr><th align="left" class="p12">地址 (请输入正确的URL链接格式)</th>
									<tr><td>
									<input type=text id="url${s }" value="" style="width:98%;" style="width:98%;" class="dfinput" /></td>
									<tr><th align="left" class="p12">是否设置分享 <input type="checkbox" id="isshare${s }" name="isshare" style="margin: 5px; outline: none;"></th>
								</table>
							</form> 
						</div>
						<span class="abs msg-arrow a-out" style="margin-top: 0px;"></span>
						<span class="abs msg-arrow a-in" style="margin-top: 0px;"></span>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${msg ne null }">
				<c:forEach items="${msg }" var="d" varStatus="ss">
					<div id="msgediter-${ss.count }" class="msg-editer-wrapper ${ss.count gt 1 ? 'msg-hide' : ''}"  style="margin-top: 40px;">
						<div class="msg-editer" style="width:400px;">
							<c:set var="idx"  value="${ss.index + 1}"></c:set>
							
							<form id="myForm${idx}" enctype="multipart/form-data" method="POST">
								<input id="myFile${idx}" name="myFile" type="file" onclick="uploadIcon(${idx}, 0)">
								<div>(必须上传一张图片)封面图片规格建议300*160, 大小在20k以内</div>
			          		</form>
							<form id="dataForm-${idx}" >
								<input id="index${idx}" type="hidden" value="${idx}">
								<input id="id${idx}" type="hidden" value="${d.id }">
								<input id="type${idx}" type="hidden" value="1">
								<input id="img${idx}" type="hidden" value="${d.img }">
								<table style="border: 0px solid #ccc;width:380px;">
									<tr id="btnTr${idx}">
										<input type="button" value="上传图片" id="myFile${idx}">
										<span id="myFileTip">
											<c:if test="${idx eq 1 }">
											图片规则建议900*500像素
											</c:if>
											<c:if test="${idx ne 1 }">
											图片规则建议200*200像素
											</c:if>
										</span>
									</tr>
									<tr><th align="left" class="p12">标题*(必填,不能超过64个字)</th>
									<tr><td><input type=text id="title${idx}" value="${d.title }" style="width:95%;" class="easyui-validatebox" required="true" validType="length[1,64]" onkeyup="$('#span-title-${idx}').text(this.value)"></td>
									<tr><th align="left" class="p12">正文*s(正文和链接地址至少填写一项)</th>
									<tr><td><textarea id="details${idx}" name="details" style="width: 98%; height: 240px;">${d.detail }</textarea></td>
									<tr><th align="left" class="p12">地址 (请输入正确的URL链接格式)</th>
									<tr><td><input type=text id="url${idx}" value="${d.url }" style="width:98%;" style="width:98%;" class="dfinput" /></td>
									<tr><th align="left" class="p12">是否设置分享 <input <c:if test="${d.share == 1}">checked="checked"</c:if> type="checkbox" id="isshare${idx}" name="isshare" style="margin: 5px; outline: none;"></th>
								</table>
							</form> 
						</div>
						<span class="abs msg-arrow a-out" style="margin-top: 0px;"></span>
						<span class="abs msg-arrow a-in" style="margin-top: 0px;"></span>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
										

										<hr />
										<div class="clearfix form-actions">
											<div class="col-md-offset-3 col-md-9">
												<button class="btn btn-success" type="button" onclick="savemsg();">
													<i class="ace-icon fa fa-check bigger-110"></i> 提交
												</button>

												&nbsp; &nbsp; &nbsp;
												<button class="btn" type="reset">
													<i class="ace-icon fa fa-undo bigger-110"></i> 取消
												</button>
											</div>
										</div>


									</form>
  		</td>
  	</tr>
  </table>
    
</div>
</body>

<script>
	var scount = 1; // subitems size
	var delSidArr = new Array();
	var editorArr=new Array();
	var options = {
			uploadJson : '${baseURL}/msg/image/upload?uploadType=1&uploadMid=',
			themeType : 'simple',
			items : [
				'justifyleft', 'justifycenter', 'justifyright', '|','insertorderedlist', 'insertunorderedlist', '|', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough','|','table', 'hr', 'image','|','quickformat','lineheight','baidumap','link'
			]
		};
	KindEditor.ready(function(K) {
		if(${msg ne null}){
			<c:forEach items="${msg}" var="d" varStatus="s">
				options.uploadJson = "${baseURL}/msg/image/upload?uploadType=1&uploadMid=&uploadMid=${d.id}&uploadSindex=${s.count}";
				editorArr[${s.count - 1}] = K.create("#details${s.count}",options);
			</c:forEach>
		}else{
			for(var i = 0; i < 2; i++){
				options.uploadJson = "${baseURL}/msg/image/upload?uploadType=1&uploadMid=0&uploadMid=0&uploadSindex="+(i + 1);
				editorArr[i] = K.create("#details"+ (i + 1),options);
			}
		}
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
		if(${msg ne null}){
			scount = parseInt('${subMsgSize}');
		}else{
			scount = 2;
		}
	});
	
	// 上传图标
	function uploadIcon(idx, sid){
		var interval = window.setInterval(function(){
			var filepath = $('#myFile'+idx).val();
			if(filepath != ""){
				window.clearInterval(interval);
				$('#myForm'+idx).attr("action","${baseUrl}/file/upload.html?path=message");
				
				$('#myForm'+idx).ajaxSubmit({
		            success: function(responseText, statusText, xhr, $form){
		            	$('#myFile'+idx).val("");
		            	if(responseText!=''){
		            		responseText = $.parseJSON(responseText);
		            		$("#img"+idx).val(responseText.url);
		            		$("#myIcon"+idx).attr("src","${baseURL}${msgPath}" + responseText.url);
		            	}else{
		            		alert("上传失败");
		            	}
		            },
					error: function(e){
						alert(e);
					}
		        });
			}
		},2000);
	}
$(function(){
	$('body').delegate('.appmsgItem','mouseenter',function(){
		$(this).addClass('sub-msg-opr-show');
		window.curedt = $(this);
	});
	$('body').delegate('.appmsgItem','mouseleave',function(){
		$(this).removeClass('sub-msg-opr-show');
	});
	
});

function verifyAll(){
	var t = true;
	var i = 1;
	$("form[id^='dataForm-']").each(function(){
		var idx = $(this).attr("id").split("-")[1];
		if(!verify(i)){
			t = false;
			return false;
		}
		i++;
	});
	return t;
}

function verify(idx){
	$("#details" + idx).text(editorArr[idx-1].html().replace(new RegExp("<","gm"),"&lt;").replace(new RegExp(">","gm"),"&gt;"));
	debugger;
	var title = $("#title" + idx).val();
	var img = $("#img" + idx).val();
	var details = $("#details" + idx).val();
	var url = $("#url" + idx).val();
	if(title==''){
		alert("请先填写标题");
		return false;
	}
	if(url=='' && details==''){
		alert("请先编辑正文或者链接地址");
		return false;
	}
	if(img==''){
		alert("请先上传封面图片");
		return false;
	}
	return true;
}

var curIdx = 1;
function edititem(o,idx){
	debugger;
	if(idx == 1 || verify(curIdx)) {
		$('.msg-editer-wrapper').hide();
		if(idx == 1){
			$('#msgediter-' + idx).show().css('marginTop','40px');
		}else {
			$('#msgediter-' + idx).show().css('marginTop',($(o).offset().top-99)+'px');
		}
		curIdx = idx;
	}
}
function delitem(o, idx){
	if($('.appmsgItem').size()>2){
		if(curIdx == idx){
			edititem(null, 1);
		}
		var sid = parseInt($("#id" + idx).val());
		if(sid > 0){
			delSidArr.push(sid);
		}
		$(o).parent().parent().parent().remove();
		$("#msgediter-" + idx).remove();
	}else{
		alert('多图文最少不得少于两篇内容');
	}
}
function addaline(){
	scount = scount+1;
	var s = scount;
	var theitem = $('.msg-item-wrapper').find('.appmsgItem').eq(1);
	var bzitem = theitem.clone();
	bzitem.find('.m-title').text('标题').attr("id", "span-title-" + s);
	bzitem.find('.m-img').attr('src','${baseURL }/assets/images/ddspic.png').attr("id", "myIcon" + s);
	bzitem.find('.edit-icon').unbind("click").removeAttr('onclick').bind("click", function(){edititem(this, s);});
	$('.sub-add').before(bzitem);
	
	// 右边编辑栏
	var theeditor = $('.span7').find('.msg-editer-wrapper').eq(1);
	var bzeditor = theeditor.clone();
	bzeditor.attr("id", "msgediter-" + s);
	bzeditor.find("form[id^='myForm']").attr("id", "myForm" + s);
	bzeditor.find("input[id^='myFile']").attr("id", "myFile" + s).unbind("click").removeAttr('onclick').bind("click", function(){uploadIcon(s, 0)});
	var dataForm = bzeditor.find("form[id^='dataForm-']");
	dataForm.attr("id", "dataForm-" + s);
	dataForm.children("input[id^='index']").attr("id", "index" + s).val(s);
	dataForm.children("input[id^='id']").attr("id", "id" + s).val(0);
	dataForm.children("input[id^='type']").attr("id", "type" + s).val(1);
	dataForm.children("input[id^='img']").attr("id", "img" + s).val("");
	dataForm.find("input[id^='title']").attr("id", "title" + s).val("标题").unbind("keyup").removeAttr('onkeyup').bind("keyup", function(){$('#span-title-' + s).text(this.value)});
	dataForm.find("textarea[id^='details']").attr("id", "details" + s).text("");
	dataForm.find(".ke-container").remove();
	dataForm.find("input[id^='url']").attr("id", "url" + s).val("");
	var isshare = dataForm.find("[id^='isshare']");
	isshare.attr("id", "isshare" + s);
	isshare[0].checked = false;
	
	$('.span7').append(bzeditor);
	$.getScript('${baseUrl }/assets/component/kindeditor/kindeditor-min.js', function() {
		options.uploadJson = "${baseURL}/msg/image/upload?uploadType=1&uploadMid=&uploadMid=${d.id}&uploadSindex=" + s;
		var editor = KindEditor.create("#details" + s, options)
		editorArr.push(editor);
	});
}

function savemsg(){
	if(verifyAll()){
		var data = [];
		$("form[id^='dataForm-']").each(function(){
			var idx = $(this).attr("id").split("-")[1];
			var sd = {};
			$("#details" + idx).text(editorArr[idx-1].html().replace(new RegExp("<","gm"),"&lt;").replace(new RegExp(">","gm"),"&gt;"));
			sd.id = $("#id" + idx).val();
			sd.type = $("#type" + idx).val();
			sd.title = $.trim($("#title" + idx).val());
			sd.img = $("#img" + idx).val();
			sd.details = $("#details" + idx).val();
			sd.url = $("#url" + idx).val();
			var isshare='0';
			if($(":checkbox[id=isshare" + idx + "]:checked").is(':checked')){
				isshare ='1';
			}
			sd.share = isshare;
			sd.index = $("#index" + idx).val();
			data.push(sd);
		});
		if(data.length> 10){
			alert("多图文最多只能设置十条图文消息");
			return false;
		}
		var id = $("#mid").val();
		$.ajax({
			url: "${baseURL}/admin/admin/weixin/msg/Multi/save.html",
			data: {id:id,data:JSON.stringify(data), delSids: delSidArr.join()},
			dataType: "JSON",
			type: "POST",
			success: function (json) {
				if (json.status == "success") {
					alert("保存成功");
					//window.location.href = "${baseURL}/admin/admin/weixin/msg/list.html";
				} else {
					alert("保存失败，请稍后重试！");
				}
			}
		});
		//var text = ajaxLoader("${baseURL}/admin/weixin/msg/Multi/save.html",{id:id,data:JSON.stringify(data), delSids: delSidArr.join()});
		/*if(parseInt(text,10)>0){
			alert("保存成功");
			window.location.href="${baseURL }/wx/msg/edit?type=1&id="+text;
		}else{
			alert("保存失败，请稍后重试！");
		}*/
	}
}
//$("#saveMsg").click(savemsg);
</script>
</html>