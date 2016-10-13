<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="random" value="<%=( ( new java.util.Random() ).nextInt( Integer.MAX_VALUE ) ) %>" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-edit" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveGd"
      data-detail-url="/gdba/reg/template/company/gd?type=detail&category=waizi&id=${gdbaGd.gdId}"
      data-edit-url="/gdba/reg/template/company/gd?type=edit&category=waizi&id=${gdbaGd.gdId}">

	<input type="hidden" name="gdId" value="${ gdbaGd.gdId }"/>
	<input type="hidden" name="category" value="3"/>
	<input type="hidden" name="gsbm" value="${ gdbaGd.gsbm }"/>
	
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 外资股东姓名</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="wzxm" data-fv-notempty="true" value="${gdbaGd.wzxm}">
        </div>
        <label class="col-xs-2 control-label">外资股东中文名</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="wzzwm" value="${gdbaGd.wzzwm}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">外资股东英文姓</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="wzzywx" value="${gdbaGd.wzzywx}">
        </div>
        <label class="col-xs-2 control-label">外资股东英文名</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="wzzywm" value="${gdbaGd.wzzywm}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">证件类型</label>
        <div class="col-xs-4">
            <select class="form-control" name="wzzjlx"
                    data-pku-widget="select2"
                    data-pku-certificate-type="true"
                    data-pku-certificate-type-ref="wzzjhm"
                    data-placeholder="请选择"
                    data-allow-clear="true"
                    data-fv-icon="false"
                    data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_TRAVEL_DOCUMENTS.xml"
                    data-selected-value="${gdbaGd.wzzjlx}"
                    >
                <option value=""></option>
            </select>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label">证件号码</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" name="wzzjhm"
                       data-fv-id="true"
                       data-fv-id-country="CN"
                       data-fv-ref-birth-field="wzcsrq"
                       data-fv-ref-gender-field="wzxb"
                       data-fv-row="._fv-container"
                       value="${gdbaGd.wzzjhm}"/>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="_fv-container">
            <label class="col-xs-2 control-label">出生日期</label>
            <div class="col-xs-4">
                <div class="input-group date" data-provide="datepicker" >
                    <input type="text" class="form-control" placeholder="选择日期" name="wzcsrq" value="${gdbaGd.wzcsrq}"/>
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </div>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label">性别</label>
            <div class="col-xs-4">
                <select class="form-control" data-pku-widget="select2" name="wzxb"
                        data-placeholder="请选择"
                        data-allow-clear="true"
                        data-fv-icon="false"
                        data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_GENDER.xml"
                        data-fv-row="._fv-container"
                        data-selected-value="${gdbaGd.wzxb}">
                    <option value=""></option>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">国籍</label>
        <div class="col-xs-4">
            <select class="form-control" data-pku-widget="select2" name="wzgj"
                    data-placeholder="请选择"
                    data-allow-clear="true"
                    data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_NATIONALITY.xml"
                    data-show-max-item-num="300"
                    data-fv-icon="false"
                    data-fv-row="._fv-container" 
                    data-selected-value="${gdbaGd.wzgj}">
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">现住址省市县(区)</label>
        <div class="col-xs-10">
            <div class="input-group">
                <input type="text" class="form-control" data-pku-widget="select-area" name="wzxzzssxq" data-select-trigger="#selectBtn_wzxzzssxq_${ random }"
                       data-fv-icon="false"
                       value="${gdbaGd.wzxzzssxq}">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="selectBtn_wzxzzssxq_${ random }"><i class="fa fa-caret-down"></i></button>
                </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">现住址详址</label>
        <div class="col-xs-10">
            <input type="text" class="form-control" name="wzxzzxz" value="${gdbaGd.wzxzzxz}"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 出资金额</label>
        <div class="col-xs-4">
            <div class="input-group">
                <span class="input-group-addon">￥</span>
                <input name="czje" type="text" class="form-control text-right"
                       data-fv-notempty="true"
                       data-fv-numeric="true"
                       data-fv-greaterthan="true"
                       data-fv-greaterthan-value="0"
                       data-fv-icon="false"
                       value="${gdbaGd.czje}">
                <span class="input-group-addon">万</span>
            </div>
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