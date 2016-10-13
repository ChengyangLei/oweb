<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>datepicker的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/datepicker
		位置：/WEB-INF/views/test/datepicker.jsp 
		依赖：（shim）"datepicker": [ "jquery" ]
	*/
	require( [ "datepicker" ], function () {
		// "datepicker" 依赖 "jquery"，"jquery"会优先"datepicker"载入
	} );
	
	</script>
</head>
<body> 
<input  data-provide="datepicker" />
</body>
</html>