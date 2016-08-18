<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广东省网上办事大厅-省公安厅</title>
<link rel="stylesheet" href="${ctx}/static/dev/apps/framework/css/eg_gdba.css"/>
<script>
    require(["jquery", "formvalidationI18N", "bootstrap", "select2", "datepicker", "select-area"], function ( $ ) {
        $( document ).ready( function(){
            $( '[data-pku-widget="fv"]' ).formValidation();
    
            $( '[data-pku-widget="select2"]' ).select2();
            
            $( '[data-pku-widget="select-area"]' ).selectArea();
    
            $( ".nav-leftside .panel-anchor" ).tooltip( {
                theme: "tooltip-info-dark",
                placement: "right",
                container: "body"
            } );
            
            // 保存
            $( document ).on( "click", ".js--panel .js--save", function ( e ) {
            	var $this,
            		$form,
            		$fvInstance,
            		isValid,
            		url
            		;
            	$this = $( this );
            	$form = $this.closest( ".js--panel" ).find( ".js--form" );
            	$fvInstance = $form.data('formValidation')
            	
            	// 校验
            	$fvInstance.validate();
            	// 判断
            	isValid = $fvInstance.isValid();
            	
            	// 校验不通过 ， 退出
            	if ( ! isValid ) { 
            		return false;
            	}
            	
            	// 发送Ajax，保存数据
            	url = $form.attr( "action" );
            	
            	$.ajax( {
            		type: "POST",
            		url: url,
            		data: $form.serialize(),
            		timeout: 60000, // 设置请求超时时间（毫秒）
            		contentType: "application/x-www-form-urlencoded; charset=utf-8",
            		dataType: "json", // 预期服务器返回的数据类型。
            		success: function (responseData) {
            			var isSuccess,
            				data
            				;
            			isSuccess = responseData.isSuccess;
            			data = responseData.data; // ID （主键）
            			console.info( responseData );
            		},
            		complete: function () {
            			
            		}
           		});
            	
            } );
    
        } );
    
    })
</script>
</head>
<body>

<div class="nav-leftside">
    <div class="btn-group-vertical">
        <a href="#_panel-1" data-toggle="tooltip" class="btn btn-success panel-anchor" title="保安服务公司基本信息"><i class="fa fa-sticky-note-o"></i></a>
        <a href="#_panel-2" data-toggle="tooltip" class="btn btn-info panel-anchor" title="保安服务公司法定代表人信息"><i class="fa fa-legal"></i></a>
        <a href="#_panel-3" data-toggle="tooltip" class="btn btn-warning panel-anchor" title="主要负责人信息"><i class="fa fa-user-secret"></i></a>
    </div>
</div>

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
        <div class="xinxin" style="overflow:hidden;">
            <iframe _src="http://www.gdbs.gov.cn/portal/star/subjectStarInfo.seam?serviceCode=10115600000694000000000000"
                    width="300" height="26" frameborder="0" scrolling="no"></iframe>
        </div>
    </div>
</div>
<!-- 头部 end -->

