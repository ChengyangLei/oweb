<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>modal的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/modal
		位置：/WEB-INF/views/test/modal.jsp 
		依赖：（shim）"bootstrap": [ "jquery" ]
	*/
	require( [ "bootstrap" ], function () {
		// "bootstrap" 依赖 "jquery"，"jquery"会优先"bootstrap"载入
		console.info( jQuery({}).jquery ) ;
	} );
	
	</script>
</head>
<body> 
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-1">触发</button>
<div class="modal fade" id="modal-1">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <p>Modal body</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>