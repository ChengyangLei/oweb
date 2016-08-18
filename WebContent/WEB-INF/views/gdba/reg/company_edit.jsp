<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<div class="panel panel-default js--panel" id="_panel-1" 
	 data-detail-panel-url="${ ctx }/gdba/reg/company/fragement?type=detail" 
	 data-edit-panel-url="${ ctx }/gdba/reg/company/fragement?type=edit">
    <div class="panel-heading text-info"> <i class="fa fa-sticky-note-o"></i> 保安服务公司基本信息
        <!--
        <button type="button" class="btn btn-warning pull-right btn-xs" ><i class="fa fa-edit"></i> 修改</button>
        -->
    </div>
    <div class="panel-body">

        <form id="_form-edit-1" class="form-horizontal js--form" data-pku-widget="fv" action="${ctx}/gdba/reg/saveCompany">
            <input type="hidden" name="gsbm" value="${gdbaCompany.gsbm}"/>

            <div class="form-group">
                <label class="col-xs-2 control-label col-xs-2"><span class="fa fa-star text-required"></span> 公司名称</label>

                <div class="col-xs-10">
                    <input type="text" class="form-control" name="gsmc" data-fv-notempty="true" value="${gdbaCompany.gsmc}">
                </div>
            </div>
            <div class="form-group">
                <div class="_fv-container">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 公司性质</label>
                    <div class="col-xs-4">
                        <select class="form-control" data-pku-widget="select2" name="gsxz"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_COMPANY_TYPE.xml"
                                data-fv-row="._fv-container"
                                data-fv-icon="false"
                                data-selected-value="${gdbaCompany.gsxz}"
                                >
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="_fv-container">
                    <label class="col-xs-2 control-label">管理人数</label>
                    <div class="col-xs-4">
                        <input type="text" class="form-control" name="glrs" data-fv-integer="true" data-fv-row="._fv-container" value="${gdbaCompany.glrs}">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="_fv-container">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 注册资金</label>
                    <div class="col-xs-4">
                        <div class="input-group">
                            <span class="input-group-addon">￥</span>
                            <input name="zczj" type="text" class="form-control text-right" value="${gdbaCompany.zczj}"
                                   data-fv-row="._fv-container"
                                   data-fv-notempty="true"
                                   data-fv-numeric="true"
                                   data-fv-greaterthan="true"
                                   data-fv-greaterthan-value="0"
                                   data-fv-icon="false" >
                            <span class="input-group-addon">万</span>
                        </div>
                    </div>
                </div>
                <div class="_fv-container">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 营业执照注册号</label>
                    <div class="col-xs-4">
                        <input name="yyzz" type="text" class="form-control" value="${gdbaCompany.yyzz}"
                               data-fv-row="._fv-container"
                               data-fv-notempty="true">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-2 control-label "><span class="fa fa-star text-required"></span> 公司地址省市县(区)</label>

                <div class="col-xs-10">
                    <div class="input-group">
                        <input type="text" class="form-control" data-pku-widget="select-area" name="gsdzssxq" data-select-trigger="#selectBtn_gsdzssxq"
                        	   value="${gdbaCompany.gsdzssxq}"
                               data-fv-notempty="true"
                               data-fv-icon="false">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" id="selectBtn_gsdzssxq"><i class="fa fa-caret-down"></i></button>
                        </span>
                    </div>

                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 公司详细地址</label>

                <div class="col-xs-10">
                    <input type="text" name="gsdzxz" class="form-control" data-fv-notempty="true" value="${gdbaCompany.gsdzxz}">
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 辖区派出所</label>

                <div class="col-xs-10">
                    <select class="form-control"  name="gsxqpcs" data-pku-widget="select2"
                            data-placeholder="请选择"
                            data-allow-clear="true" data-show-max-item-num="10"
                            data-required="validate-invalid" data-fv-notempty="true"
                            data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_PCS.xml"
                            data-fv-icon="false"
                            data-selected-value="${gdbaCompany.gsxqpcs}"
                            >
                        <option value=""></option>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 经营范围</label>

                <div class="col-xs-10">
                	<%-- <c:set var="jyfwList" value="${fn:split(gdbaCompany.jyfw, ',')}" /> --%>
                	<%-- <pku:dic var="itemList" dicName="DIC_BUSINESS_SCOPE" /> --%>
                	
             	 		<c:set value="${ fn:split( gdbaCompany.jyfw , ',') }" var="selectedCodes" />
                         
                        <pku:dic dicName="DIC_BUSINESS_SCOPE" var="itemList">
                        	<c:forEach items="${ itemList }" var="item" varStatus="status">
                        		<label class="checkbox-inline"> 
                        			<input type="checkbox" name="jyfw" value="${ item.itemCode }" 
                        				<%-- 给第一条添加formvalidate --%>
                        				<c:if test="${status.index == 0}">data-fv-notempty="true" data-fv-icon="false"</c:if>
                        				<%-- 遍历选中的code，有则添加选中状态 --%>
			                           	<c:forEach items="${ selectedCodes }" var="code">
			                           		<c:if test="${ code == item.itemCode }"> checked</c:if> 
										</c:forEach>
                         		>${ item.itemValue }  
                        		</label>
                       		</c:forEach>
                        </pku:dic>
                	
                	
                		<label class="checkbox-inline">
                			<%-- <input type="checkbox" name="jyfw" value="${dicItem.itemCode}">${dicItem.itemValue} --%>
                		</label>
                    <!-- <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="01"
                                                           data-fv-notempty="true"
                                                           data-fv-icon="false">门卫</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="02">巡逻</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="03">守护</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="04">押运</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="05">随身护卫</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="06">安全检查</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="07">安全技术防范</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="08">安全风险评估</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="09">秩序维护</label>
                    <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="10">其他</label> -->
                </div>
            </div>
        </form>


    </div>
    <div class="panel-footer clearfix text-center">
        <button type="button" class="btn btn-info js--save" data-form-id="_form-edit-1"><i class="fa fa-save"></i> 保存</button>
    </div>

</div>