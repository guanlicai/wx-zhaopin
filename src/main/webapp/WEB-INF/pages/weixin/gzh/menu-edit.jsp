<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
<style type="text/css">

li{
	list-style: none;
}

.menu{
	background: #666;
	font-weight: bold;
	color: #fff;
	border-radius: 4px;
	padding: 1px 10px;
}

.sub_menu{
	background: #999;
	font-weight: bold;
	color: #fff;
	border-radius: 4px;
	padding: 1px 10px;
}

.mytable td{
	padding:5px 0 5px 0;
}

.title{
	text-align: center;
	min-height: 38px;
	border: 1px solid #DDD;
	background: #F7F7F7;
	line-height: 38px;
}

.contain{
	border-left: 1px solid #DDD;
	border-right: 1px solid #DDD;
	border-bottom: 1px solid #DDD;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#newBtn").click(function(){
	  	window.location.href = "${baseUrl}/admin/gzh/edit.html";
	  });
	  ;
	  
	  $("#modifyBtn").click(function(){
		  	if(JS.selectOne()){
		  		window.location.href = "${baseUrl}/admin/gzh/edit.html?id="+JS.getSelect();
		  	}
		  	else{
		  		alert("请选择一条数据");
		  	}  	
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
	
	
</script>
</head>


<body>
<!-- 位置信息 -->
<div class="place">
  <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">商户管理</a></li>
      <li><a href="#">商户管理</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
	  <li id="searchBtn" onclick="synMenu2Weixin('${param.id}')"><span><img src="${baseUrl }/assets/images/t05.png" /></span>同步菜单</li>
	</ul>
  </div>
    
  <table width="99%" border="0">
	<tr>
		<td style="vertical-align: top;">
			<!-- 菜单展示区域 -->
			<div class="widget-box">
				<div class="title" style="text-align:center;">
					<h4 class="widget-title lighter">菜单配置示意图</h4>
				</div>

				<div class="widget-body">
					<div class="widget-main">

						<!-- #section:plugins/fuelux.wizard.container -->
						<div class="contain" id="step-container">
						<table class="mytable" style="width: 100%;">
							<tr>
								<td valign="top">
									<c:forEach items="${treeMenuMap }" var="map" varStatus="s">
									<c:set var="m" value="${bizMenuMap[map.key]}"></c:set>
									<li style="float: left;width: 30%;padding-left:20px;line-height:20px;">
										一级(${s.count })：<a class="emenu deep" href="#" onclick="editmenu(true,${map.key },0,'${m.gzhId }','${m.name }','${m.type }','${m.val }','${m.state }','${m.orderNo }','#mt${map.key }')">${map.key < 0 ? '[未设定]' : m.name }(id:${map.key })</a>
										<input id="mt${map.key }" type="hidden" value="${m.title }">
										<ul style="padding-left:20px;">
											<c:forEach items="${map.value }" var="sid" varStatus="ss">
											<c:set var="m" value="${bizMenuMap[sid]}"></c:set>
												<li>
													二级(${ss.count })：<a class="emenu" href="#" onclick="editmenu(false,${sid },${map.key },'${m.gzhId }','${m.name }','${m.type }','${m.val }','${m.state }','${m.orderNo }','#mt${sid }')">${sid < 0 ? '[未设定]' : m.name }(id:${sid })</a>
													<input id="mt${sid }" type="hidden" value="${m.title }">
												</li>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
									</td>
								</tr>
							</table>
						</div>

					</div>
					<!-- /.widget-main -->
				</div>
				<!-- /.widget-body -->
			</div>
		</td>
		<td style="vertical-align: top;padding-left:5px;width:350px;">
		
			<!-- 菜单展示区域 -->
			<div class="widget-box">
				<div class="title" style="text-align:center;">
					<h4 class="widget-title lighter">菜单编辑</h4>
				</div>

				<div class="widget-body">
					<div class="widget-main">

						<!-- #section:plugins/fuelux.wizard.container -->
						<div class="contain" id="step-container">
							<div id="editmenu" style="display: none;padding-left:5px;">
							
							<form id="myForm20">
								<input id="mid" type="hidden">
								<input id="mbid" type="hidden">
								<table class="mytable" style="width:98%;">
									<tr><td width="70">菜单名称</td><td><input type=text id="mname" style="width: 98%;" class="dfinput"></td></tr>
									<tr><td>父菜单ID</td>
										<td>
									      	<select id="mparent_id" class="select">
											<option value="0">无</option>
											<c:forEach items="${treeMenuMap }" var="map" varStatus="s">
												<c:if test="${map.key > 0 && (menuSizeMap[map.key] <= 5)}">
												<option value="${map.key }">${bizMenuMap[map.key].name }</option>
												</c:if>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr><td>菜单类型</td>
										<td>
											<select id="mtype" onchange="mtypechange(this.value)" class="select">
												<option value="1">使用功能</option>
												<option value="2">使用链接</option>
												<option value="0">打开二级</option>
											</select>
											
										</td>
									</tr>
									<tr class="trval" style="display: none;">
										<td>参数设置</td>
										<td class="valkey" style="display: none;">
											<select id="valkey" onchange="valkeychange(this.value)" class="select">
												<option value="messageC" selected="selected">文本消息</option>
												<option value="message">图文消息</option>
												<c:forEach items="${bizServiceList}" var="bmap">
													<c:if test="${bmap.service ne 'attention' and bmap.service ne 'bind' and bmap.state eq 1}">
														<option value="${bmap.service }">${bmap.service }</option>
													</c:if>
												</c:forEach>
											</select>
											<input type=hidden id="originalVal">
											<input type=text id="subval" style="width:100px;" readonly="readonly"><input type=button id="selectBtn" class="btn blue org" value="选择图文消息" onclick="showSelectMsg('#subval')">
											<textarea id="textmsg" style="border:solid 1px #a7b5bc;width: 265px; height: 90px; max-width: 265px;"></textarea>
										</td>
										<td class="tdval valurl" style="display: none;">
											<input type=text id="valurl" style="width: 98%;" class="dfinput">
										</td>
									</tr>
									<tr><td>菜单状态</td>
										<td>
											<select id="mstate" class="select">
												<option value="1">正常使用</option>
												<option value="0">暂停使用</option>
											</select>
										</td>
									</tr>
									<tr><td>菜单顺序</td>
										<td>
									      	<select id="mshow_order" class="select">
												<c:forEach begin="1" end="5" var="d">
													<option value="${d }">${d }</option>
												</c:forEach>
											</select>
											
										</td></tr>
									<tr><td colspan="2" align="center"><input type=button class="btn pa_org org" value="保存配置" onclick="savemenu()"></td></tr>
								</table>
							</form>
						</div>
						
						</div>

					</div>
					<!-- /.widget-main -->
				</div>
				<!-- /.widget-body -->
			</div>
			
		</td>
	</tr>
	</table>    
    
    </div>
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      	<div class="tipinfo">
        <span><img src="${baseUrl }/assets/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
	<script type="text/javascript">
		$(document).ready(function($) {
			$("#type").val("${biz.type}");
		});
		
		function editmenu(istop,mid,pid,bid,name,type,val,state,showorder,titleId){
			
			if(pid==''||pid<0){pid=istop?0:pid;}
			if(bid==''){bid='1';}
			if(type==''){type=istop?0:1;}
			if(state==''){state=1;}
			
			if(!istop && pid<0){ // 一级菜单
				alert("请先创建一级菜单！");
			}else{
				$("#mid").val(mid);
				$("#mbid").val('${param.id}');
				$("#mname").val(name);
				$("#mtype").val(type);
				
				$("#subval").hide();
				if(type==1){
					$("#subval").val("");
					$("#originalVal").val(val);
					if(val.indexOf("messageA")>=0 || val.indexOf("messageB")>=0){
						$("#valkey").val("message");
						$("#subval").val(val);
						$("#subval").show();
						$("#selectBtn").show();
						$("#textmsg").hide().text("");
					}else if(val.indexOf("messageC")>=0){
						$("#valkey").val("messageC");
						$("#subval").val(val.replace("messageC",""));
						$("#subval").hide();
						$("#selectBtn").hide();
						$("#textmsg").show().text($(titleId).val());
					} else if(val == ''){
						$("#valkey").val(val);
						$("#selectBtn").hide();
						$("#textmsg").show().text("");
					} else {
						$("#valkey").val(val);
						$("#selectBtn").hide();
						$("#textmsg").hide().text("");
					}
				}else if(type==2){
					$("#valurl").val(val);
				}
				mtypechange(type); // 设置
				$("#mparent_id").val(pid);
				$("#mstate").val(state);
				$("#mshow_order").val(showorder);
				
				$("#editmenu").show();
			}
		}
		
		function mtypechange(val){
			if(val == 0){
				$(".trval").hide();
			}else if(val == 1){
				$(".valurl").hide();
				$(".trval,.valkey").show();
			}else if(val == 2){
				$(".valkey").hide();
				$(".trval,.valurl").show();
			}
		}
		
		function savemenu(){
				var id = $("#mid").val();
				var bid = $("#mbid").val();
				var parent_id = $("#mparent_id").val();
				var name = $("#mname").val();
				var type = $("#mtype").val();
				
				var val="", textmsg="";
				if(type == 1){
					val = $("#valkey").val();
					var msgid = $("#subval").val();
					if(val == "message"){
						if(msgid == ''){
							alert("请选择图文消息");
							return false;
						}
						val = msgid;
					}
					if(val == "messageC"){
						textmsg = $("#textmsg").val();
						if(textmsg == ''){
							alert("请输入文本消息内容");
							return false;
						}
						val += msgid;
					}
				}else if(type==2){
					val = $("#valurl").val();
				}
				var state = $("#mstate").val();
				var show_order = $("#mshow_order").val();
				if(name!=""){
					
					$.ajax({
					 	  type: 'POST',
					 	  url: baseUrl+'/admin/weixin/menu/saveMenu.html',       	
					 	  data: {id:id,bid:bid,parent_id:parent_id,name:name,type:type,val:val,state:state,show_order:show_order,textmsg:textmsg},
					 	  dataType: 'json', 
					 	  success: function(data){
					 		  
					 		 if(data.status == 'success'){
					 			 window.location.reload();
					 		 }
					 		 else{
					 			 alert(data.message);
					 		 }
					 	  }
					 	})
					
				}else{
					alert("请将信息填写完整");
				}
		}
		
		function synMenu2Weixin(id){
			if(confirm("请谨慎：此操作将会修改微信公众号后台设置，是否继续？")){
				
				$.ajax({
				 	  type: 'POST',
				 	  url: baseUrl+'/admin/weixin/menu/syn4weixin.html',       	
				 	  data: {bid:id},
				 	  dataType: 'json', 
				 	  success: function(data){
				 		alert(data.msg);
				 	}
				})
			}
		}
	</script>
    
</body>

</html>
