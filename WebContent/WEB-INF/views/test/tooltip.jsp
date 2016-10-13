<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>tooltip的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/tooltip
		位置：/WEB-INF/views/test/tooltip.jsp 
		依赖：（shim）"bootstrap": [ "jquery" ]
	*/
	require( [ "bootstrap" ], function () {
		// "bootstrap" 依赖 "jquery"，"jquery"会优先"bootstrap"载入
		jQuery( document ).ready( function ( $ ) {
			$('[data-toggle="tooltip"]').tooltip()
		} );
	} );
	
	</script>
</head>
<body> 
<button type="button" class="btn btn-default"
        data-toggle="tooltip"
        data-placement="bottom"
        data-container="body"
        data-theme="tooltip-warning-dark"
        title="Tooltip on left">5. Tooltip on bottom</button>
</body>
</html>