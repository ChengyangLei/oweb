<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<div class="panel panel-default js--panel" id="_panel-1" 
	 data-detail-panel-url="${ ctx }/gdba/reg/company/fragement?type=detail" 
	 data-edit-panel-url="${ ctx }/gdba/reg/company/fragement?type=edit">
    <div class="panel-heading text-info"> <i class="fa fa-sticky-note-o"></i> 保安服务公司基本信息
        <button type="button" class="btn btn-warning pull-right btn-xs js--edit" ><i class="fa fa-edit"></i> 修改</button>
    </div>
    <div class="panel-body">

        <form class="form-horizontal form-detail" >
            <div class="form-group">
                <label class="col-xs-2 control-label">公司名称</label> <div class="col-xs-10">${gdbaCompany.gsmc}</div>
            </div>
            <div class="form-group">
                <label class="col-xs-2 control-label">公司性质</label> <div class="col-xs-4"><pku:dicValue dicName="DIC_COMPANY_TYPE" itemCode="${gdbaCompany.gsxz}" /></div>
                <label class="col-xs-2 control-label">管理人数</label> <div class="col-xs-4">${gdbaCompany.glrs}</div>
            </div>
            <div class="form-group">
                <label class="col-xs-2 control-label">注册资金</label> <div class="col-xs-4"> ￥ ${gdbaCompany.zczj} 万</div>
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


    </div>
    <!--
    <div class="panel-footer clearfix text-center">
        <button type="submit" class="btn btn-info" form="_form-1"><i class="fa fa-save"></i> 保存</button>
    </div>
    -->
</div>