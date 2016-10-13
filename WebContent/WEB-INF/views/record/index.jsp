<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="${ctx}/static/dev/apps/framework/css/main.css" />
<title>Record index</title>
<style>
	.box {
		padding: 20px;
	}
</style>
<script>
	require(["jquery","fixrecord"], function( $, fixrecord ) {
		fixrecord.init();
	});
</script>
</head>
<body>
	
	
	<div class="fix-record" id="fixrecord">
	
		<button type="button" class="btn btn-success btn-add-record"><i class="fa fa-plus"></i> 新增</button>
		
        <c:forEach var="recordMap" items="${ recordList }">
        
        	<div class="fix-record-item">
        	
        	<c:forEach var="mapItem" items="${recordMap}">
        		
        		<%-- recordList --%>
        		<c:if test="${mapItem.key == 'recordList' }">
        			<h3 class="header"><i class="${mapItem.value.icon}"></i> ${mapItem.value.text}</h3>
        		</c:if>
        		
        		<%-- recordItemList --%>
        		<c:if test="${mapItem.key == 'recordItemList' }">
        		
	        		<c:forEach var="recordItem" items="${mapItem.value}">
	        			
	        			<p class="item-detail"><i class="${ recordItem.icon }"></i><span class="${ recordItem.labelIcon }">${ recordItem.labelText }</span>
                			${ recordItem.text }
            			</p>
	        			
	        		</c:forEach>
        		 		
        		</c:if>
        	   
			</c:forEach> 
			
        	</div>
        </c:forEach>
        
        
        
    </div>
    
</div>
</body>
</html>