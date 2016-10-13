<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<% int random = (new java.util.Random()).nextInt(Integer.MAX_VALUE); %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-edit" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveFarenResume"
      data-detail-url="/gdba/reg/template/faren/resume?type=detail&id=${gdbaFarenResume.resumeId}"
      data-edit-url="/gdba/reg/template/faren/resume?type=edit&id=${gdbaFarenResume.resumeId}">

	<input type="hidden" name="resumeId" value="${ gdbaFarenResume.resumeId }"/>
	<input type="hidden" name="farenId" value="${ gdbaFarenResume.farenId }"/>
	
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 起止时间</label>
        <div class="col-xs-5">
            <div class="input-group input-daterange" data-provide="datepicker" >
                <input type="text" class="form-control" value="${ gdbaFarenResume.start }" name="start" data-fv-notempty="true">
                <span class="input-group-addon">&nbsp; 到 &nbsp;</span>
                <input type="text" class="form-control" value="${ gdbaFarenResume.end }" name="end" data-fv-notempty="true">
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 公司名称</label>
        <div class="col-xs-10">
            <input type="text" class="form-control" name="gsmc" data-fv-notempty="true" value="${ gdbaFarenResume.gsmc }">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required" ></span> 职位类别</label>
        <div class="col-xs-4">
            <div class="_fv-container">
                <select class="form-control" data-pku-widget="select2" name="zwlb"
                        data-placeholder="请选择"
                        data-allow-clear="true" 
                        data-required="validate-invalid" data-fv-notempty="true"
                        data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_JOB_TYPE.xml"
                        data-fv-row="._fv-container"
                        data-selected-value="${ gdbaFarenResume.zwlb }">
                    <option value=""></option>
                </select>
            </div>
        </div>
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 职位名称</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="zwmc" value="${ gdbaFarenResume.zwmc }" data-fv-notempty="true">
        </div>
    </div>
    <div class="form-group from-group-submit">
        <div class="col-xs-4"></div>
        <div class="col-xs-4">
            <button type="submit" class="btn btn-info btn-block btn-lg"><i class="fa fa-save"></i> 保存</button>
        </div>
        <div class="col-xs-1">
            <button type="button" class="btn btn-default btn-sm btn-cancel"><i class="fa fa-trash"></i> 取消</button>
        </div>
    </div>
</form>