<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head> 
	<title>chart的引入</title>
	<script>
	
	/* 	
		访问：http://localhost:8080/test/chart
		位置：/WEB-INF/views/test/chart.jsp 
		依赖："echartsTheme": [ "echarts" ] 。"echartsChinaMap": [ "echarts" ]
	*/
	require( [ "jquery", "echarts", "echartsTheme", "echartsChinaMap" ], function ( $, echarts ) {
		
		$( document ).ready( function(){
			
		
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init( $( "#echart-1" ).get(0) );

            // 指定图表的配置项和数据
            var option = {
                color: ['#3398DB'],
                title: {
                    text: '简单柱状图'
                },
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    data:['销量']
                },
                xAxis: {
                    data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
                },
                yAxis: {},
                series: [{
                    name: '销量',
                    type: 'bar',
                    data: [5, 20, 36, 10, 10, 20]
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            
		} );
	} );
	
	</script>
</head>
<body> 
	<!-- 必须给定尺寸（width、height） -->
	<div id="echart-1" style="width: 800px;height: 600px;"></div>
</body>
</html>