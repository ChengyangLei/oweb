<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<form class="form-horizontal form-detail" data-pku-widget="fv" 
	  action="${ctx}/gdba/reg/saveCompany"
      data-detail-url="/gdba/reg/template/company_info?type=detail"
      data-edit-url="/gdba/reg/template/company_info?type=edit">
	      
	<button type="button" class="btn btn-sm btn-warning btn-edit" title="编辑" data-toggle="tooltip"><i class="fa fa-pencil"></i></button>
			<div class="form-group">
                <label class="col-xs-2 control-label">公司名称</label> <div class="col-xs-10">${gdbaCompany.gsmc}</div>
            </div>
            <div class="form-group">
                <label class="col-xs-2 control-label">公司性质</label> <div class="col-xs-4"><pku:dicValue dicName="DIC_COMPANY_TYPE" itemCode="${gdbaCompany.gsxz}" /></div>
                <label class="col-xs-2 control-label">管理人数</label> <div class="col-xs-4">${gdbaCompany.glrs}</div>
            </div>
            <div class="form-group">
                <label class="col-xs-2 control-label">注册资金</label> <div class="col-xs-4"> ￥ ${gdbaCompany.zczj} 万 <a href="javascript:void(0)" title="注册资金为股东注册资金总和（添加股东后自动计算）" data-toggle="tooltip"><i class="fa fa-question-circle"></i></a></div>
                <label class="col-xs-2 control-label">营业执照注册号</label> <div class="col-xs-4">${gdbaCompany.yyzz}</div>
            </div>

            <div class="form-group">
                <label class="col-xs-2 control-label ">公司地址省市县(区)</label> <div class="col-xs-10"><pku:dicValue dicName="DIC_CODE" itemCode="${gdbaCompany.gsdzssxq}" /></div>
            </div>

            <div class="form-group">
                <label class="col-xs-2 control-label">公司详细地址</label> <div class="col-xs-10">${gdbaCompany.gsdzxz}</div>
            </div>

            <div class="form-group">
                <label class="col-xs-2 control-label">辖区派出所</label> <div class="col-xs-10"><pku:dicValue dicName="DIC_PCS" itemCode="${gdbaCompany.gsxqpcs}" /></div>
            </div>

            <div class="form-group">
                <label class="col-xs-2 control-label">经营范围</label> 
                <div class="col-xs-10">
                		<c:set value="${ fn:split( gdbaCompany.jyfw , ',') }" var="selectedCodes" />
                         
                        <pku:dic dicName="DIC_BUSINESS_SCOPE" var="itemList">
                        	<c:forEach items="${ itemList }" var="item" varStatus="status">
                      			<%-- 遍历选中的code，有则添加选中状态 --%>
	                           	<c:forEach items="${ selectedCodes }" var="code">
	                           		<c:if test="${ code == item.itemCode }"> ${ item.itemValue } &nbsp;&nbsp;</c:if> 
								</c:forEach>
                       		</c:forEach>
                        </pku:dic>
                </div>
            </div>
</form>