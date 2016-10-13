<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="pku" uri="/WEB-INF/tld/pku.tld" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/layouts/variables.jsp" %>
<title>广东省网上办事大厅-省公安厅</title>
<link rel="stylesheet" href="${ctx}/static/dev/apps/framework/css/eg_gdba.css?VERSION=${version}"/>
<script src="${ctx}/static/dev/apps/framework/js/eg_gdba2.js?VERSION=${version}"></script>
</head>
<body>


<!-- 头部 -->
<div class="wrap header">
    <div class="top">
        <span class="fhbsdt"><a href="http://www.gdbs.gov.cn" title="返回办事大厅">返回省办事大厅</a></span>
<span class="navTop">
<a href="http://www.gdga.gov.cn/" title="部门首页" target="_blank">部门首页</a><a href="http://www.gdga.gov.cn/wsbs/zwgk"
                                                                          target="_blank" title="政务公开">政务公开</a><a
        href="http://www.gdbs.gov.cn/portal/investApproval/qyInvestIndex.seam" target="_blank" title="投资审批">投资审批</a><a
        href="javaScript:void(0)" class="on" title="网上办事">网上办事</a><a href="http://www.gdbs.gov.cn/portal/zmhd/zmhd.seam"
                                                                     target="_blank" title="政民互动">政民互动</a><a
        href="http://www.gdbs.gov.cn/portal/xnjc/dzjc_index.seam" title="效能监察" target="_blank" id="noBordR">效能监察</a>
</span>
        <span class="yhdl"><a href="" title="用户登录">用户登录</a></span>
    </div>
    <div class="banner">
    </div>
</div>
<!-- 头部 end -->


