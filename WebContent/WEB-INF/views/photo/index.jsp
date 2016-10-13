<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/static/dev/apps/framework/css/eg_photo.css?VERSION=${version}"/>
<title>图片上传</title>
<script>

require( ["jquery", "webuploader", "bootstrap" ], function ( $, WebUploader ) {
	
	// 如果对不可见元素进行 webloader 的初始化，会失败
    $( document ).ready( function() {
    	
        $( ".nav-tabs a" ).eq(1).one("click", function() {
	        var uploaderContainerId,
	            uploaderOptions,
	            webloaderInstance
	            ;
	        uploaderContainerId = "imageUploaderContainer";
	        uploaderOptions = {
	            // swf文件路径
	            swf: '${ctx}/static/dev/modules/lib/webuploader/Uploader.swf',
	
	            // 文件接收服务端。
	            server: '/photo/upload',
	            // 自动上传。
	            auto: false,
	            fileSingleSizeLimit: 1024 * 800, // 单个问价大小限制，800 KB
	            // 只允许选择文件，可选。
	            accept: {
	                title: 'Images',
	                extensions: 'jpg', // 只接受 jpg 类型
	                mimeTypes: 'image/*'
	            },
	            // 指定Drag And Drop拖拽的容器
	            dnd: '#' + uploaderContainerId + ' .uploader-filelist',
	            // 通过粘贴来添加截屏的图片
	            paste: document.body
	        };
	        webloaderInstance = WebUploader.pku.imageUpload( uploaderContainerId, uploaderOptions );
	        
	        // 处理图片添加失败的处理
	        webloaderInstance.on( 'error', function ( type ) {
	        	switch ( type ) {
	        		case "F_EXCEED_SIZE": { // 尝试给uploader添加的文件大小超出这个值时
	        			alert("单个文件大小不符合要求：不超过800KB。");
	        			break;
	        		} 
	        		case "Q_TYPE_DENIED": { // 当文件类型不满足时触发
	        			alert( "文件类型不符合要求：仅限 jpg 类型。" );
	        			break;
	        		}
	        		case "Q_EXCEED_NUM_LIMIT": { // 在设置了fileNumLimit且尝试给uploader添加的文件数量超出这个值
	        			break;
	        		} 
	        		case "Q_EXCEED_SIZE_LIMIT": { // 尝试给uploader添加的文件总大小超出这个值时
	        			break;
	        		} 
	        		default: {
	        			alert( "错误类型：" + type );
	        		}
	        	}
	        } );
        });
        
        //photoRefresh
        $("#photoRefresh").on("click", function () {
        	var $photoList = $( ".photo-list" );
        	$.getJSON("/photo/dataList", function( data ) {
        		var currentPhotoIdCollection
        		;
        		currentPhotoIdCollection = {};
        		// 1. 获取页面上所有的 photoId，放入集合currentPhotoIdCollection
        		$( ".photo-item" ).each( function () {
        			var $this = $( this );
        			currentPhotoIdCollection[ $this.attr( "data-photo-id" ) ] = true;
        		} ) ;
        		// 2. 遍历 data，将不存在于 currentPhotoIdCollection 的photo，插入到图片列表末尾 
        		$.each( data, function () {
        			var html;
        			if ( currentPhotoIdCollection[ this.photoId ] ) {
        				return;
        			} 
        			html = '<div class="photo-item" data-photo-id="'+this.photoId+'">\
			        			<div class="photo-wrap">\
			        		    <img src="${ctx}/photo/getPhoto?photoId='+this.photoId+'" alt=""/>\
			        		</div>\
			        		    <div class="photo-name">'+this.name+'</div>\
			        		</div>';
        			$photoList.append( html )
        		} );
			});
        });
        
    } );
} );
</script>
</head>
<body>


    <div class="nav-tabs-custom tab-info">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#myPhoto" data-toggle="tab">我的图片</a></li>
            <li><a href="#uploadPhoto" data-toggle="tab">图片上传</a></li>
            <li class="pull-right"><button id="photoRefresh" type="button" class="btn btn-thick btn-default"><i class="fa fa-refresh"></i> 刷新</button></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="myPhoto">
                <div class="photo-list clearfix">
                <%-- 
                    <div class="photo-item">
                        <div class="photo-wrap">
                            <img src="${ctx}/static/dev/apps/framework/images/bg3.png" alt=""/>
                        </div>
                        <div class="photo-name">图片名称图片名称图片名称图片名称</div>
                    </div>
                 --%>
	                 <c:forEach var="photo" items="${photoList}">
						<div class="photo-item" data-photo-id="${photo.photoId}">
							<div class="photo-wrap">
							    <img src="${ctx}/photo/getPhoto?photoId=${photo.photoId}" alt=""/>
							</div>
						     <div class="photo-name">${photo.name}</div>
						</div>
	                 </c:forEach>    
                </div>
            </div>
            <div class="tab-pane" id="uploadPhoto">
            	<p class="text-muted"><i class="fa fa-circle"></i> 图片要求：1. 图片格式仅限 jpg；2. 单张图片大小不能超过 800KB。</p>
                <div id="imageUploaderContainer"></div>
            </div>
        </div>
    </div>

</body>
</html>