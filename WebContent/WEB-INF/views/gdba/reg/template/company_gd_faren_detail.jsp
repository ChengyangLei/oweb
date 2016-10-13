<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-detail" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveGd"
	  data-delete-url="${ctx}/gdba/reg/gd/delete?id=${gdbaGd.gdId}"
      data-detail-url="${ctx}/gdba/reg/template/company/gd?type=detail&category=faren&id=${gdbaGd.gdId}"
      data-edit-url="${ctx}/gdba/reg/template/company/gd?type=edit&category=faren&id=${gdbaGd.gdId}">

	<div class="btn-tools btn-group btn-group-sm">
        <button type="button" class="btn btn-warning btn-edit" title="编辑" data-toggle="tooltip"><i class="fa fa-pencil"></i></button>
        <button type="button" class="btn btn-danger btn-resume-delete" title="删除" data-toggle="tooltip"><i class="fa fa-trash"></i></button>
    </div>

	<input type="hidden" name="gdId" value="${ gdbaGd.gdId }"/>
	<input type="hidden" name="category" value="1"/>
	<input type="hidden" name="gsbm" value="${ gdbaGd.gsbm }"/>
	
    <div class="form-group">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 法人股东名称</label>
            <div class="col-xs-4"> ${ gdbaGd.frgdmc } </div>
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 法人股东经济性质</label>
            <div class="col-xs-4"><pku:dicValue dicName="DIC_COMPANY_TYPE" itemCode="${ gdbaGd.frgdjjlx }" /> </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label ">现地址省市县(区)</label>
        <div class="col-xs-10"><pku:dicValue dicName="DIC_CODE" itemCode="${gdbaGd.frxzzssxq}" /></div>
    </div>

    <div class="form-group">
        <label class="col-xs-2 control-label">现住址详细地址</label>
        <div class="col-xs-10">${gdbaGd.frxzzxz}</div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">联系电话</label>
        <div class="col-xs-4">${gdbaGd.frlxdh}</div>
        <label class="col-xs-2 control-label">法人姓名</label>
        <div class="col-xs-4">${gdbaGd.frxm}</div>
    </div>
    <div class="form-group">
        <div class="_fv-container">
            <label class="col-xs-2 control-label">法人年龄</label>
            <div class="col-xs-4">${gdbaGd.frnl}</div>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label">法人性别</label>
            <div class="col-xs-4"><pku:dicValue dicName="DIC_GENDER" itemCode="${gdbaGd.frxb}" /></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">营业执照注册号</label>
        <div class="col-xs-4">${gdbaGd.frgdyyzz}</div>
        <label class="col-xs-2 control-label">统一社会信用代码</label>
        <div class="col-xs-4">${gdbaGd.frgdshxydm}</div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 出资金额</label>
        <div class="col-xs-4"> ￥ ${gdbaGd.czje} 万 </div>
    </div>

</form>