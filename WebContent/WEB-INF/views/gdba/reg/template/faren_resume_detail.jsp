<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-detail" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveFarenResume"
	  data-delete-url="${ctx}/gdba/reg/faren/resume/delete?id=${gdbaFarenResume.resumeId}"
      data-detail-url="/gdba/reg/template/faren/resume?type=detail&id=${gdbaFarenResume.resumeId}"
      data-edit-url="/gdba/reg/template/faren/resume?type=edit&id=${gdbaFarenResume.resumeId}">

	
	<div class="btn-tools btn-group btn-group-sm">
        <button type="button" class="btn btn-warning btn-edit" title="编辑" data-toggle="tooltip"><i class="fa fa-pencil"></i></button>
        <button type="button" class="btn btn-danger btn-resume-delete" title="删除" data-toggle="tooltip"><i class="fa fa-trash"></i></button>
    </div>
	<div class="form-group">
        <label class="col-xs-3 control-label">${ gdbaFarenResume.start } 到 ${ gdbaFarenResume.end }</label>
        <div class="col-xs-9">${ gdbaFarenResume.gsmc }</div>
    </div>
    <div class="form-group">
        <label class="col-xs-3 control-label">职位类别</label>
        <div class="col-xs-3"><pku:dicValue dicName="DIC_JOB_TYPE" itemCode="${ gdbaFarenResume.zwlb }" /></div>
        <label class="col-xs-3 control-label">职位名称</label>
        <div class="col-xs-3">${ gdbaFarenResume.zwmc }</div>
    </div>
</form>