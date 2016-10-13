<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-detail" data-pku-widget="fv" 
	  action="/gdba/reg/saveFaren"
      data-detail-url="/gdba/reg/template/faren_info?type=detail"
      data-edit-url="/gdba/reg/template/faren_info?type=edit">
<button type="button" class="btn btn-sm btn-warning btn-edit" title="编辑" data-toggle="tooltip"><i class="fa fa-pencil"></i></button>
<div class="form-group">
	<label class="col-xs-2 control-label">姓名</label>
	<div class="col-xs-4">${gdbaFaren.xm} </div>
</div>
<div class="form-group">
    <label class="col-xs-2 control-label">证件类型</label>
    <div class="col-xs-4"><pku:dicValue dicName="DIC_TRAVEL_DOCUMENTS" itemCode="${ gdbaFaren.zjlx }" /> </div>
    <label class="col-xs-2 control-label">证件号码</label>
    <div class="col-xs-4"> ${gdbaFaren.zjhm} </div>
</div>
<div class="form-group">
        <label class="col-xs-2 control-label">出生日期</label>
        <div class="col-xs-4"> ${gdbaFaren.csrq} </div>
        <label class="col-xs-2 control-label">性别</label>
        <div class="col-xs-4"><pku:dicValue dicName="DIC_GENDER" itemCode="${ gdbaFaren.xb }" /> </div>
</div>

<div class="form-group">
    <label class="col-xs-2 control-label">国籍</label>
    <div class="col-xs-4"><pku:dicValue dicName="DIC_NATIONALITY" itemCode="${ gdbaFaren.gj }" />  </div>
    <label class="col-xs-2 control-label">民族</label>
    <div class="col-xs-4"><pku:dicValue dicName="DIC_NATION" itemCode="${ gdbaFaren.mz }" /> </div>
</div>

<div class="form-group">
    <label class="col-xs-2 control-label">政治面貌</label>
    <div class="col-xs-4"><pku:dicValue dicName="DIC_CLAN" itemCode="${ gdbaFaren.zzmm }" /> </div>
    <label class="col-xs-2 control-label">文化程度</label>
    <div class="col-xs-4"><pku:dicValue dicName="DIC_EDUCATION" itemCode="${ gdbaFaren.whcd }" /> </div>
</div>

<div class="form-group">
    <label class="col-xs-2 control-label">实际居住地市县(区)</label>
    <div class="col-xs-10"><pku:dicValue dicName="DIC_CODE" itemCode="${gdbaFaren.sjjzdssxq}" /> </div>
</div>
<div class="form-group">
    <label class="col-xs-2 control-label">实际居住地详址</label>
    <div class="col-xs-10"> ${gdbaFaren.sjjzdxz} </div>
</div>
<div class="form-group">
    <label class="col-xs-2 control-label">户籍地省市县(区)</label>
    <div class="col-xs-10"><pku:dicValue dicName="DIC_CODE" itemCode="${gdbaFaren.hjdssxq}" /> </div>
</div>
<div class="form-group">
    <label class="col-xs-2 control-label">户籍地详址</label>
    <div class="col-xs-10"> ${gdbaFaren.hjdxz} </div>
</div>
<div class="form-group">
	<label class="col-xs-2 control-label">办公电话</label>
	<div class="col-xs-4"> ${gdbaFaren.bgdh} </div>
	<label class="col-xs-2 control-label">手机号码</label>
	<div class="col-xs-4"> ${gdbaFaren.sjhm} </div>
</div>
</form>