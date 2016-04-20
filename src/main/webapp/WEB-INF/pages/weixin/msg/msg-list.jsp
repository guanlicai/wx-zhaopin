<%@ include file="/common/common.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/appmsg.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/common.js"></script>
</head>
<body>

	<link href="${baseUrl}/statics/assets/css/appmsg.css" rel="stylesheet" type="text/css" />

	<div class="page-content">
		<div class="page-content-area">
			<jx:bodyHeader title="图文消息"/>
			
			<div class="row">

				<div class="container">
		<div class="containerBox">
			<div class="boxHeader">
				<h4>介绍页</h4>
			</div>
			<div class="content">
				<!-- <h3 class="page-sub-hd">图文列表(共 ${fn:length(singleMsgList)}个单图文 + ${fn:length(mulitMsgList)}个多图文)</h3> -->
				<div class="group page-nav">
					<div class="pagination"></div>
					<div class="clr"></div>
				</div>
				<div class="page-bd">
					<div class="tj msg-list" style="padding-left:10px;padding-top:20px;">
				   		<!-- 偶数内容 -->
				    	<div id="first_col" class="b-dib vt msg-col">
							<!-- <div id="addAppmsg" class="tc add-access">       
								<a href="${baseUrl}/admin/weixin/msg/single/edit.html" class="dib vm add-btn">+单图文消息</a>         
								<a href="${baseUrl}/admin/weixin/msg/multi/edit.html" class="dib vm add-btn multi-access">+多图文消息</a>
					        </div> -->
					        	<c:forEach items="${singleMsgList }" var="single" varStatus="vs">
					        	<div class="msg-item-wrapper" id="dsc0_91">
					   				<div class="msg-item" itemid="91">
					   					<h4 class="msg-t"><a href="javascript:;" class="i-title">${single.title }</a></h4>           
							   			<p class="msg-meta"><span class="msg-date">
							   				<fmt:formatDate value="${single.updateTime }" pattern="yyyy-MM-dd" />
							   			</span></p>
										<div class="cover">
											<img class="i-img" src="${baseServerUrl }${single.img }" style="width: 440px;height: 180px;">
										</div>
										<p class="msg-text">${single.title }</p>         
									</div>		   								   
									<div class="msg-opr">
										<ul class="f0 msg-opr-list">
											<li class="b-dib opr-item"><a data-mul="false" class="block tc opr-btn edit-btn" style="width:100%;" href="${baseUrl }/admin/weixin/msg/single/edit.html?id=${single.id }"><span class="th vm dib opr-icon edit-icon">编辑</span></a></li>           
											<!-- <li class="b-dib opr-item"><a class="block tc opr-btn del-btn" href="javascript:delMsg(${single.id }, 1)" ><span class="th vm dib opr-icon del-icon">删除</span></a></li> -->         
										</ul>      
									</div>           
								</div>
					        	</c:forEach>
				   		</div>
				   		
				   		<!-- 奇数内容 -->
				   		<div id="second_col" class="b-dib vt msg-col" style="padding-left:30px;display:none;">
				   			
				   			<c:forEach items="${mulitMsgList }" var="mList" varStatus="vs">
				   			
				   			<div class="msg-item-wrapper" id="dsc1_25">
								<div class="msg-item multi-msg" itemid="25">
								
									<c:forEach items="${mList }" var="msg" varStatus="vs">
									<c:set value="${msg.multiId }" var="multiId"/>
									<c:if test="${vs.index eq 0 }">
									<div class="appmsgItem">
							   			<h4 class="msg-t"><a href="javascript:;" class="i-title"></a></h4>           
							   			<p class="msg-meta">
							   				<span class="msg-date">${msg.updateTime }</span>
							   			</p>
										<div class="cover">
											<img class="i-img" src="${baseServerUrl }/yesm/attachs/msg/${msg.img }" style="">
										</div>
										<p class="msg-text">${msg.title }</p>         
									</div>
									</c:if>
									<c:if test="${vs.index gt 0 }">
									<div class="rel sub-msg-item appmsgItem">              
										<span class="thumb">                 
											<img class="i-img" src="${baseServerUrl }/yesm/attachs/msg/${msg.img }" style="">
										</span>
										<h4 class="msg-t">        
											<a href="javascript:;" target="_blank" class="i-title">${msg.title }</a>               
										</h4>       
									</div>
									</c:if>
									</c:forEach>
								</div>   
								<div class="msg-opr">
									<ul class="f0 msg-opr-list">
										<li class="b-dib opr-item"><a data-mul="true" class="block tc opr-btn edit-btn" href="${baseUrl }/wp/weichat/msg/multi/edit.html?resourceid=${multiId }"><span class="th vm dib opr-icon edit-icon">编${multiId }辑</span></a></li>           
										<li class="b-dib opr-item"><a class="block tc opr-btn del-btn" href="javascript:delMsg(${multiId }, 2)"><span class="th vm dib opr-icon del-icon">删除</span></a></li>         
									</ul>
								</div>
							</div>
			   				</c:forEach>
				   			
				   			
						</div>
				   	</div>
				</div>
			</div>
		   	<div class="clr"></div>
   		</div>
	</div>							

			</div>
		</div>
		<!-- end table -->
	</div>
	
	<script type="text/javascript">
			$(document).ready(function($) {				
				
				 initDataTable();//初始化数据表格
						
			});
			
			
			function delMsg(msgId , type){
				$.ajax({
				 	  type: 'POST',
				 	  url: baseUrl+'/admin/weixin/msg/Multi/del.html',       	
				 	  data: {msgId:msgId, type:type },
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
			}
			
		</script>
</body>
</html>