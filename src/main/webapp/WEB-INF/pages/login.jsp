<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>得力派管理后台</title>
<link rel="stylesheet" type="text/css" href="${baseUrl }/assets/css/style.css" />
<script type="text/javascript" src="${baseUrl }/assets/js/jquery.js"></script>
<script type="text/javascript" src="${baseUrl }/assets/js/cloud.js"></script>

<script language="javascript">
$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    	$('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});

function login(){
	var username = $("#username").val();
	var userpwd = $("#userpwd").val();
	
	if(username == ""){
		alert("用户名不能为空");
		return false;
	}
	
	if(userpwd == ""){
		alert("密码不能为空");
		return false;
	}
	
	$("#loginForm").submit();
}
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(${baseUrl}/assets/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
<form id="loginForm" action="${baseUrl}/admin/auth/login.html" method="post">
<div id="mainBody">
  <div id="cloud1" class="cloud"></div>
  <div id="cloud2" class="cloud"></div>
</div>  

<div class="logintop">    
    <span>欢迎使用得力派管理平台</span>    
   	<ul>
   		<li><a href="#">回首页</a></li>
   		<li><a href="#">帮助</a></li>
   		<li><a href="#">关于</a></li>
   	</ul>    
</div>
<div class="loginbody">
	<span class="systemlogo"></span> 
	<div class="loginbox">
	    <ul>
	    	<li><input name="username" id="username" type="text" class="loginuser" value="${username }" onclick="JavaScript:this.value=''"/></li>
	    	<li><input name="userpwd" id="userpwd" type="password" class="loginpwd" value="" onclick="JavaScript:this.value=''"/></li>
	    	<li>
	    		<input type="button" class="loginbtn" value="登录"  onclick="javascript:login()"  />
	    		<label><input name="" type="checkbox" value="" checked="checked" />记住密码</label>
	    		<label style="color:red;">${msg }</label>
	    	</li>
	    </ul>
	</div>
</div>

<div class="loginbm">版权所有：        &nbsp;&nbsp;&nbsp;&nbsp;技术支持:56982107</div>
</form>
</body>

</html>
