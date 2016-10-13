<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="random" value="<%=( ( new java.util.Random() ).nextInt( Integer.MAX_VALUE ) ) %>" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-edit" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveFuzeren"
      data-detail-url="/gdba/reg/template/fuzeren_info?type=detail&id=${gdbaFuzeren.fuzerenId}"
      data-edit-url="/gdba/reg/template/fuzeren_info?type=edit&id=${gdbaFuzeren.fuzerenId}">

	<input type="hidden" name="fuzerenId" value="${ gdbaFuzeren.fuzerenId }"/>
	
	<div class="form-group">
        <div class="_fv-container">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 姓名</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" name="xm" value="${gdbaFuzeren.xm}"   
                	data-fv-notempty="true"
                    data-fv-row="._fv-container" >
            </div>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 公民身份号码</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" name="gmsfzhm" value="${gdbaFuzeren.gmsfzhm}"  
                   data-fv-notempty="true"
                   data-fv-id="true"
                   data-fv-id-country="CN"
                   data-fv-ref-birth-field="csrq"
                   data-fv-ref-gender-field="xb" 
                   data-fv-row="._fv-container" >
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="_fv-container">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 性别</label>
            <div class="col-xs-4">
                <select class="form-control" data-pku-widget="select2" name="xb"
                        data-placeholder="请选择"
                        data-allow-clear="true"
                        data-required="validate-invalid" data-fv-notempty="true"
                        data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_GENDER.xml"
                        data-fv-icon="false"
                        data-fv-row="._fv-container"
                        data-selected-value="${gdbaFuzeren.xb}" >
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 出生日期</label>
            <div class="col-xs-4">
                <div class="input-group date" data-provide="datepicker" >
                    <input type="text" class="form-control" placeholder="选择日期" name="csrq" value="${gdbaFuzeren.csrq}"  
                    data-fv-notempty="true" data-fv-row="._fv-container"/>
                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                </div>
            </div>
        </div>
        
    </div>

    <div class="form-group">
        
		<div class="_fv-container">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 民族</label>
            <div class="col-xs-4">
                <select class="form-control" data-pku-widget="select2" name="mz"
                        data-placeholder="请选择"
                        data-allow-clear="true"
                        data-required="validate-invalid" data-fv-notempty="true"
                        data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_NATION.xml"
                        data-fv-icon="false"
                        data-fv-row="._fv-container"
                        data-fv-notempty="true"
                        data-selected-value="${gdbaFuzeren.mz}" >
                    <option value=""></option>
                </select>
            </div>
        </div>


        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 文化程度</label>
        <div class="col-xs-4">
            <select class="form-control" data-pku-widget="select2" name="whcd"
                    data-placeholder="请选择"
                    data-allow-clear="true"
                    data-required="validate-invalid" data-fv-notempty="true"
                    data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_EDUCATION.xml"
                    data-fv-notempty="true"
                    data-selected-value="${gdbaFuzeren.whcd}" >
                <option value=""></option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 职务</label>
        <div class="col-xs-4">
            <input type="text" class="form-control" name="zw" value="${gdbaFuzeren.zw}"  data-fv-notempty="true" data-fv-row="._fv-container"/>
        </div>
        <div class="_fv-container">
            <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 联系电话</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" name="lxdh" value="${gdbaFuzeren.lxdh}"  data-fv-notempty="true" data-fv-row="._fv-container"/>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 实际居住地市县(区)</label>
        <div class="col-xs-10">
            <div class="input-group">
                <input type="text" class="form-control" data-pku-widget="select-area" name="sjjzdssxq" value="${gdbaFuzeren.sjjzdssxq}"  data-select-trigger="#selectBtn_sjjzdssxq_fuzeren_${ random }"
                       data-fv-notempty="true"
                       data-fv-icon="false">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button" id="selectBtn_sjjzdssxq_fuzeren_${ random }"><i class="fa fa-caret-down"></i></button>
            </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 实际居住地详址</label>
        <div class="col-xs-10">
            <input type="text" class="form-control" name="sjjzdxz" value="${gdbaFuzeren.sjjzdxz}"  data-fv-notempty="true"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 户籍地省市县(区)</label>
        <div class="col-xs-10">
            <div class="input-group">
                <input type="text" class="form-control" data-pku-widget="select-area" name="hjdssxq" value="${gdbaFuzeren.hjdssxq}"  
                	   data-select-trigger="#selectBtn_hjdssxq_fuzeren_${ random }"
                       data-fv-notempty="true"
                       data-fv-icon="false">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button" id="selectBtn_hjdssxq_fuzeren_${ random }"><i class="fa fa-caret-down"></i></button>
            </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 户籍地详址</label>
        <div class="col-xs-10">
            <input type="text" class="form-control" name="hjdxz" value="${gdbaFuzeren.hjdxz}"  data-fv-notempty="true"/>
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