<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>upload的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/upload
		位置：/WEB-INF/views/test/upload.jsp 
		依赖：（shim）"webuploader": [ "css!lib/webuploader/css/webuploader.css" ]
	*/
	require( [ "webuploader", "jquery" ], function ( webuploader, $ ) {
		
		$( document ).ready( function() {
			
			var uploaderContainerId,
		        uploaderOptions
		        ;
			uploaderContainerId = "uploaderContainer";
			uploaderOptions = {
			    // swf文件路径
			    swf: '/Uploader.swf',
			
			    // 文件接收服务端。
			    server: '/Upload'
			};
			webuploader.pku.fileUpload( uploaderContainerId, uploaderOptions );
		} );
	} );
	
	</script>
</head>
<body> 
<div id="uploaderContainer"></div>
</body>
</html>