<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal" data-pku-widget="fv" 
	  action="/gdba/reg/saveCompany"
      data-detail-url="/gdba/reg/template/company_info?type=detail"
      data-edit-url="/gdba/reg/template/company_info?type=edit">

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
                    <%-- <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 注册资金</label>
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
                    </div> --%>
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 注册资金</label>
			        <div class="col-xs-4">
			            <div class="form-control">0
			                万元 <a href="javascript:void(0)" title="注册资金为股东注册资金总和（添加股东后自动计算）" data-toggle="tooltip"><i class="fa fa-question-circle"></i></a>
			            </div>
			        </div>
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 营业执照注册号</label>
                    <div class="col-xs-4">
                        <input name="yyzz" type="text" class="form-control" value="${gdbaCompany.yyzz}"
                               data-fv-row="._fv-container"
                               data-fv-notempty="true">
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
                <%-- select初始化时 以及改变select的时都会对其（hidden）赋值 --%>
				<input type="hidden" name="gsxqpcs_name" id="_gsxqpcs"/>
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
                </div>
            </div>
    <div class="form-group from-group-submit">
        <div class="col-xs-4"></div>
        <div class="col-xs-4">
            <button type="submit" class="btn btn-info btn-block btn-lg" ><i class="fa fa-save"></i> 保存</button>
        </div>
        <div class="col-xs-1">
            <button type="button" class="btn btn-default btn-sm btn-cancel"><i class="fa fa-trash"></i> 取消</button>
        </div>
    </div>
</form>