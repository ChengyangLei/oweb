<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>grid的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/grid
		位置：/WEB-INF/views/test/grid.jsp 
		依赖：（shim）"bootgrid": [ "css!lib/bootgrid/css/jquery.bootgrid.css" , "bootstrap", "colresizable"]
	*/
	require( [ "bootgrid" ], function () {
		// "bootstrap" 依赖 "jquery"，"jquery"会优先"bootstrap"载入
		var $ = jQuery;
		$( document ).ready(function(){
		});
	} );
	
	</script>
</head>
<body> 
</body>
</html>