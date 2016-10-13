<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>select的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/select
		位置：/WEB-INF/views/test/select.jsp 
		依赖：（shim）"select2": [ "jquery", "xDomainRequest"]
	*/
	require( [ "select2" ], function () {
		// "select2" 依赖 "jquery"，"jquery"会优先"select2"载入
		jQuery( document ).ready( function( $ ) {
			jQuery("#select2_2").select2({
			    data:[
			        { id: 10, text: '张三', spell: "zs" },
			        { id: 1, text: '李四', spell: "ls" },
			        { id: 2, text: '王五', spell: "ww" },
			        { id: 3, text: '赵六', spell: "zl" },
			        { id: 4, text: '钱七', spell: "qq" }
			    ],
			    placeholder: "请选择",
			    allowClear: true
			});
		} );
	} );
	
	</script>
</head>
<body> 
<select class="form-control" id="select2_2" style="width: 300px;">
    <option><!-- 显示占位符的内容 --></option>
</select>
</body>
</html>