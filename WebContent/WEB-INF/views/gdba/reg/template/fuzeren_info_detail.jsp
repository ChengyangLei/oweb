<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-detail" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveFuzeren"
	  data-delete-url="${ctx}/gdba/reg/fuzeren/delete?id=${gdbaFuzeren.fuzerenId}"
      data-detail-url="/gdba/reg/template/fuzeren_info?type=detail&id=${gdbaFuzeren.fuzerenId}"
      data-edit-url="/gdba/reg/template/fuzeren_info?type=edit&id=${gdbaFuzeren.fuzerenId}">

	<div class="btn-tools btn-group btn-group-sm">
        <button type="button" class="btn btn-warning btn-edit" title="编辑" data-toggle="tooltip"><i class="fa fa-pencil"></i></button>
        <button type="button" class="btn btn-danger btn-resume-delete" title="删除" data-toggle="tooltip"><i class="fa fa-trash"></i></button>
    </div>
	
	<div class="form-group">
		<label class="col-xs-2 control-label">姓名</label>
		<div class="col-xs-4"> ${gdbaFuzeren.xm} </div>
		<label class="col-xs-2 control-label">公民身份号码</label>
		<div class="col-xs-4"> ${gdbaFuzeren.gmsfzhm} </div>
    </div>

    <div class="form-group">
		<label class="col-xs-2 control-label">性别</label>
		<div class="col-xs-4"><pku:dicValue dicName="DIC_GENDER" itemCode="${ gdbaFuzeren.xb }" /> </div>
		<label class="col-xs-2 control-label">出生日期</label>
        <div class="col-xs-4"> ${gdbaFuzeren.csrq} </div>
    </div>

    <div class="form-group">
    	<label class="col-xs-2 control-label">民族</label>
		<div class="col-xs-4"><pku:dicValue dicName="DIC_NATION" itemCode="${ gdbaFuzeren.mz }" /> </div>
        <label class="col-xs-2 control-label">文化程度</label>
        <div class="col-xs-4"><pku:dicValue dicName="DIC_EDUCATION" itemCode="${ gdbaFuzeren.whcd }" /> </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">职务</label>
        <div class="col-xs-4"> ${gdbaFuzeren.zw} </div>
        <label class="col-xs-2 control-label">联系电话</label>
        <div class="col-xs-4"> ${gdbaFuzeren.lxdh} </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">实际居住地市县(区)</label>
        <div class="col-xs-10"><pku:dicValue dicName="DIC_CODE" itemCode="${gdbaFuzeren.sjjzdssxq}" /> </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">实际居住地详址</label>
        <div class="col-xs-10"> ${gdbaFuzeren.sjjzdxz} </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">户籍地省市县(区)</label>
        <div class="col-xs-10"><pku:dicValue dicName="DIC_CODE" itemCode="${gdbaFuzeren.hjdssxq}" /> </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">户籍地详址</label>
        <div class="col-xs-10"> ${gdbaFuzeren.hjdxz} </div>
    </div>
</form>