<!-- 中间内容部分-->
<div class="wrap clearfix main border-radius-none-all page-index" >

    <!-- 说明 -->
    <div class="alert alert-tip alert-dismissible">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <h4>保安服务公司设立许可申请<small class="text-danger">（本次业务流水号：${ currentUser.loginName }）</small></h4>
        <ul>
            <li>对未提交的业务：可输入流水号对其进行<a href="#">修改</a>。</li>
            <li>对已提交的业务：可输入流水号<a href="https://gdba.gdga.gov.cn:8090/web/qry.action">查看审核进度</a>。</li>
        </ul>
    </div>
    <!-- /说明 -->

	<!-- 信息概况 -->
    <div class="sidebar-info-container" data-url="${ ctx }/gdba/reg/info">
        <div class="sidebar-cont">
            <button type="button" class="btn btn-dark-info btn-max" title="显示信息概况" data-toggle="tooltip"><i class="fa fa-th-large"></i></button>
        </div>
        <div class="sidebar-cont sidebar-info active">
            <div class="heading">信息概况
                <a href="#" class="icon pull-right btn-min" title="最小化" data-toggle="tooltip"><i class="fa fa-minus-square"></i></a>
                <a href="#" class="icon pull-right btn-refresh" title="刷新" data-toggle="tooltip"><i class="fa fa-repeat"></i></a>
            </div>
            <div class="body">
                <ul class="menu">
                    <li class="treeview">
                        <a href="#tree_1"><i class="fa fa-sticky-note-o"></i> 保安服务公司</a>
                        <ul class="treeview-menu">
                            <li class="index-0"><a href="#tree_1_1"><i class="fa fa-angle-double-right"></i> 基本信息 <i class="icon fa fa-check fa-close"></i></a></li>
                            <li class="index-1"><a href="#tree_1_2"><i class="fa fa-angle-double-right"></i> 股东信息 <i class="icon fa fa-check fa-close"></i></a></li>
                            <li class="index-2"><a href="#tree_1_3"><i class="fa fa-angle-double-right"></i> 附件 <i class="icon fa fa-check fa-close"></i></a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#tree_2"><i class="fa fa-legal"></i> 法定代表人</a>
                        <ul class="treeview-menu">
                            <li class="index-3"><a href="#tree_2_1"><i class="fa fa-angle-double-right"></i> 基本信息<i class="icon fa fa-check fa-close"></i></a></li>
                            <li class="index-4"><a href="#tree_2_2"><i class="fa fa-angle-double-right"></i> 简历<i class="icon fa fa-check fa-close"></i></a></li>
                            <li class="index-5"><a href="#tree_2_3"><i class="fa fa-angle-double-right"></i> 附件<i class="icon fa fa-check fa-close"></i></a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#tree_3"><i class="fa fa-user-secret"></i> 主要负责人</a>
                        <ul class="treeview-menu">
                            <li class="index-6"><a href="#tree_3_1"><i class="fa fa-angle-double-right"></i> 基本信息<i class="icon fa fa-check fa-close"></i></a></li>
                            <li class="index-7"><a href="#tree_3_2"><i class="fa fa-angle-double-right"></i> 附件<i class="icon fa fa-check fa-close"></i></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="foot">
                <div class="biz-num">流水号: <span>${ currentUser.loginName }</span> <a href="javascript:void(0)" title="流水号 可用于查询本次业务办理情况" data-toggle="tooltip"><i class="fa fa-question-circle"></i></a></div>
                <button type="button" class="btn btn-warning btn-lg btn-block btn-biz-submit" 
                		data-submit-url="${ ctx }/gdba/reg/biz/submit" 
            			data-success-url="${ ctx }/gdba/reg/biz/success">提交审核</button>
            </div>
        </div>
    </div>
    <!-- /信息概况 -->

	<!--保安服务公司-->
	<div class="module" id="tree_1">
        <!-- 保安服务公司 - 基本信息 -->
        <div id="tree_1_1" class="panel-plat">
            <div class="panel-heading">
                <div class="text"><i class="fa fa-sticky-note-o"></i> 保安服务公司 - 基本信息</div>
                <a href="#" class="panel-collapse in"><i class="fa fa-chevron-circle-right fa-chevron-circle-down"></i> <span>折叠</span></a>
            </div>
            <div class="panel-body">
                <c:if test="${ gdbaCompany != null }">
	                <%-- <jsp:include page="/WEB-INF/views/gdba/reg/template/company_info_detail.jsp" /> --%>
	                <%@include file="/WEB-INF/views/gdba/reg/template/company_info_detail.jsp" %>
                </c:if>
                <c:if test="${ gdbaCompany == null }">
	                <%-- <jsp:include page="/WEB-INF/views/gdba/reg/template/company_info_edit.jsp" /> --%>
	                <%@include file="/WEB-INF/views/gdba/reg/template/company_info_edit.jsp" %>
                </c:if>
            </div>
        </div>
        <!-- /保安服务公司 - 基本信息 -->

		<!-- 保安服务公司 - 股东信息 -->
		<div id="tree_1_2" class="panel-plat">
            <div class="panel-heading">
                <div class="text"><i class="fa fa-sticky-note-o"></i> 保安服务公司 - 股东信息</div>
                <a href="#" class="panel-collapse in"><i class="fa fa-chevron-circle-right fa-chevron-circle-down"></i> <span>折叠</span></a>
            </div>
            <div class="panel-body">
            	
            	<%-- gdbaGdList --%>
            	<c:forEach items="${ gdbaGdList }" var="gdbaGd">
	            	<div class="resume resume-detail">
	            		<c:if test="${ gdbaGd.category == '1'  }">
	            			<%-- 源代码级别的引入 --%>
	            			<%@include file="/WEB-INF/views/gdba/reg/template/company_gd_faren_detail.jsp" %>
	            		</c:if>
	            		<c:if test="${ gdbaGd.category == '2'  }">
	            			<%-- 源代码级别的引入 --%>
	            			<%@include file="/WEB-INF/views/gdba/reg/template/company_gd_ziranren_detail.jsp" %>
	            		</c:if>
	            		<c:if test="${ gdbaGd.category == '3'  }">
	            			<%-- 源代码级别的引入 --%>
	            			<%@include file="/WEB-INF/views/gdba/reg/template/company_gd_waizi_detail.jsp" %>
	            		</c:if>
	            	</div>
            	</c:forEach>
            
                <div class="resume-add clearfix">
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-plus-circle"></i> 添加股东 <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${ ctx }/gdba/reg/template/company/gd?type=edit&category=faren" class="btn-resume-add"><i class="fa fa-plus-circle"></i> 法人股东</a></li>
                            <li><a href="${ ctx }/gdba/reg/template/company/gd?type=edit&category=ziranren" class="btn-resume-add"><i class="fa fa-plus-circle"></i> 自然人股东</a></li>
                            <li><a href="${ ctx }/gdba/reg/template/company/gd?type=edit&category=waizi" class="btn-resume-add"><i class="fa fa-plus-circle"></i> 外资股东</a></li>
                        </ul>
                    </div>
                    <div class="resume resume-edit template hidden">
                        <form class="hidden"></form>
                    </div>
                </div>
            </div>
        </div>
		<!-- /保安服务公司 - 股东信息 -->

        <!-- 保安服务公司 - 附件 -->
        <div id="tree_1_3" class="panel-plat">
            <div class="panel-heading">
                <div class="text"><i class="fa fa-sticky-note-o"></i> 保安服务公司 - 附件</div>
                <a href="#" class="panel-collapse in"><i class="fa fa-chevron-circle-right fa-chevron-circle-down"></i> <span>折叠</span></a>
            </div>
            <div class="panel-body">
            	<%-- <jsp:include page="/WEB-INF/views/gdba/reg/template/company_attach.jsp" /> --%>
            	<%@include file="/WEB-INF/views/gdba/reg/template/company_attach.jsp" %>
            	
            </div>
        </div>
        <!-- /保安服务公司 - 附件 -->
    </div>
	<!--/保安服务公司-->
	
    <!-- 法定代表人 -->
    <div id="tree_2" class="module">
    
    	<!-- 法定代表人 - 基本信息 -->
        <div id="tree_2_1" class="panel-plat">
            <div class="panel-heading">
                <div class="text"><i class="fa fa-legal"></i> 法定代表人 - 基本信息</div>
                <a href="#" class="panel-collapse in"><i class="fa fa-chevron-circle-right fa-chevron-circle-down"></i> <span>折叠</span></a>
            </div>
            <div class="panel-body">
                <c:if test="${ gdbaFaren != null }">
	                <%-- <jsp:include page="/WEB-INF/views/gdba/reg/template/faren_info_detail.jsp" /> --%>
	                <%@include file="/WEB-INF/views/gdba/reg/template/faren_info_detail.jsp" %>
                </c:if>
                <c:if test="${ gdbaFaren == null }">
	                <%-- <jsp:include page="/WEB-INF/views/gdba/reg/template/faren_info_edit.jsp" /> --%>
	                <%@include file="/WEB-INF/views/gdba/reg/template/faren_info_edit.jsp" %>
                </c:if>
            </div>
        </div>
        <!-- /法定代表人 - 基本信息 -->
    
    	<!-- 法定代表人 - 简历 -->
        <div id="tree_2_2" class="panel-plat">
            <div class="panel-heading">
                <div class="text"><i class="fa fa-legal"></i> 法定代表人 - 简历</div>
                <a href="#" class="panel-collapse in"><i class="fa fa-chevron-circle-right fa-chevron-circle-down"></i> <span>折叠</span></a>
            </div>
            <div class="panel-body">
            	<c:forEach items="${ gdbaFarenResumeList }" var="gdbaFarenResume">
            	 	<div class="resume resume-detail">
            		<%@include file="/WEB-INF/views/gdba/reg/template/faren_resume_detail.jsp" %>
            		</div>
            	</c:forEach>
            	<div class="resume-add clearfix">
                    <button type="button" class="btn btn-success pull-right btn-resume-add"><i class="fa fa-plus-circle"></i> 添加简历</button>
                    <div class="resume resume-edit template hidden">
                        <form class="hidden"
                              data-detail-url="/gdba/reg/template/faren/resume?type=detail&id="
     						  data-edit-url="/gdba/reg/template/faren/resume?type=edit&id=">
						</form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /法定代表人 - 简历 -->
    
    	<!-- 法定代表人 - 附件 -->
        <div id="tree_2_3" class="panel-plat">
            <div class="panel-heading">
                <div class="text"><i class="fa fa-legal"></i> 法定代表人 - 附件</div>
                <a href="#" class="panel-collapse in"><i class="fa fa-chevron-circle-right fa-chevron-circle-down"></i> <span>折叠</span></a>
            </div>
            <div class="panel-body">
            	<%@include file="/WEB-INF/views/gdba/reg/template/faren_attach.jsp" %>
		    </div>
        </div>
        <!-- /法定代表人 - 附件 -->
    
    </div>
    <!-- /法定代表人 -->


    <!-- 主要负责人 -->
    <div id="tree_3" class="module">
    
     	<!-- 主要负责人 - 基本信息 -->
        <div id="tree_3_1" class="panel-plat">
            <div class="panel-heading">
                <div class="text"><i class="fa fa-user-secret"></i> 主要负责人 - 基本信息</div>
                <a href="#" class="panel-collapse in"><i class="fa fa-chevron-circle-right fa-chevron-circle-down"></i> <span>折叠</span></a>
            </div>
            <div class="panel-body">
            
            	<c:forEach items="${ gdbaFuzerenList }" var="gdbaFuzeren">
	            	<div class="resume resume-detail">
	            		<%@include file="/WEB-INF/views/gdba/reg/template/fuzeren_info_detail.jsp" %>
	            	</div>
            	</c:forEach>
            	
                <div class="resume-add clearfix">
                    <button type="button" class="btn btn-success pull-right btn-resume-add"><i class="fa fa-plus-circle"></i> 添加负责人</button>
                    <div class="resume resume-edit template hidden">
                        <form class="hidden"
                              data-detail-url="/gdba/reg/template/fuzeren_info?type=detail&id="
      						  data-edit-url="/gdba/reg/template/fuzeren_info?type=edit&id="></form>
                    </div>
                </div>
    		</div>
   		</div>
   		<!-- /主要负责人 - 基本信息 -->
   		
    	
    	<!-- 主要负责人 - 附件 -->
    	<div id="tree_3_2" class="panel-plat">
            <div class="panel-heading">
                <div class="text"><i class="fa fa-user-secret"></i> 主要负责人 - 附件</div>
                <a href="#" class="panel-collapse in"><i class="fa fa-chevron-circle-right fa-chevron-circle-down"></i> <span>折叠</span></a>
            </div>
            <div class="panel-body">
            	<%@include file="/WEB-INF/views/gdba/reg/template/fuzeren_attach.jsp" %>
            </div>
        </div>
    	<!-- /主要负责人 - 附件 -->
    	
    </div>
    <!-- /主要负责人 -->

	<div class="row row-biz-commit">
        <div class="col-xs-4"></div>
        <div class="col-xs-4">
            <button type="button" class="btn btn-warning btn-lg btn-block btn-biz-submit" 
            		data-submit-url="${ ctx }/gdba/reg/biz/submit" 
            		data-success-url="${ ctx }/gdba/reg/biz/success">提交审核</button>
        </div>
    </div>
