<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal" data-pku-widget="fv" 
	  action="/gdba/reg/saveFaren"
      data-detail-url="/gdba/reg/template/faren_info?type=detail"
      data-edit-url="/gdba/reg/template/faren_info?type=edit">

    <input type="hidden" name="farenId" value="${gdbaFaren.farenId}"/>
<div class="form-group">
    <div class="_fv-container">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 姓名</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="xm" value="${gdbaFaren.xm}" data-fv-notempty="true"  data-fv-row="._fv-container" >
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 证件类型</label>
    <div class="col-xs-4">
        <select class="form-control" name="zjlx"
                data-pku-widget="select2"
                data-pku-certificate-type="true"
                data-pku-certificate-type-ref="zjhm"
                data-placeholder="请选择"
                data-allow-clear="true"
                data-required="validate-invalid" data-fv-notempty="true"
                data-fv-icon="false"
                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_TRAVEL_DOCUMENTS.xml"
                data-selected-value="<c:if test='${gdbaFaren == null}'>111</c:if>${gdbaFaren.zjlx}">
            <option value=""></option>
            
        </select>
    </div>
    <div class="_fv-container">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 证件号码</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="zjhm"
                   data-fv-notempty="true"
                   data-fv-id="true"
                   data-fv-id-country="CN"
                   data-fv-ref-birth-field="csrq"
                   data-fv-ref-gender-field="xb"
                   data-fv-row="._fv-container" value="${gdbaFaren.zjhm}"/>
        </div>
    </div>
</div>
<div class="form-group">
    <div class="_fv-container">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 出生日期</label>
        <div class="col-xs-4">
            <div class="input-group date" data-provide="datepicker" >
                <input type="text" class="form-control" placeholder="选择日期" name="csrq" data-fv-notempty="true" value="${gdbaFaren.csrq}"/>
                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
            </div>
        </div>
    </div>
    <div class="_fv-container">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 性别</label>
        <div class="col-xs-4">
            <select class="form-control" data-pku-widget="select2" name="xb"
                    data-placeholder="请选择"
                    data-allow-clear="true"
                    data-required="validate-invalid" data-fv-notempty="true"
                    data-fv-icon="false"
                    data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_GENDER.xml"
                    data-fv-row="._fv-container"
                    data-selected-value="${gdbaFaren.xb}">
                <option value=""></option>
            </select>
        </div>
    </div>
</div>

<div class="form-group">
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 国籍</label>
    <div class="col-xs-4">
        <select class="form-control" data-pku-widget="select2" name="gj"
                data-placeholder="请选择"
                data-allow-clear="true"
                data-required="validate-invalid" data-fv-notempty="true"
                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_NATIONALITY.xml"
                data-show-max-item-num="300"
                data-fv-icon="false"
                data-fv-row="._fv-container"
                data-selected-value="<c:if test='${gdbaFaren == null}'>156</c:if>${gdbaFaren.gj}">
            <option value=""></option>
        </select>
    </div>
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 民族</label>
    <div class="col-xs-4">
        <select class="form-control" data-pku-widget="select2" name="mz"
                data-placeholder="请选择"
                data-allow-clear="true"
                data-required="validate-invalid" data-fv-notempty="true"
                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_NATION.xml"
                data-fv-icon="false"
                data-fv-row="._fv-container"
                data-selected-value="${gdbaFaren.mz}">
            <option value=""></option>
        </select>
    </div>
</div>

<div class="form-group">
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 政治面貌</label>
    <div class="col-xs-4">
        <select class="form-control" data-pku-widget="select2" name="zzmm"
                data-placeholder="请选择"
                data-allow-clear="true"
                data-required="validate-invalid" data-fv-notempty="true"
                data-fv-icon="false"
                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_CLAN.xml"
                data-selected-value="${gdbaFaren.zzmm}">
            <option value=""></option>
        </select>
    </div>
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 文化程度</label>
    <div class="col-xs-4">
        <select class="form-control" data-pku-widget="select2" name="whcd"
                data-placeholder="请选择"
                data-allow-clear="true"
                data-fv-icon="false"
                data-required="validate-invalid" data-fv-notempty="true"
                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_EDUCATION.xml"
                data-selected-value="${gdbaFaren.whcd}">
            <option value=""></option>
        </select>
    </div>
</div>

<div class="form-group">
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 实际居住地市县(区)</label>
    <div class="col-xs-10">
        <div class="input-group">
            <input type="text" class="form-control" data-pku-widget="select-area" name="sjjzdssxq" data-select-trigger="#selectBtn_sjjzdssxq_faren"
                   data-fv-notempty="true"
                   data-fv-icon="false" value="${gdbaFaren.sjjzdssxq}">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" id="selectBtn_sjjzdssxq_faren"><i class="fa fa-caret-down"></i></button>
        </span>
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 实际居住地详址</label>
    <div class="col-xs-10">
        <input type="text" class="form-control" name="sjjzdxz" data-fv-notempty="true" value="${gdbaFaren.sjjzdxz}"/>
    </div>
</div>
<div class="form-group">
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 户籍地省市县(区)</label>
    <div class="col-xs-10">
        <div class="input-group">
            <input type="text" class="form-control" data-pku-widget="select-area" name="hjdssxq" data-select-trigger="#selectBtn_hjdssxq_faren"
                   data-fv-notempty="true"
                   data-fv-icon="false" value="${gdbaFaren.hjdssxq}">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" id="selectBtn_hjdssxq_faren"><i class="fa fa-caret-down"></i></button>
        </span>
        </div>
    </div>
</div>
<div class="form-group">
    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 户籍地详址</label>
    <div class="col-xs-10">
        <input type="text" class="form-control" name="hjdxz" data-fv-notempty="true" value="${gdbaFaren.hjdxz}"/>
    </div>
</div>
<div class="form-group">
    <div class="_fv-container">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 办公电话</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="bgdh" data-fv-notempty="true" data-fv-row="._fv-container" value="${gdbaFaren.bgdh}"/>
        </div>
    </div>
    <div class="_fv-container">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 手机号码</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="sjhm" data-fv-notempty="true" data-fv-row="._fv-container" value="${gdbaFaren.sjhm}"/>
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