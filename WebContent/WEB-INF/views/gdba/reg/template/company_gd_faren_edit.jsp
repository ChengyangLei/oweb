<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="random" value="<%=( ( new java.util.Random() ).nextInt( Integer.MAX_VALUE ) ) %>" />
<form class="form-horizontal form-edit" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveGd"
      data-detail-url="/gdba/reg/template/company/gd?type=detail&category=faren&id=${gdbaGd.gdId}"
      data-edit-url="/gdba/reg/template/company/gd?type=edit&category=faren&id=${gdbaGd.gdId}">

	<input type="hidden" name="gdId" value="${ gdbaGd.gdId }"/>
	<input type="hidden" name="category" value="1"/>
	<input type="hidden" name="gsbm" value="${ gdbaGd.gsbm }"/>
    <div class="form-group">
        <div class="_fv-container">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 法人股东名称</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" name="frgdmc" data-fv-notempty="true" value="${ gdbaGd.frgdmc }">
            </div>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 法人股东经济性质</label>
            <div class="col-xs-4">
                <select class="form-control" data-pku-widget="select2" name="frgdjjlx"
                        data-placeholder="请选择"
                        data-allow-clear="true"
                        data-required="validate-invalid" data-fv-notempty="true"
                        data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_COMPANY_TYPE.xml"
                        data-fv-row="._fv-container"
                        data-fv-icon="false"
                        data-selected-value="${ gdbaGd.frgdjjlx }">
                    <option value=""></option>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label ">现地址省市县(区)</label>

        <div class="col-xs-10">
            <div class="input-group">
                <input type="text" class="form-control" data-pku-widget="select-area" name="frxzzssxq" data-select-trigger="#selectBtn_frxzzssxq_${ random }"
               		   value="${gdbaGd.frxzzssxq}"
                       data-fv-icon="false">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="selectBtn_frxzzssxq_${ random }"><i class="fa fa-caret-down"></i></button>
                </span>
            </div>

        </div>
    </div>

    <div class="form-group">
        <label class="col-xs-2 control-label">现住址详细地址</label>
        <div class="col-xs-10">
            <input type="text" name="frxzzxz" class="form-control" value="${gdbaGd.frxzzxz}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">联系电话</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="frlxdh" value="${gdbaGd.frlxdh}">
        </div>
        <label class="col-xs-2 control-label">法人姓名</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="frxm"  value="${gdbaGd.frxm}">
        </div>
    </div>
    <div class="form-group">
        <div class="_fv-container">
            <label class="col-xs-2 control-label">法人年龄</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" name="frnl" value="${gdbaGd.frnl}">
            </div>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label">法人性别</label>
            <div class="col-xs-4">
                <select class="form-control" data-pku-widget="select2" name="frxb"
                        data-placeholder="请选择"
                        data-allow-clear="true"
                        data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_GENDER.xml"
                        data-fv-icon="false"
                        data-fv-row="._fv-container"
                        data-selected-value="${gdbaGd.frxb}">
                    <option value=""></option>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label">营业执照注册号</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="frgdyyzz" value="${gdbaGd.frgdyyzz}">
        </div>
        <label class="col-xs-2 control-label">统一社会信用代码</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="frgdshxydm" value="${gdbaGd.frgdshxydm}">
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