</div>
<!-- 中间内容部分 end -->


<!-- 底部内容部分-->
<table width="996" height="64" border="0" align="center" cellpadding="0" cellspacing="0" class="bottomlink">
    <tbody>
    <tr>
        <td><a href="http://www.gdga.gov.cn/jmlx/zxyw/" target="_blank" title="我要咨询"><img
                src="${ctx}/static/dev/apps/framework/images/bsdt/bottombutten1.png"></a></td>
        <td><a href="http://www.gdga.gov.cn" title="我要查询" target="_blank"><img src="${ctx}/static/dev/apps/framework/images/bsdt/bottombutten2.png"></a>
        </td>
        <td><a href="http://www.gdbs.gov.cn/portal/star/evaluate1.seam" title="我要评议" target="_blank"><img
                src="${ctx}/static/dev/apps/framework/images/bsdt/bottombutten3.png"></a></td>
        <td><a href="http://www.gdga.gov.cn/wsbs/complaints/" title="我要投诉" target="_blank"><img
                src="${ctx}/static/dev/apps/framework/images/bsdt/bottombutten4.png"></a></td>
    </tr>
    </tbody>
</table>
<table width="996" height="64" border="0" align="center" cellpadding="0" cellspacing="0" class="bottomword">
    <tbody>
    <tr>
        <td height="63" align="center" valign="middle" >
            <table width="971" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td width="758" height="37" align="left" valign="middle">
                        <table width="700" border="0" cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <td width="52" style="border-right:#ffffff 2px solid;"></td>
                                <td width="20" height="25">&nbsp;</td>
                                <td width="628" height="25"><a href="http://www.gdga.gov.cn" target="_blank"><font
                                        color="#ffffff">建设单位:广东省公安厅</font></a><font color="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;备案/许可证号:粤ICP备05013198号</font>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                    <td width="213" align="center" valign="middle">
                        <table width="210" border="0" cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <td height="20" align="center" valign="middle" style="border-right:#6dd8ee solid 1px;">
                                    <a href="http://www.gdga.gov.cn/wzxx/200910/t20091013_391968.html" title="网站地图"
                                       target="_blank"><font color="#6dd8ee">网站地图</font></a></td>
                                <td align="center" valign="middle"><a
                                        href="http://www.gdga.gov.cn/wzxx/200910/t20091013_391962.html" title="联系我们"
                                        target="_blank"><font color="#6dd8ee">联系我们</font></a></td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
<!-- 底部内容部分 end -->


</body>
</html> 

</body>
</html>