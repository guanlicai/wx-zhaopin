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
      <li><a href="#">文档管理</a></li>
    </ul>
</div>

<!-- 按钮信息 -->
<div class="rightinfo">

  <table class="imgtable">
	<thead>
      <tr>
    	<th style="text-align:center;">文件名称</th>
    	<th style="text-align:center;">文件路径</th>
    	<th style="text-align:center;">修改时间</th>
      </tr>
    </thead>
	<tbody>
	  <c:forEach items="${files}" var="file" varStatus="s">
	  <tr style="text-align:center;">
    	<td>
    	<%-- <c:if test="${file.directory}"><a style="color: blue;" href="${baseUrl}/admin/base/file/item?path=${file.absolutePath}">${file.absolutePath}</a></c:if>
    	 <c:if test="${file.directory}">${file.name}</c:if>--%>
    	 ${file.name}
    	</td>
	    <td>${file.absoluteFile}</td>
	    <td>${file.lastModified}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
    
    
    
    </div>
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${baseURL }/assets/images/ticon.png" /></span>
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
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>

</html>
