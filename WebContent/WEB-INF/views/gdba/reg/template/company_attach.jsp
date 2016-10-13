<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<div class="photoList">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#tab_1_1" data-toggle="tab">注册资本验资证明</a></li>
        <li role="presentation"><a href="#tab_1_2" data-toggle="tab">企业名称</a></li>
        <li role="presentation"><a href="#tab_1_3" data-toggle="tab">公司营业执照</a></li>
        <li role="presentation"><a href="#tab_1_4" data-toggle="tab">设立申请书</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="tab_1_1">

            <div class="nav-tabs-custom tab-info">
                <p class="text-muted"><i class="fa fa-info-circle"></i>（注册资本验资证明）图片要求：1. 图片格式仅限 jpg；2. 单张图片大小不能超过 800KB。</p>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#myPhoto_1_1" data-toggle="tab">我的图片</a></li>
                    <li><a class="tab-upload" href="#uploadPhoto_1_1" data-toggle="tab">图片上传</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active" id="myPhoto_1_1">
                        <div class="photo-list clearfix">
                            <c:forEach var="photo" items="${companyPhotoList01}">
                                <div class="photo-item" data-photo-id="${photo.photoId}">
                                    <div class="photo-wrap">
                                        <img src="${ctx}/photo/getPhoto?photoId=${photo.photoId}" alt=""/>
                                    </div>
                                     <div class="photo-name">${photo.name}</div>
                                </div>
                             </c:forEach>    
                        </div>
                    </div>
                    <div class="tab-pane active" id="uploadPhoto_1_1">
                        <div class="imageUploaderContainer" data-upload-url="${ctx}/photo/upload?category=01"></div>
                    </div>
                </div>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="tab_1_2">
            <div class="nav-tabs-custom tab-info">
                <p class="text-muted"><i class="fa fa-info-circle"></i>（企业名称）图片要求：1. 图片格式仅限 jpg；2. 单张图片大小不能超过 800KB。</p>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#myPhoto_1_2" data-toggle="tab">我的图片</a></li>
                    <li><a class="tab-upload" href="#uploadPhoto_1_2" data-toggle="tab">图片上传</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active" id="myPhoto_1_2">
                        <div class="photo-list clearfix">
                            <c:forEach var="photo" items="${companyPhotoList02}">
                                <div class="photo-item" data-photo-id="${photo.photoId}">
                                    <div class="photo-wrap">
                                        <img src="${ctx}/photo/getPhoto?photoId=${photo.photoId}" alt=""/>
                                    </div>
                                     <div class="photo-name">${photo.name}</div>
                                </div>
                             </c:forEach> 
                        </div>
                    </div>
                    <div class="tab-pane active" id="uploadPhoto_1_2">
                        <div class="imageUploaderContainer" data-upload-url="${ctx}/photo/upload?category=02"></div>
                    </div>
                </div>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="tab_1_3">
            <div class="nav-tabs-custom tab-info">
                <p class="text-muted"><i class="fa fa-info-circle"></i> （公司营业执照）图片要求：1. 图片格式仅限 jpg；2. 单张图片大小不能超过 800KB。</p>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#myPhoto_1_3" data-toggle="tab">我的图片</a></li>
                    <li><a class="tab-upload" href="#uploadPhoto_1_3" data-toggle="tab">图片上传</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active" id="myPhoto_1_3">
                        <div class="photo-list clearfix">
                            <c:forEach var="photo" items="${companyPhotoList03}">
                                <div class="photo-item" data-photo-id="${photo.photoId}">
                                    <div class="photo-wrap">
                                        <img src="${ctx}/photo/getPhoto?photoId=${photo.photoId}" alt=""/>
                                    </div>
                                     <div class="photo-name">${photo.name}</div>
                                </div>
                             </c:forEach> 
                        </div>
                    </div>
                    <div class="tab-pane active" id="uploadPhoto_1_3">
                        <div class="imageUploaderContainer" data-upload-url="${ctx}/photo/upload?category=03"></div>
                    </div>
                </div>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="tab_1_4">
            <div class="nav-tabs-custom tab-info">
                <p class="text-muted"><i class="fa fa-info-circle"></i>（设立申请书）图片要求：1. 图片格式仅限 jpg；2. 单张图片大小不能超过 800KB。</p>
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#myPhoto_1_4" data-toggle="tab">我的图片</a></li>
                    <li><a class="tab-upload" href="#uploadPhoto_1_4" data-toggle="tab">图片上传</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active" id="myPhoto_1_4">
                        <div class="photo-list clearfix">
                            <c:forEach var="photo" items="${companyPhotoList04}">
                                <div class="photo-item" data-photo-id="${photo.photoId}">
                                    <div class="photo-wrap">
                                        <img src="${ctx}/photo/getPhoto?photoId=${photo.photoId}" alt=""/>
                                    </div>
                                     <div class="photo-name">${photo.name}</div>
                                </div>
                             </c:forEach> 
                        </div>
                    </div>
                    <div class="tab-pane active" id="uploadPhoto_1_4">
                        <div class="imageUploaderContainer" data-upload-url="${ctx}/photo/upload?category=04"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>