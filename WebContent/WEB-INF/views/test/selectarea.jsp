<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>select-area的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/selectarea
		位置：/WEB-INF/views/test/selectarea.jsp 
		依赖：（shim）"select-area": ["css!lib/select-area/css/select-area.css", "select-area-data", "jquery" ]
	*/
	require( [ "select-area" ], function () {
		// "select-area" 依赖 "jquery"，"jquery"会优先"select-area"载入
		jQuery( document ).ready( function( $ ) {
			jQuery( '[data-pku-widget="select-area"]' ).selectArea();
		} );
	} );
	
	</script>
</head>
<body> 

<input type="text" name="name" data-pku-widget="select-area"/>

</body>
</html>