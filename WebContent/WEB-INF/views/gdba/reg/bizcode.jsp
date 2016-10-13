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
<div class="wrap clearfix main page-bizcode" >

    <!-- 说明 -->
    <div class="alert alert-tip alert-dismissible">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <h4>保安服务公司设立许可申请</h4>
        <!--<ul>
            <li>如果您有未完成的业务，可输入业务流水号，点击“确定”，进行修改与保存。</li>
            <li>如果您想创建新的申请，直接点击“<a href="#">创建新的申请</a>”。</li>
        </ul>-->
    </div>
    <!-- /说明 -->

    <div class="card-basic">
        <div class="title">
            <div class="arrow"></div>
            <div class="head">创建新的申请</div>
        </div>
        <div class="desc text-center">
            <a class="btn btn-success btn-app" href="${ ctx }/gdba/anon/bizcode/start">
                <i class="fa fa-play"></i> 开始
            </a>
        </div>
    </div>
    <div class="card-basic card-senior ">
        <div class="title">
            <div class="arrow"></div>
            <div class="head">继续未提交的申请</div>
        </div>
        <div class="desc">
            <form class="form-horizontal" data-pku-widget="fv" action="${ ctx }/gdba/reg/index" data-validate-bizcode-url="${ ctx }/gdba/anon/validate/bizcode">
                <input type="hidden" name="password" value="a"/>
                <div class="form-group">
                    <div class="col-xs-3 text-right">
                        <label class="control-label ">业务流水号</label>
                    </div>
                    <div class="col-xs-9">
                        <input type="text" class="form-control" name="loginName" data-fv-notempty="true">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-3">
                    </div>
                    <div class="col-xs-9">
                        <button type="submit" class="btn btn-info btn-block">确定</button>
                    </div>
                </div>

            </form>
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