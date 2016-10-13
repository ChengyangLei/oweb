<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-detail" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveGd"
	  data-delete-url="${ctx}/gdba/reg/gd/delete?id=${gdbaGd.gdId}"
      data-detail-url="/gdba/reg/template/company/gd?type=detail&category=ziranren&id=${gdbaGd.gdId}"
      data-edit-url="/gdba/reg/template/company/gd?type=edit&category=ziranren&id=${gdbaGd.gdId}">

	<div class="btn-tools btn-group btn-group-sm">
        <button type="button" class="btn btn-warning btn-edit" title="编辑" data-toggle="tooltip"><i class="fa fa-pencil"></i></button>
        <button type="button" class="btn btn-danger btn-resume-delete" title="删除" data-toggle="tooltip"><i class="fa fa-trash"></i></button>
    </div>


	<input type="hidden" name="gdId" value="${ gdbaGd.gdId }"/>
	<input type="hidden" name="category" value="2"/>
	<input type="hidden" name="gsbm" value="${ gdbaGd.gsbm }"/>
	
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 自然人股东名称</label>
        <div class="col-xs-4">${ gdbaGd.zrrmc }</div>
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 公民身份证号码</label>
        <div class="col-xs-4">${ gdbaGd.zrrgmsfzhm }</div>
    </div>
    <div class="form-group">
        <div class="_fv-container">
            <label class="col-xs-2 control-label">出生日期</label>
            <div class="col-xs-4">${ gdbaGd.zrrcsrq }</div>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label">性别</label>
            <div class="col-xs-4"><pku:dicValue dicName="DIC_GENDER" itemCode="${ gdbaGd.zrrxb }" /></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">民族</label>
        <div class="col-xs-4"><pku:dicValue dicName="DIC_NATION" itemCode="${ gdbaGd.zrrmz }" /></div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">户籍地省市县(区)</label>
        <div class="col-xs-10"><pku:dicValue dicName="DIC_CODE" itemCode="${gdbaGd.zrrhjdssxq}" /></div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">户籍地详址</label>
        <div class="col-xs-10">${ gdbaGd.zrrhjdxz }</div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">现住址省市县(区)</label>
        <div class="col-xs-10"><pku:dicValue dicName="DIC_CODE" itemCode="${gdbaGd.zrrxzzssxq}" /></div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">现住址详址</label>
        <div class="col-xs-10">${ gdbaGd.zrrxzzxz }</div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 出资金额</label>
        <div class="col-xs-4">￥ ${ gdbaGd.czje } 万</div>
    </div>
</form>