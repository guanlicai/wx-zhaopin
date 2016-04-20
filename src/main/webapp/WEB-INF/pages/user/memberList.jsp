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
</head>


<body>
<!-- 位置信息 -->
<div class="place">
  <span>位置：</span>
    <ul class="placeul">
      <li><a href="#">首页</a></li>
      <li><a href="#">系统管理</a></li>
      <li><a href="#">下级会员</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">
  <table class="imgtable">
	<thead>
      <tr>
      	<th width="60px;" style="text-align:center;">级别</th>
    	<th width="200px;" style="text-align:center;">人数</th>
    	<th width="150px;" style="text-align:center;">消费总额</th>
    	<th width="150px;" style="text-align:center;">贡献佣金</th>
      </tr>
    </thead>
    
	<tbody>
	  <tr style="text-align:center;">
    	<td>1级</td>
    	<td><a href="${baseUrl}/admin/user/submember.html?userId=${user.id}&bid=${user.bid}&findLevel=1">${empty memberMap["1"]["number"] ? 0 : memberMap["1"]["number"]}</a></td>
    	<td>${empty memberMap["1"]["consumeTotal"] ? 0 : memberMap["1"]["consumeTotal"]}</td>
    	<td>${empty memberMap["1"]["scaleTotal"] ? 0 : memberMap["1"]["scaleTotal"]}</td>
      </tr>
	  
	  
	  <tr style="text-align:center;">
    	<td>2级</td>
    	<td><a href="${baseUrl}/admin/user/submember.html?userId=${user.id}&bid=${user.bid}&findLevel=2">${empty memberMap["2"]["number"] ? 0 : memberMap["2"]["number"]}</a></td>
    	<td>${empty memberMap["2"]["consumeTotal"] ? 0 : memberMap["2"]["consumeTotal"]}</td>
    	<td>${empty memberMap["2"]["scaleTotal"] ? 0 : memberMap["2"]["scaleTotal"]}</td>
      </tr>
	  
	  
	  <tr style="text-align:center;">
    	<td>3级</td>
    	<td><a href="${baseUrl}/admin/user/submember.html?userId=${user.id}&bid=${user.bid}&findLevel=3">${empty memberMap["3"]["number"] ? 0 : memberMap["3"]["number"]}</a></td>
    	<td>${empty memberMap["3"]["consumeTotal"] ? 0 : memberMap["3"]["consumeTotal"]}</td>
    	<td>${empty memberMap["3"]["scaleTotal"] ? 0 : memberMap["3"]["scaleTotal"]}</td>
      </tr>
	  
    </tbody>
  </table>
</div>

</body>

</html>
