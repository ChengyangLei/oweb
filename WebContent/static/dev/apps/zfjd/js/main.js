require( [ "jquery" ,"echarts", "echartsTheme", "bootstrap" ], function ( $, echarts, _echartsTheme, _bs ) {

    var $doc,
        Map,
        IndexPage
    ;

    $doc = $( document );

    // 页面框架动画
    IndexPage = {
        $container: ".page-index",
        $top: ".top",
        $header: ".header",
        $module_1_1: ".module-1-1",
        $module_1_2: ".module-1-2",
        $module_2_1: ".module-2-1",
        $module_2_2: ".module-2-2",
        $module_3_1: ".module-3-1",
        $module_3_2: ".module-3-2",
        $module_3_3: ".module-3-3",
        $module_3_4: ".module-3-4", // 中心，热点地图
        $maxModule: ".module-max", // 每个模块都有的放大图标
        $functionList: ".function-list", // 顶部功能列表
        init: function () {
            this.render();
            this.bind();
        },
        render: function () {
            this.$container = $( this.$container );
            this.$top = $( this.$top, this.$container );
            this.$header = $( this.$header, this.$container );
            this.$module_1_1 = $( this.$module_1_1, this.$container );
            this.$module_1_2 = $( this.$module_1_2, this.$container );
            this.$module_2_1 = $( this.$module_2_1, this.$container );
            this.$module_2_2 = $( this.$module_2_2, this.$container );
            this.$module_3_1 = $( this.$module_3_1, this.$container );
            this.$module_3_2 = $( this.$module_3_2, this.$container );
            this.$module_3_3 = $( this.$module_3_3, this.$container );
            this.$module_3_4 = $( this.$module_3_4, this.$container );
            this.$maxModule = $( this.$maxModule, this.$container );
            this.$functionList = $( this.$functionList, this.$container );
        },
        bind: function() {
            this.$top.addClass( "animated bounceInDown" );
            this.$header.addClass( "animated lightSpeedIn" );
            this.$module_1_1.addClass( "animated bounceInLeft" );
            this.$module_1_2.addClass( "animated bounceInRight" );
            this.$module_2_1.addClass( "animated bounceInLeft" );
            this.$module_2_2.addClass( "animated bounceInRight" );
            this.$module_3_1.addClass( "animated bounceInUp" );
            this.$module_3_2.addClass( "animated bounceInUp" );
            this.$module_3_3.addClass( "animated bounceInUp" );
            this.$module_3_4.addClass( "animated rotateIn" );

            this.$maxModule.hover(
                function fnOver() {
                    $( this ).addClass( "animated rotateIn" );
                },
                function fnOut() {
                    $( this ).removeClass( "animated rotateIn" );
                }
            );
            this.$functionList.find( "a" ).hover(
                function fnOver() {
                    $( this ).addClass( "animated pulse" );
                },
                function fnOut() {
                    $( this ).removeClass( "animated pulse" );
                }
            );
        }
    };

    // 地图
    Map = {
        $container: ".page-index .map-center",
        $sectorList: ".map-sector-list",
        $sectorItem: ".map-sector-item",
        $sectorControl: ".map-sector-control",
        $sectorItemText: ".map-sector-text",
        $areaList: ".map-area-list",
        $areaItem: ".map-area-item",
        $areaItemHot: ".map-hot",
        init: function() {
            this.render();
            this.bind();
        },
        render: function() {
            this.$container = $( this.$container );
            this.$sectorList = $( this.$sectorList, this.$container );
            this.$sectorItem = $( this.$sectorItem, this.$container );
            this.$sectorItemText = $( this.$sectorItemText, this.$container );
            this.$areaList = $( this.$areaList, this.$container );
            this.$areaItem = $( this.$areaItem, this.$container );
            this.$areaItemHot = $( this.$areaItemHot, this.$container );
            this.$sectorControl = $( this.$sectorControl, this.$container );
        },
        bind: function() {
            var _this
            ;
            _this = this;
            // 热点地图-区域块：动画
            this.animateAreaItem();

            // 热点地图-区域块-文字：hover时，改变区域块的状态
            this.$areaItemHot.hover(
                function () {
                    $( this ).parent().addClass( "hover animated pulse" );
                    return false;
                },
                function () {
                    $( this ).parent().removeClass( "hover animated pulse" );
                    return false;
                }
            // 热点地图-区域块-文字：click时，改变区域块的状态
            ).click(
                function ( e ) {
                    var $this
                        ;
                    $this = $( this );
                    e.preventDefault();
                    $this.parent().addClass( "active" ).siblings().removeClass( "active" );
                }
            );

            // 圆环条目：鼠标进入，使文字水平排列
            this.$sectorItem.on( "mouseenter", function () {
                var $this,
                    index,
                    degree
                    ;
                // &:nth-child(1) { transform : rotate(12+24*0deg); }
                $this = $( this );
                index = $this.index();
                degree = 360 - ( 12 + index * 24 );
                $this.find(".map-sector-text").css( "transform", "rotate(" + degree + "deg)" );

            // 圆环条目：鼠标离开，使文字还原
            } ).on( "mouseleave", function() {
                $(this).find(".map-sector-text").css( "transform", "rotate(0deg)" );

            // 圆环条目：单击后添加 active 状态
            } ).on( "click", function() {
                $( this ).addClass( "active" ).siblings().removeClass( "active" );
            } );

            // 圆环条目控制器：点击后，使圆环上所有文字水平显示，点击后消失
            this.$sectorControl.on( "click", function() {
                _this.$sectorItem.trigger( "mouseenter" ).off( "mouseleave" );
                $( this ).hide(500);
            } );
        },
        animateAreaItem: function() {
            var $areaItem
            ;
            $areaItem = this.$areaItem;
            // 设置动画
            $areaItem.each( function( index ) {
                var animateClass
                    ;
                switch ( index % 4 ) {
                    case 0: { animateClass = "hover animated fadeInUpBig"; break; }
                    case 1: { animateClass = "hover animated fadeInDownBig"; break; }
                    case 2: { animateClass = "hover animated fadeInLeftBig"; break; }
                    case 3: { animateClass = "hover animated fadeInRightBig"; break; }
                }
                $( this ).addClass( animateClass ).data( "animateClass", animateClass );
            } );
            // 待动画播放执行完毕，删除掉遗留的css类，避免冲突
            window.setTimeout( function() {
                $areaItem.each(function(){
                    var $this
                        ;
                    $this = $( this );
                    $this.removeClass( $this.data( "animateClass" ) );
                })
            }, 1200 );
        }
    };

    $doc.ready( function( $ ) {

        var randomNum
        ;

        randomNum = Math.floor( 10 + Math.random() * ( 800 - 10) );

        $( '[data-toggle="tooltip"]' ).tooltip();

        IndexPage.init();
        Map.init();

        // 案管中心 - 案卷总数
        drawPieChart( randomNum, 1000 - randomNum );

        // 案管中心 - 案卷排名
        changeRank();

        // 执法音视频 - 视频
        initVidew( [
            "http://www.w3school.com.cn/example/html5/mov_bbb.mp4",
            "http://www.helloweba.com/demo/html5video/movie.mp4",
            "https://shapeshed.com/examples/HTML5-video-element/video/320x240.ogg",
            "https://shapeshed.com/examples/HTML5-video-element/video/320x240.m4v"
        ] );

    } );


    function initHotMap() {
        var $mapAreaList
        ;
        $mapAreaList = $( ".map-area-list" );
        $mapAreaList.find( ".map-hot" ).hover(
            function () {
                $( this ).parent().addClass( "hover animated pulse" );
                return false;
            },
            function () {
                $( this ).parent().removeClass( "hover animated pulse" );
                return false;
            }
        ).click(
            function ( e ) {
                var $this
                ;
                $this = $( this );
                e.preventDefault();
                $this.parent().addClass( "active" ).siblings().removeClass( "active" );
            }
        );
    }


    function initVidew( videoList ) {
        var video
            ;
        video = $( "#video-zf" ).get( 0 );

        if ( ! video ) {
            return;
        }

        video.addEventListener( 'ended', function () {
            play.next();
        }, false );
        play( videoList );

        $( ".control-btn-prev" ).on( "click" , function ( e ) {
            e.preventDefault();
            play.prev();
        } );
        $( ".control-btn-next" ).on( "click" , function ( e ) {
            e.preventDefault();
            play.next();
        } );
    }

    function play( videoList ) {
        var video
            ;

        if ( play.current == null ) {
            play.current = 0;
            play.next = function () {
                play.current++;
                if ( play.current >= videoList.length ) {
                    play.current = 0; // 播放完了，重新播放
                }
                play(videoList);
            };
            play.prev = function () {
                play.current--;
                if ( play.current < 0 ) {
                    play.current = videoList.length - 1; // 播放完了，重新播放
                }
                play(videoList);
            };
        }

        video = $( "#video-zf" ).get( 0 );
        video.src = videoList[ play.current ];
        video.load(); // 如果短的话，可以加载完成之后再播放，监听 canplaythrough 事件即可
        if ( play.current != 0 ) {
            video.play();
        }
    }


    function changeRank() {
        var $chkbox,
            $item,
            data
        ;

        data = [
            { "黄陂": "567890", "东西湖": "456789", "江岸": "345678", "新洲": "234567", "青山": "123456"  },
            { "江汉": "567891", "硚口": "456781", "武昌": "345671", "洪山": "234561", "汉阳": "123451"  },
            { "东新": "567892", "沌口": "456782", "蔡甸": "345672", "江夏": "234562", "汉阳": "123452"  }
        ];
        $chkbox = $( ".chkbox-list-ajpm" );
        $item = $( ".ajpm-list .rank-item" );

        $chkbox.on( "click", ".chkbox-item", function() {
            var $this,
                index,
                dataItem,
                count,
                lab,
                cont
            ;
            $this = $( this );
            index = $this.index();
            dataItem = data[ index ];
            count = 0;
            for ( lab in dataItem ) {
                if ( ! dataItem.hasOwnProperty( lab ) ) {
                    continue;
                }
                cont = dataItem[ lab ];
                $item.eq( count ).find( ".lab" ).text( lab ).end().find( ".cont" ).text( cont );
                count++;
            }
            $this.addClass( "active" ).siblings().removeClass( "active" );
        } );
    }

    function drawPieChart(xsNum, xzNum) {
        var target,
            myChart,
            option
            ;

        target = $( "#ajzs-chart-pie" ).get(0);

        if ( ! target ) {
            return;
        }
        // 基于准备好的dom，初始化echarts实例
        myChart = echarts.init( target );


        option = {
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            series : [
                {
                    name: '案卷总数',
                    type: 'pie',
                    radius : '70%',
                    center: ['50%', '50%'],
                    data:[
                        {value: xsNum, name:'刑事案件'},
                        {value: xzNum, name:'行政案件'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    label: {
                        normal: {
                            position: "inside",
                            formatter: '{c}'
                        }
                    }

                }
            ],
            color:['#0c6cce', '#ffb638']
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }

    function animateEles () {
        var $mapAreaItem,
            $mapSectorList,
            $mapSectorItem,
            $mapSectorText,
            rotateDeg
        ;

        $mapAreaItem = $( ".map-area-item" );
        $mapSectorList = $( ".map-sector-list" );
        $mapSectorItem = $( ".map-sector-item" );
        $mapSectorText = $( ".map-sector-text" )

        rotateDeg = 0;

        $( ".top" ).addClass( "animated bounceInDown" );
        $( ".header" ).addClass( "animated lightSpeedIn" );
        $( ".map-center" ).addClass( "animated rotateIn" );

        $( ".module-1-1" ).addClass( "animated bounceInLeft" );
        $( ".module-1-2" ).addClass( "animated bounceInRight" );
        $( ".module-2-1" ).addClass( "animated bounceInLeft" );
        $( ".module-2-2" ).addClass( "animated bounceInRight" );
        $( ".module-3-1" ).addClass( "animated bounceInUp" );
        $( ".module-3-2" ).addClass( "animated bounceInUp" );
        $( ".module-3-3" ).addClass( "animated bounceInUp" );


        $mapAreaItem.each( function( index ) {
            var animateClass
                ;
            switch ( index % 4 ) {
                case 0: { animateClass = "hover animated fadeInUpBig"; break; }
                case 1: { animateClass = "hover animated fadeInDownBig"; break; }
                case 2: { animateClass = "hover animated fadeInLeftBig"; break; }
                case 3: { animateClass = "hover animated fadeInRightBig"; break; }
            }
            $( this ).addClass( animateClass ).data( "animateClass", animateClass );
        } );

        setTimeout( function() {
            $mapAreaItem.each(function(){
                var $this
                    ;
                $this = $( this );
                $this.removeClass( $this.data( "animateClass" ) );
            })
        }, 1200 );

        $mapSectorItem.on( "mouseenter", function () {
            var $this,
                index,
                degree
                ;
            // &:nth-child(1) { transform : rotate(12+24*0deg); }
            $this = $( this );
            index = $this.index();
            degree = 360 - ( 12 + index * 24 );
            $this.find(".map-sector-text").css( "transform", "rotate(" + degree + "deg)" );
        } ).on( "mouseleave", function() {
            $(this).find(".map-sector-text").css( "transform", "rotate(0deg)" );
        } ).on( "click", function() {
            $( this ).addClass( "active" ).siblings().removeClass( "active" );
        } );

        $( ".map-sector-control" ).on( "click", function() {
            $mapSectorItem.trigger( "mouseenter" ).off( "mouseleave" );
            $( this ).hide(500);
        } );

        // animate .function-list
        $( ".function-list" ).find( "a" ).hover(
            function fnOver() {
                $( this ).addClass( "animated pulse" );
            },
            function fnOut() {
                $( this ).removeClass( "animated pulse" );
            }
        );

        $( ".module-max" ).hover(
            function fnOver() {
                $( this ).addClass( "animated rotateIn" );
            },
            function fnOut() {
                $( this ).removeClass( "animated rotateIn" );
            }
        );

        $( ".chkbox-item" ).hover(
            function fnOver() {
                $( this ).addClass( "animated tada" );
            },
            function fnOut() {
                $( this ).removeClass( "animated tada" );
            }
        );
        $( ".room-item" ).hover(
            function fnOver() {
                $( this ).addClass( "animated pulse" );
            },
            function fnOut() {
                $( this ).removeClass( "animated pulse" );
            }
        );

    }

} );