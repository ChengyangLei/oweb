<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="random" value="<%=( ( new java.util.Random() ).nextInt( Integer.MAX_VALUE ) ) %>" />
<form class="form-horizontal form-edit" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveGd"
      data-detail-url="/gdba/reg/template/company/gd?type=detail&category=ziranren&id=${gdbaGd.gdId}"
      data-edit-url="/gdba/reg/template/company/gd?type=edit&category=ziranren&id=${gdbaGd.gdId}">

	<input type="hidden" name="gdId" value="${ gdbaGd.gdId }"/>
	<input type="hidden" name="category" value="2"/>
	<input type="hidden" name="gsbm" value="${ gdbaGd.gsbm }"/>
	
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 自然人股东名称</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="zrrmc" data-fv-notempty="true" value="${ gdbaGd.zrrmc }">
        </div>
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 公民身份证号码</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="zrrgmsfzhm"
                   data-fv-notempty="true"
                   data-fv-id="true"
                   data-fv-id-country="CN"
                   data-fv-ref-birth-field="zrrcsrq"
                   data-fv-ref-gender-field="zrrxb"
                   value="${ gdbaGd.zrrgmsfzhm }"/>
        </div>
    </div>
    <div class="form-group">
        <div class="_fv-container">
            <label class="col-xs-2 control-label">出生日期</label>
            <div class="col-xs-4">
                <div class="input-group date" data-provide="datepicker" >
                    <input type="text" class="form-control" placeholder="选择日期" name="zrrcsrq" value="${ gdbaGd.zrrcsrq }"/>
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </div>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label">性别</label>
            <div class="col-xs-4">
                <select class="form-control" data-pku-widget="select2" name="zrrxb"
                        data-placeholder="请选择"
                        data-allow-clear="true"
                        data-fv-icon="false"
                        data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_GENDER.xml"
                        data-fv-row="._fv-container"
                        data-selected-value="${ gdbaGd.zrrxb }">
                    <option value=""></option>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">民族</label>
        <div class="col-xs-4">
            <select class="form-control" data-pku-widget="select2" name="zrrmz"
                    data-placeholder="请选择"
                    data-allow-clear="true"
                    data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_NATION.xml"
                    data-fv-icon="false"
                    data-fv-row="._fv-container"
                    data-selected-value="${ gdbaGd.zrrmz }">
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">户籍地省市县(区)</label>
        <div class="col-xs-10">
            <div class="input-group">
                <input type="text" class="form-control" data-pku-widget="select-area" name="zrrhjdssxq" data-select-trigger="#selectBtn_zrrhjdssxq_${ random }"
                       data-fv-icon="false"
                       value="${ gdbaGd.zrrhjdssxq }">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="selectBtn_zrrhjdssxq_${ random }"><i class="fa fa-caret-down"></i></button>
                </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">户籍地详址</label>
        <div class="col-xs-10">
            <input type="text" class="form-control" name="zrrhjdxz" value="${ gdbaGd.zrrhjdxz }"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">现住址省市县(区)</label>
        <div class="col-xs-10">
            <div class="input-group">
                <input type="text" class="form-control" data-pku-widget="select-area" name="zrrxzzssxq" data-select-trigger="#selectBtn_zrrxzzssxq_${ random }"
                       data-fv-icon="false"
                       value="${ gdbaGd.zrrxzzssxq }">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="selectBtn_zrrxzzssxq_${ random }"><i class="fa fa-caret-down"></i></button>
                </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">现住址详址</label>
        <div class="col-xs-10">
            <input type="text" class="form-control" name="zrrxzzxz" value="${ gdbaGd.zrrxzzxz }"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 出资金额</label>
        <div class="col-xs-4">
            <div class="input-group">
                <span class="input-group-addon">￥</span>
                <input name="czje" type="text" class="form-control text-right"
                       data-fv-row="._fv-container"
                       data-fv-notempty="true"
                       data-fv-numeric="true"
                       data-fv-greaterthan="true"
                       data-fv-greaterthan-value="0"
                       data-fv-icon="false"
                       value="${ gdbaGd.czje }">
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