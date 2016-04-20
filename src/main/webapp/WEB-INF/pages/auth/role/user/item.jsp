<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="baseURL" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>权限管理</title>
</head>
<frameset cols="200,*" frameborder="no" border="0" framespacing="0">
    <frame src="${baseURL}/admin/auth/role/tree.html?type=user" name="treeLeftFrame" scrolling="no" noresize="noresize" id="treeRightFrame" title="leftFrame" />
    <frame src="${baseURL}/admin/auth/role/user/list.html" name="treeRightFrame" id="treeRightFrame" title="rightFrame" />
  </frameset>
<noframes><body>
</body></noframes>
</html>