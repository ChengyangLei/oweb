<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>jQuery的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/jquery
		位置：/WEB-INF/views/test/jquery.jsp 
	*/
	require( [ "jquery" ], function () {
		console.info( "jQuery's version: ", jq( {} ).jquery ); //=> jQuery's version:  1.11.3
		// jquery.js 引入完毕之后，会执行这个回调函数，同时全局变量jQuery也会传递给参数jq
	} );
	
	</script>
</head>
<body> </body>
</html>