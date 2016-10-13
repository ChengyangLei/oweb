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
<script>
        function preview( oper ) {
            var bdhtml,
                sprnstr,
                eprnstr,
                prnhtml
                ;
            if ( oper < 10 ) {
                bdhtml = window.document.body.innerHTML;//获取当前页的html代码
                sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域
                eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域
                prnhtml = bdhtml.substring( bdhtml.indexOf( sprnstr ) + 18 ); //从开始代码向后取html
                prnhtml = prnhtml.substring( 0, prnhtml.indexOf( eprnstr ) );//从结束代码向前取html
                window.document.body.innerHTML = prnhtml;
                window.print();
                window.document.body.innerHTML = bdhtml;
            } else {
                window.print();
            }
        }
</script>
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

<!-- 中间内容部分--><!--startprint1-->
<div class="wrap clearfix main page-agreement page-receipt" >
    <h3 class="text-center title-header">保安服务公司设立行政许可预受理回执</h3>

    <h4 class="title-module">本次业务申办流水号为：<span class="text-danger-light">440000000307981</span></h4>
    <p>您的申请提交成功，请按照《保安服务管理条例》的规定，填写并打印<a href="https://gdba.gdga.gov.cn:8090/pkuweb/download/10115600000694000000000000.docx" target="_blank">《保安服务公司申请设立审批表》</a>，连同下述材料原件1份、复印件2份，提交至以下单位办理许可手续，超过15日未提交申请材料则本次申请无效。 </p>
    <dl>
        <dt>广州市公安局保安管理科</dt>
        <dd>地址：广东省广州市越秀区起义路200号</dd>
        <dd>咨询电话：020-83113552、83116363、83301695</dd>
    </dl>
    <h4 class="title-module">根据《保安服务管理条例》的规定您需提交的材料包括：</h4>
    <ul>
        <li>需提交的材料
            <ol>
                <li>设立申请书（应当载明拟设立保安服务公司的名称、住所、注册资本、股东及出资额、经营范围等内容）；</li>
                <li>依法设立且具有法定资格的验资机构出具的100万元以上注册资本验资证明，属于国有资产的，应当依照有关法律、行政法规的规定进行资产评估，并提供有关文件；</li>
                <li>拟任的保安服务公司法定代表人和总经理、副总经理等主要管理人员的有效身份证件、简历，保安师资格证书复印件，5年以上军队、公安、安全、审判、检察、司法行政或者治安保卫、保安经营管理工作经验证明，县级公安机关开具的无被刑事处罚、劳动教养、收容教育、强制隔离戒毒证明；</li>
                <li>拟设保安服务公司住所的所有权或者使用权的有效证明文件和提供保安服务所需的有关设备、交通工具等材料；</li>
                <li>专业技术人员名单和法律、行政法规有资格要求的资格证明；</li>
                <li>组织机构和保安服务管理制度、岗位责任制度、保安员管理制度材料；</li>
                <li>工商行政管理部门核发的企业名称预先核准通知书。</li>
            </ol>
        </li>
        <li>申请设立提供武装守护押运服务的保安服务公司，除向设区市的公安机关提交上述材料外，还应当提交下列材料：
            <ol>
                <li>1000万元以上注册资本的有效证明文件；</li>
                <li>出资属国有独资或者国有资本占注册资本总额51%以上的有效证明文件；</li>
                <li>符合《专职守护押运人员枪支使用管理条例》规定条件的守护押运人员的材料；</li>
                <li>符合国家或者行业标准的专用运输车辆以及通信、报警设备的材料；</li>
                <li>枪支安全管理制度和保管设施情况的材料。</li>
            </ol>
        </li>
        <li>申请设立中外合资经营、中外合作经营或者外资独资经营的保安服务公司（以下统称外资保安服务公司），除了向公安机关提交前述材料外，还应当提交下列材料：
            <ol>
                <li>中外合资、中外合作合同；</li>
                <li>外方的资信证明和注册登记文件；</li>
                <li>拟任的保安服务公司法定代表人和总经理、副总经理等主要管理人员为外国人的，须提供在所属国家或者地区无被刑事处罚记录证明（原居住地警察机构出具并经公证机关公证）、5年以上保安经营管理工作经验证明、在华取得的保安师资格证书复印件。</li>
            </ol>
        </li>
    </ul>

</div><!--endprint1-->
<!-- 中间内容部分 end -->
<div class="row" style="margin: 20px 0 80px 0;">
    <div class="col-xs-2 col-xs-push-5 text-center">
        <button type="button" class="btn btn-info" onclick="preview(1)"><i class="fa fa-print"></i> 打印</button>
    </div>
</div>



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