<%
response.addHeader("Cache-Control", "no-cache, no-store, max-age=0");   
response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
response.setHeader("P3P","CP=CAO PSA OUR");
response.addDateHeader("Last-Modified",new java.util.Date().getTime()-10000);
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setHeader("Cache-Control", "private, max-age=0");
response.setDateHeader ("Expires", -1);
pageContext.setAttribute("queryString", request.getQueryString());
 %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="jsfn" uri="http://js.com/tags/function" %>
<%@ taglib prefix="custom" uri="/custom" %>

<c:set var="baseUrl" value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<c:set var="baseServerUrl"  value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort}"/>
<c:set var="baseLoginUrl" value="${pageContext.request.scheme}s://${pageContext.request.serverName }:8443${pageContext.request.contextPath}"/>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<script type="text/javascript">
	var baseUrl = "${baseUrl}";
	var baseServerUrl = "${baseServerUrl}";
	
	function turnPage(pageNo) {
		if (typeof search == 'function') {
			search(pageNo);
		} else {
			var href = location.href;
			
			href = href.replace(/(\?)?(&)+pageNo=(-)?(\d)+/g, "");
			href = href.indexOf("?") != -1 ? href + "&pageNo=" + pageNo : href + "?pageNo=" + pageNo;
			
			href = href.replace(/(\?)?(&)+currPage=(-)?(\d)+/g, "");
			href = href.indexOf("?") != -1 ? href + "&currPage=" + pageNo : href + "?currPage=" + pageNo;
			
			alert(href);
			
			location.href = href;
		}
	}
</script>