<!-- 中间内容部分-->
<div class="wrap clearfix main border-radius-none-all" >

    <div class="panel panel-default js--panel" id="_panel-1">
        <div class="panel-heading text-info"> <i class="fa fa-sticky-note-o"></i> 保安服务公司基本信息
            <!--
            <button type="button" class="btn btn-warning pull-right btn-xs" ><i class="fa fa-edit"></i> 修改</button>
            -->
        </div>
        <div class="panel-body">

            <form id="_form-edit-1" class="form-horizontal js--form" data-pku-widget="fv" action="${ctx}/gdba/reg/saveCompany">
            	<%-- ID --%>
                <input type="hidden" name="gsbm"/>
                
                <div class="form-group">
                    <label class="col-xs-2 control-label col-xs-2"><span class="fa fa-star text-required"></span> 公司名称</label>

                    <div class="col-xs-10">
                        <input type="text" class="form-control" name="gsmc" data-fv-notempty="true">
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
                                    data-fv-row="._fv-container">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label">管理人数</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" name="glrs" data-fv-integer="true" data-fv-row="._fv-container" >
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 注册资金</label>
                        <div class="col-xs-4">
                            <div class="input-group">
                                <span class="input-group-addon">￥</span>
                                <input name="zczj" type="text" class="form-control text-right"
                                       data-fv-row="._fv-container"
                                       data-fv-notempty="true"
                                       data-fv-numeric="true"
                                       data-fv-greaterthan="true"
                                       data-fv-greaterthan-value="0" >
                                <span class="input-group-addon">万</span>
                            </div>
                        </div>
                    </div>
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 营业执照注册号</label>
                        <div class="col-xs-4">
                            <input name="yyzz" type="text" class="form-control"
                                   data-fv-row="._fv-container"
                                   data-fv-notempty="true">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-2 control-label "><span class="fa fa-star text-required"></span> 公司地址省市县(区)</label>

                    <div class="col-xs-10">
                    	<input type="text" class="form-control"  name="gsdzssxq" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 公司详细地址</label>

                    <div class="col-xs-10">
                        <input type="text" name="gsdzxz" class="form-control" data-fv-notempty="true" >
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 辖区派出所</label>

                    <div class="col-xs-10">
                        <select class="form-control"  name="gsxqpcs"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_PCS.xml">
                            <option value=""></option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 经营范围</label>

                    <div class="col-xs-10">
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="01"
                                                               data-fv-notempty="true">门卫</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="02">巡逻</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="03">守护</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="04">押运</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="05">随身护卫</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="06">安全检查</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="07">安全技术防范</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="08">安全风险评估</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="09">秩序维护</label>
                        <label class="checkbox-inline"> <input type="checkbox" name="jyfw" value="10">其他</label>
                    </div>
                </div>
            </form>


        </div>
        <div class="panel-footer clearfix text-center">
            <button type="button" class="btn btn-info js--save" data-form-id="_form-edit-1"><i class="fa fa-save"></i> 保存</button>
        </div>

    </div>


    <div class="panel panel-default" id="_panel-2">
        <div class="panel-heading text-info"> <i class="fa fa-legal"></i> 保安服务公司法定代表人信息
            <!--
            <button type="button" class="btn btn-warning pull-right btn-xs" ><i class="fa fa-edit"></i> 修改</button>
            -->
        </div>
        <div class="panel-body">

            <form id="_form-edit-2" class="form-horizontal" data-pku-widget="fv" >

                <div class="form-group">
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 姓名</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" name="frxm" data-fv-integer="true" data-fv-row="._fv-container" >
                        </div>
                    </div>
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 性别</label>
                        <div class="col-xs-4">
                            <select class="form-control" data-pku-widget="select2" name="frxb"
                                    data-placeholder="请选择"
                                    data-allow-clear="true" data-show-max-item-num="10"
                                    data-required="validate-invalid" data-fv-notempty="true"
                                    data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_GENDER.xml"
                                    data-fv-row="._fv-container">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 出生日期</label>
                        <div class="col-xs-4">
                            <div class="input-group date" data-provide="datepicker" >
                                <input type="text" class="form-control" placeholder="选择日期" name="frcsrq" data-fv-notempty="true"/>
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 国籍</label>
                    <div class="col-xs-4">
                        <select class="form-control" data-pku-widget="select2" name="frgj"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_NATIONALITY.xml"
                                data-fv-row="._fv-container">
                            <option value=""></option>
                        </select>
                    </div>
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 民族</label>
                    <div class="col-xs-4">
                        <select class="form-control" data-pku-widget="select2" name="frmz"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_NATION.xml"
                                data-fv-row="._fv-container">
                            <option value=""></option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 政治面貌</label>
                    <div class="col-xs-4">
                        <select class="form-control" data-pku-widget="select2" name="frzzmm"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_CLAN.xml">
                            <option value=""></option>
                        </select>
                    </div>
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 文化程度</label>
                    <div class="col-xs-4">
                        <select class="form-control" data-pku-widget="select2" name="frwhcd"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_EDUCATION.xml">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 证件类型</label>
                    <div class="col-xs-4">
                        <select class="form-control" data-pku-widget="select2" name="frzjlx"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_TRAVEL_DOCUMENTS.xml">
                            <option value=""></option>
                        </select>
                    </div>
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 证件号码</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" name="frzjhm" data-fv-notempty="true" data-fv-row="._fv-container"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 实际居住地市县(区)</label>
                    <div class="col-xs-10">
                        <select class="form-control" data-pku-widget="select2" name="frsjjzdssxq"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_CODE.xml">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 实际居住地详址</label>
                    <div class="col-xs-10">
                        <input type="text" class="form-control" name="frsjjzdxz" data-fv-notempty="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 户籍地省市县(区)</label>
                    <div class="col-xs-10">
                        <select class="form-control" data-pku-widget="select2" name="frhjdssxq"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_CODE.xml">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 户籍地详址</label>
                    <div class="col-xs-10">
                        <input type="text" class="form-control" name="frhjdxz" data-fv-notempty="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 办公电话</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" name="frbgdh" data-fv-notempty="true" data-fv-row="._fv-container"/>
                        </div>
                    </div>
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 手机号码</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" name="frsjhm" data-fv-notempty="true" data-fv-row="._fv-container"/>
                        </div>
                    </div>
                </div>

            </form>

        </div>
        <div class="panel-footer clearfix text-center">
            <button type="button" class="btn btn-info" data-form-id="_form-edit-2"><i class="fa fa-save"></i> 保存</button>
        </div>

    </div>

    <div class="panel panel-default" id="_panel-3">
        <div class="panel-heading text-info"> <i class="fa fa-user-secret"></i> 主要负责人信息
            <!--
            <button type="button" class="btn btn-warning pull-right btn-xs" ><i class="fa fa-edit"></i> 修改</button>
            -->
        </div>
        <div class="panel-body">

            <form id="_form-edit-3" class="form-horizontal" data-pku-widget="fv" >

                <div class="form-group">
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 姓名</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" name="fzrxm" data-fv-integer="true" data-fv-row="._fv-container" >
                        </div>
                    </div>
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 公民身份号码</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" name="fzrgmsfzhm" data-fv-integer="true" data-fv-row="._fv-container" >
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 性别</label>
                        <div class="col-xs-4">
                            <select class="form-control" data-pku-widget="select2" name="fzrxb"
                                    data-placeholder="请选择"
                                    data-allow-clear="true" data-show-max-item-num="10"
                                    data-required="validate-invalid" data-fv-notempty="true"
                                    data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_GENDER.xml"
                                    data-fv-row="._fv-container">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 民族</label>
                        <div class="col-xs-4">
                            <select class="form-control" data-pku-widget="select2" name="fzrmz"
                                    data-placeholder="请选择"
                                    data-allow-clear="true" data-show-max-item-num="10"
                                    data-required="validate-invalid" data-fv-notempty="true"
                                    data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_NATION.xml"
                                    data-fv-row="._fv-container">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 出生日期</label>
                        <div class="col-xs-4">
                            <div class="input-group date" data-provide="datepicker" >
                                <input type="text" class="form-control" placeholder="选择日期" name="fzrcsrq" data-fv-notempty="true" data-fv-row="._fv-container"/>
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                    </div>

                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 文化程度</label>
                    <div class="col-xs-4">
                        <select class="form-control" data-pku-widget="select2" name="fzrwhcd"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_EDUCATION.xml">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 职务</label>
                    <div class="col-xs-4">
                        <select class="form-control" data-pku-widget="select2" name="fzrzw"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_CODE.xml">
                            <option value=""></option>
                        </select>
                    </div>
                    <div class="_fv-container">
                        <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 联系电话</label>
                        <div class="col-xs-4">
                            <input type="text" class="form-control" name="fzrlxdh" data-fv-notempty="true" data-fv-row="._fv-container"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 实际居住地市县(区)</label>
                    <div class="col-xs-10">
                        <select class="form-control" data-pku-widget="select2" name="fzrsjjzdssxq"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_CODE.xml">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 实际居住地详址</label>
                    <div class="col-xs-10">
                        <input type="text" class="form-control" name="fzrsjjzdxz" data-fv-notempty="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 户籍地省市县(区)</label>
                    <div class="col-xs-10">
                        <select class="form-control" data-pku-widget="select2" name="fzrhjdssxq"
                                data-placeholder="请选择"
                                data-allow-clear="true" data-show-max-item-num="10"
                                data-required="validate-invalid" data-fv-notempty="true"
                                data-xmlurl="http://pkusoft.gz.bcebos.com/DIC_CODE.xml">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 control-label"><span class="fa fa-star text-required"></span> 户籍地详址</label>
                    <div class="col-xs-10">
                        <input type="text" class="form-control" name="fzrhjdxz" data-fv-notempty="true"/>
                    </div>
                </div>
            </form>

        </div>
        <div class="panel-footer clearfix text-center">
            <button type="button" class="btn btn-info" data-form-id="_form-edit-2"><i class="fa fa-save"></i> 保存</button>
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