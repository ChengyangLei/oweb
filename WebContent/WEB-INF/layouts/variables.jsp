<%-- 
	<%@ page contentType="text/html;charset=UTF-8"%> 
	该指令虽然注释了，但在Eclipse中依旧生效，它会使该文件以UTF-8的格式存储在磁盘上
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	用途：
		1. 公共的JavaScript全局变量
		2. 公共的JSP变量
	使用：	
		(静态导入) 
		<%@include file="/WEB-INF/layouts/variables.jsp" %> 
	位置：	
		include语句应放置在所有<meta>标签之后，
		因为 <script> 标签放置在<meta>标签之前 会导致一些问题，比如“X-UA-Compatible”失效
	说明：
		1. ${ ctx } : context
		2. ${ version }
		   * 静态文件的版本控制
		   * 格式：v0.年年年年月月日日_当天第几次
--%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="version" value="v0.20160922_1" />

<script>
	<%-- 全局变量 --%>
	var CONTEXT_PATH = "${ ctx }";
	var CTX = CONTEXT_PATH;
</script>
