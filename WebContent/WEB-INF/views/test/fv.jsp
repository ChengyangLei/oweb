<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>formvalidation的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/fv
		位置：/WEB-INF/views/test/fv.jsp 
		依赖：（shim）"formvalidation": [ "jquery", "bootstrap" ],
			        "formvalidationBs": [ "formvalidation" ],
			        "formvalidationI18N": [ "formvalidation", "formvalidationBs" ],
	*/
	require( [ "formvalidationI18N" ], function () {
		// "formvalidation" 依赖 "jquery"，"jquery"会优先"formvalidation"载入
		var $ = jQuery;
		$( document ).ready(function(){
			$( "#containerForm_2" ).formValidation();
		});
	} );
	
	</script>
</head>
<body> 
<form id="containerForm_2" class="form-horizontal"
      data-fv-live="disabled">
    <div class="form-group" style="padding-top: 10px">
        <label class="col-xs-3 control-label">姓名</label>
        <div class="col-xs-9">
            <input type="text" class="form-control" name="name"
                   placeholder='data-fv-live="disabled"'
                   data-fv-notempty="true"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-3 col-xs-offset-3">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
</form>
</body>
</html>