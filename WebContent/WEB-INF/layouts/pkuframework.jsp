<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<%@include file="/WEB-INF/layouts/variables.jsp" %>
	
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lte IE 8]>
    <script src="${ctx}/static/dev/modules/lib/ie/respond.js"></script>
    <script src="${ctx}/static/dev/modules/lib/ie/html5shiv.js"></script>
    <script src="${ctx}/static/dev/modules/lib/ie/es5-shim.js"></script>
	<![endif]-->
	
	<!-- 从被装饰页面获取title标签内容,并设置默认值-->
	<title><decorator:title default="此页面被sitemesh装饰" /></title>
	
	<script>
        window.onload = function () {
        	removeOverlay();
        };
        window.setTimeout( function () {
        	removeOverlay();
        }, 8000 );
        function removeOverlay() {
            document.getElementById( "bodyLoadingOverlay" ).style.display = "none";
            document.body.setAttribute( "class", "" );
        }
    </script>
	
	<link rel="stylesheet" href="${ctx}/static/dev/modules/ui/css/pku.css?VERSION=${version}"/>
    <script data-main="${ctx}/static/dev/modules/" src="${ctx}/static/dev/modules/require.js"></script>
    <script >
        var VERSION,
            DEV_MODE
            ;
        DEV_MODE = false;
        VERSION = DEV_MODE ? (new Date()).getTime() : "${version}";
        require.config( {
            urlArgs: "VERSION=" + VERSION,
            paths: {
                "jquery": "jquery/jquery-1.11.3",
                "xDomainRequest": "jquery/jQuery.XDomainRequest",
                "ajaxQueue": "jquery/jQuery.ajaxQueue",
                "doT": "utils/doT",
                "draggable": "utils/draggable",
                "bootstrap": "lib/bootstrap/js/bootstrap",

                "datepicker": "lib/datepicker/js/bootstrap-datepicker-zh.fix",

                "select2": "lib/select2/js/select2.full.fix",

                "echarts": "lib/echart/echarts.min",
                "echartsTheme": "lib/echart/theme/macarons",
                "echartsChinaMap": "lib/echart/map/china",

                "formvalidation": "lib/formvalidate/js/formValidation.fix",
                "formvalidationBs": "lib/formvalidate/js/framework/bootstrap.fix",
                "formvalidationI18N": "lib/formvalidate/js/language/zh_CN",

                "webuploader": "lib/webuploader/js/webuploader.fix",

                "bootgrid": "lib/bootgrid/js/jquery.bootgrid.fix",
                "colresizable": "lib/colresizable/colResizable-1.6",

                "select-area": "lib/select-area/select-area",
                "select-area-data": "lib/select-area/select-area-data",

                "fixrecord": "lib/custom/fixrecord",

                // 代码美化
                "code-pretty": "lib/pretty/prettify.min"
            },
            map: {
                '*': {
                    'css': 'utils/css/css',
                    'text': 'utils/text'
                }
            },
            shim : {
                "datepicker": [ "jquery"],
                "select2": [ "jquery", "xDomainRequest"],
                "bootstrap": [ "jquery"],
                "formvalidation": [ "jquery", "bootstrap" ],
                "formvalidationBs": [ "formvalidation" ],
                "formvalidationI18N": [ "formvalidation", "formvalidationBs" ],
                "webuploader": [ "css!lib/webuploader/css/webuploader.css" ],
                "colresizable": [ "jquery" ],
                "bootgrid": [ "css!lib/bootgrid/css/jquery.bootgrid.css" , "bootstrap", "colresizable"],
                "select-area": ["css!lib/select-area/css/select-area.css", "select-area-data", "jquery" ],
                "code-pretty": [ "css!lib/pretty/prettify.css" ]
            },
            // 超时
            waitSeconds: 150
        } );
    </script>
	
	<!-- 从被装饰页面获取head标签内容 -->
	<decorator:head />

</head>

<body class="modal-open">
	<div class="overlay" id="bodyLoadingOverlay">
	    <i class="fa fa-spin fa-spinner"></i>
	</div>
	<!-- 从被装饰页面获取body标签内容 -->
	<decorator:body />
</body>
</html>
