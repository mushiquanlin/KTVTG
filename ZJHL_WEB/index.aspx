<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="haolian.index" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客提威电子商务KTV团购</title>
    <meta charset="utf-8" />
    <meta name="keywords" content="广告,招牌,灯箱,喷画,内外各种字,企业形象设计,标志设计及申报注册,室内,室外,规划,园林,设计出图,维护及工程施工,装修,水电,灯饰,电焊,防水,补漏,门窗,高空作业,楼梯扶手及护栏,浩奇防水系列产品及防水工程施工,湛江市浩联文化传播有限公司" />
    <meta name="description" content="湛江市浩联文化传播有限公司于2015年2月6日在湛江工商局登记注册，业务经理是赵浩，我公司的办公地址位于粤西和北部湾经济圈的经济中心湛江，湛江市赤坎区椹川大道24号之一（棉织厂对面）402室，我们有最好的产品和专业的销售和技术团队，公司发展迅速，我们为客户提供最好的产品、良好的技术支持、健全的售后服务，湛江市浩联文化传播有限公司是湛江文化艺术业行业知名企业，如果您对我公司的产品服务有兴趣，请在线留言或者来电咨询。" />
    <style type="text/css">
        /*整个HTML文档样式*/

        body {
            margin: 0;
            padding: 0;
        }

        input {
            border-radius: 5px;
            font-size: 22px;
        }
        /*链接标签样式*/
        a {
            text-decoration: none;
            color: #939393;
        }
            /*鼠标移动到链接标签时的样式*/
            a:hover {
                color: #fff;
            }
        /*菜单样式*/
        .header-menu {
            height: 38px;
            width: auto;
            background-image: url("image/hl_bg.png");
            background-repeat: repeat-x;
        }

            .header-menu ul {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .header-menu li {
                float: left;
                margin-right: 38px;
                font-family: 'Microsoft YaHei UI';
                font-size: large;
                color: #939393;
                cursor: pointer;
                padding: 5px;
            }
                /*鼠标移动到菜单时的样式*/
                .header-menu li:hover {
                    background-color: #939393;
                    color: #fff;
                    border-radius: 5px;
                }
        /*公司LOGO样式*/
        .header-logo {
            height: 100px;
            width: auto;
            background-image: url("image/hl_bg_100.png");
            background-repeat: repeat-x;
        }
        /*中间部分样式*/
        .center {
            width: auto;
            height: 488px;
            background-color: #d3d3d3;
        }
        /*页脚部分样式*/
        .footer {
            height: 300px;
            width: auto;
            background-color: #dbdbdb;
        }
        /*红色LOGO右边浩联文化图片样式*/
        .logo-left {
            height: 100px;
            width: 500px;
            background-image: url("image/h1_logo_company.png");
            background-repeat: no-repeat;
            float: left;
        }
        /*卓越品质-全心服务样式*/
        .logo-right {
            height: 100px;
            width: 350px;
            background-image: url("image/hl_url.png");
            background-repeat: no-repeat;
            float: right;
        }
        /*左边红色LOGO样式*/
        .logo-red {
            height: 80px;
            width: 80px;
            padding-top: 10px;
            padding-left: 10px;
            background-repeat: no-repeat;
            float: left;
        }

        .contaner {
            font-family: 'Microsoft YaHei UI';
            font-size: large;
            color: #fff;
            padding: 5px;
            padding-left: 40px;
        }

        .service {
            text-align: center;
            font-family: 'Microsoft YaHei UI';
            font-size: large;
            color: #939393;
            cursor: pointer;
        }

            .service:hover {
                font-size: x-large;
                color: #636363;
            }
    </style>
    <!--<link href="assets/css/style.css" rel="stylesheet" />
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/slider.js"></script>-->

    <link href="css/owl.carousel.css" rel="stylesheet" />
    <link href="css/owl.theme.css" rel="stylesheet" />
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        .scroll-outer {
            height: 421px;
            background: url(images/bg.jpg) 50% 0 no-repeat;
        }

        #scroll {
            width: 1080px;
            margin: 0 auto;
            padding-top: 30px;
            font-family: "Microsoft Yahei";
        }

            #scroll .owl-wrapper-outer {
                margin: 0 auto;
            }

            #scroll .item {
                position: relative;
                width: 250px;
                height: 339px;
                margin: 0 auto;
                background-color: #fff;
                overflow: hidden;
            }

            #scroll .shd {
                position: absolute;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.15);
            }

                #scroll .shd a {
                    display: block;
                    width: 250px;
                    height: 239px;
                    *background-image: url(about:blank);
                    background-image: url(about:blank);
                }

            #scroll .txt {
                position: absolute;
                left: 0;
                bottom: 0;
                width: 226px;
                height: 100px;
                padding: 0 12px;
                color: #888;
                box-shadow: 0 0 15px 15px rgba(228, 233, 238, 0.95);
                background-color: #e4e9ee\9;
                background-color: rgba(228, 233, 238, 0.95);
            }

            #scroll h3 {
                width: 226px;
                height: 25px;
                margin-bottom: 6px;
                padding-top: 6px;
                font: 700 18px/25px arial,"Microsoft Yahei";
                overflow: hidden;
            }

                #scroll h3 a {
                    color: #333;
                    text-decoration: none;
                }

                    #scroll h3 a:hover {
                        color: #338de6;
                    }

            #scroll p {
                width: 226px;
                height: 54px;
                line-height: 18px;
                font-size: 12px;
            }

            #scroll .item:hover .shd {
                background-color: rgba(0, 0, 0, 0);
            }

            #scroll .item:hover .txt {
                background-color: #fff\9;
                background-color: rgba(248, 249, 249, 0.95);
                box-shadow: 0 0 15px 15px rgba(248, 249, 249, 0.95);
            }

        .owl-theme .owl-controls .owl-buttons div {
            position: absolute;
            top: 180px;
            width: 30px;
            height: 60px;
            margin: 0;
            padding: 0;
            border-radius: 0;
            font: 60px/60px "宋体";
            background-color: transparent;
            overflow: hidden;
            _display: none;
        }

        .owl-theme .owl-controls .owl-buttons .owl-prev {
            left: -40px;
        }

        .owl-theme .owl-controls .owl-buttons .owl-next {
            right: -40px;
        }

        .owl-theme .owl-controls .owl-buttons .owl-prev:before {
            content: "<";
        }

        .owl-theme .owl-controls .owl-buttons .owl-next:before {
            content: ">";
        }
    </style>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/index.js"></script>
    <script type="text/javascript">
$(function(){
	$('#scroll').owlCarousel({
		items: 4,
		autoPlay: true,
		navigation: true,
		navigationText: ["",""],
		scrollPerPage: true
	});
});
    </script>

    <link href="assets/css/style.css" rel="stylesheet" />

</head>
<body>
    <!--头部菜单-->
    <div class="header-menu">
        <div style="width:auto;float:left;padding-top:3px;margin-left:130px;">
            <ul>
                <li><a href="index.aspx">公司首页</a></li>
                <li><a href="business.html">电脑教育培训班</a></li>
                <li><a href="chenggonganli.html">成功案例</a></li>
                <li><a href="zhaoshang.html">KTV团购招商</a></li>
                <li><a href="xinwenzx.html">新闻资信</a></li>
                <li><a href="aboutus.html">关于我们</a></li>
                <li><a href="contactus.html">联系我们</a></li>
                <li><a href="zxds.html">在线看视频</a></li>
                <li><a href="wangzsheji.html">个人企业网站设计制作</a></li>
                <li><a href="zhanjianjiah.html">中国环保设备湛江加火</a></li>
            </ul>
        </div>
        <div style="width:300px;float:right;padding-top:10px;">
            <div style="float:left;width:100px;">
                <div>
                    <strong>客服：</strong><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2385190513&amp;site=qq&amp;menu=yes" target="_blank"><img alt="点击这里给我发消息" border="0" src="http://wpa.qq.com/pa?p=2:2385190513:51" /></a><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=2385190513&amp;site=qq&amp;menu=yes" target="_blank"><img alt="点击这里给我发消息" border="0" src="http://wpa.qq.com/pa?p=2:2385190513:51" /></a>
                </div>
            </div>
            <div style="float:left;width:100px; font-family: 'Microsoft YaHei UI';font-size: small;color: #939393;">
                <span id="btn_reg" style="cursor:pointer;"><a href="Pages/Register.aspx">注册</a></span>&nbsp;|&nbsp;
                <span id="btn_login" style="cursor:pointer;"><a href="admin/login.aspx">登录</a></span>
            </div>
            <div style="float:left;width:100px;">
                <img src="image/cn.jpg" style="cursor:pointer;" />
                <img src="image/en.jpg" style="margin-left:5px;cursor:pointer;" />
            </div>

        </div>
    </div>
    <!--头部公司-->
    <div class="header-logo">

        <div class="logo-left"></div>
        <div class="logo-right"></div>
    </div>
            <div style="width:auto;float:left;padding-top:3px;margin-left:130px;clear:both;">
                <ul>
                    <li><a href="yinyue1.html"><font size="10" color="blue">在线音乐播放器</font></a></li>

                    </ul>
                    </div>
            <center>
                <div>
                    <SCRIPT language=javascript>function g(formname) { var url = "http://www.baidu.com/baidu"; if (formname.s[1].checked) { formname.ct.value = "2097152"; } else { formname.ct.value = "0"; } formname.action = url; return true; }</SCRIPT><form name="f1" onsubmit=" return g(this)"><table bgcolor="#FFFFFF" style="font-size:9pt;"><tr height="80" ;width="1920" ;><td valign="top"><img src="http://img.baidu.com/img/logo-137px.gif" border="0" alt="baidu"></td><td><input name=word size="30" maxlength="100"><input type="submit" value="百度搜索"><br><input name=tn type=hidden value="bds"><input name=cl type=hidden value="3"><input name=ct type=hidden><input name=si type=hidden value="www.baidu.com"><div class="mt10"><input name=s type=radio><font size="3" color="blue"> 互联网</font><input name=s type=radio checked><font size="3" color="blue">www.baidu.com</font>></div></td></tr></table></form>
                </div>
            </center>
            <!--中间部-->
            <div class="center">

                <!--动态图片部分-->
                <div style="height:388px;width:80px;">
                    <img src="image/cbb.jpg" style="display:block;" />
                    <img src="image/a.jpg" style="display:none;" />
                    <img src="image/c.jpg" style="display:none;" />
                </div>

            </div>
            <!--<div class="slider">
                    <div class="slider-container">
                        <div class="slider-wrapper">
                            <div class="slide"> <img src="assets/img/img1.jpg" width="1920" alt="jQuery Slider with CSS Transitions"> </div>
                            <div class="slide"> <img src="assets/img/img2.jpg" alt="jQuery Slider with CSS Transitions"> </div>
                            <div class="slide"> <img src="assets/img/img3.jpg" alt="jQuery Slider with CSS Transitions"> </div>
                            <div class="slide"> <img src="assets/img/img4.jpg" alt="jQuery Slider with CSS Transitions"> </div>
                        </div>
                        </div>
                    </div>
                <script type="text/javascript">
            (function() {
                Slider.init({
                    target: $('slider'),
                    time: 6000
                });
            })();
                </script>-->
            <!--站内搜索部分-->
            <div style="width:80%;height:50px;border:solid 1px #dbdbdb;border-radius:10px;margin:50px auto;">
                <div style="width:20%;height:30px;font-size:xx-large;color:#fff;float:left;padding-left:10px;padding-top:4px;">
                    <select name='faction' id="select_type" style='width:100%;height:42px;padding-top:4px ;font-size:x-large;border:solid 1px #dbdbdb;border-radius:5px; '>
                        <option value='searchall' selected>所有</option>
                        <option value='Marine products'>海产品</option>
                        <option value='news'>新闻</option>
                        <option value='list'>产品</option>
                        <option value='furniture'>家具</option>
                        <option value='hotel'>酒店</option>
                        <option value='An electric appliance'>电器</option>
                    </select>
                </div>
                <div style="width:67%;height:50px;font-size:xx-large;color:#fff;float:left;">
                    <input id="select_content" style="width:100%;height:40px;border:solid 1px #dbdbdb;padding:2px;margin: 2px 0px 2px 10px" type="text" />
                </div>
                <div style="width:10%;height:50px;background:#270;font-size:xx-large;color:#fff;float:right;border-top-right-radius:10px;border-bottom-right-radius:10px;"><div style="padding-top:5px;padding-left:20px;cursor:pointer;" onclick="search();">搜索</div></div>
            </div>
            <div id="container" class="header-menu" style="width:100%;list-style-type:none;padding:20px;margin:10px auto;"></div>
            <div style="width:100%;height:0;clear:both;"></div>



            <div style="text-align:center;height:30px;font-family:'Microsoft YaHei UI';font-size:xx-large;color:black;margin-top:10px;">团购服务分类</div>
            <div style="margin:0 auto;width:100%;">

                <p style="text-align: center">&nbsp;</p>
                <table align="center" border="0" cellpadding="1" cellspacing="10" class="head_nav">
                    <tbody>
                        <tr>
                            <td class="head_n_br">
                                <div class="header-menu" style="background-color:#fff;background-image:url(); ">
                                    <ul>
                                        <li class="redclass" id="menu1720000" style="text-align: center">
                                            <a href="wujinjiancjiaz.html"><font color="#04049c">瓷砖</font></a> <a href="wujinjiancjiaz.html"><font color="#04049c">装修 </font></a><a href="wujinjiancjiaz.html"><font color="#04049c">家居</font></a> <a href="wujinjiancjiaz.html"><font color="#04049c">装饰</font></a>
                                        </li>
                                        <li class="redclass" style="text-align: center">
                                            <a href="qicfuwu.html"><font color="#04049c">运输</font></a><a href="qicfuwu.html"><font color="#04049c">汽车 </font></a><a href="qicfuwu.html"><font color="#04049c">旅游 </font></a><a href="qicfuwu.html"><font color="#04049c">车配</font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href="jiancdengs.html"><font color="#04049c">建材</font></a><a href="jiancdengs.html"><font color="#04049c">五金 </font></a><a href="jiancdengs.html"><font color="#04049c">家具 </font></a><a href="jiancdengs.html"><font color="#04049c">灯饰</font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">清洁</font></a><a href=""><font color="#04049c"> 疏通 </font></a><a href=""><font color="#04049c">搬家 </font></a><a href=""><font color="#04049c">婚介 </font></a>
                                        </li>
                                        <li>
                                            <a href=""><font color="#04049c">职介 </font></a><a href=""><font color="#04049c">开锁 </font></a><a href=""><font color="#04049c">命理 </font></a><a href=""><font color="#04049c">收藏</font></a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td class="head_n_br">
                                <div class="header-menu" style="background-color:#fff;background-image:url();">
                                    <ul>
                                        <li id="menu3060000" style="text-align: center">
                                            <a href="xiuxyule.html"><font color="#04049c">按摩 </font></a><a href="xiuxyule.html"><font color="#04049c">美容 </font></a><a href="xiuxyule.html"><font color="#04049c">足浴 </font></a><a href="xiuxyule.html"><font color="#04049c">娱乐 </font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href="jiudian.html"><font color="#04049c">婚庆 </font></a><a href="jiudian.html"><font color="#04049c">餐饮 </font></a><a href="jiudian.html"><font color="#04049c">酒店 </font></a><a href="jiudian.html"><font color="#04049c">出国</font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href="jiaoyupeix.html"><font color="#04049c">教育 </font></a> <a href="jiaoyupeix.html"><font color="#04049c">健康 </font></a><a href="jiaoyupeix.html"><font color="#04049c">培训 </font></a><a href="jiaoyupeix.html"><font color="#04049c">文化 </font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">医疗 </font></a><a href=""><font color="#04049c">票务 </font></a><a href=""><font color="#04049c">建筑 </font></a><a href=""><font color="#04049c">工程 </font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">景观 </font></a><a href=""><font color="#04049c">安防</font></a> <a href=""><font color="#04049c">网络</font></a> <a href=""><font color="#04049c">工商</font></a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td class="head_n_br">
                                <div class="header-menu" style="background-color:#fff;background-image:url();">
                                    <ul>
                                        <li id="menu2810000" style="text-align: center">
                                            <a href="jiajudianqi.html"><font color="#04049c">橱柜 </font></a><a href="jiajudianqi.html"><font color="#04049c">电器 </font></a><a href="jiajudianqi.html"><font color="#04049c">衣柜</font></a> <a href="jiajudianqi.html"><font color="#04049c">家具</font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">金融 </font></a><a href=""><font color="#04049c">拍卖 </font></a><a href=""><font color="#04049c">法律 </font></a><a href="l"><font color="#04049c">调查 </font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href="ggao.html"><font color="#04049c">艺术画 </font></a><a href="ggao.html"><font color="#04049c">传媒 </font></a><a href="ggao.html"><font color="#04049c">广告 </font></a><a href="ggao.html"><font color="#04049c">摄影 </font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">庆典 </font></a><a href=""><font color="#04049c">会展 </font></a><a href=""><font color="#04049c">包装</font></a> <a href=""><font color="#04049c">印刷 </font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href="spin.html"><font color="#04049c">海鲜 </font></a><a href="spin.html"><font color="#04049c">茶叶 </font></a><a href="spin.html"><font color="#04049c">烟酒 </font></a><a href="spin.html"><font color="#04049c">食品</font></a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td class="head_n_br">
                                <div class="header-menu" style="background-color:#fff;background-image:url();">
                                    <ul>

                                        <li id="menu1460000" style="text-align: center">
                                            <a href="yinxiangdiannao.html"><font color="#04049c">电脑 </font></a><a href="yinxiangdiannao.html"><font color="#04049c">数码</font></a> <a href="yinxiangdiannao.html"><font color="#04049c">家电 </font></a><a href="yinxiangdiannao.html"><font color="#04049c">音响</font></a>

                                        <li>
                                            <a href=""><font color="#04049c">饮料 </font></a><a href=""><font color="#04049c">农产 </font></a><a href=""><font color="#04049c">日用 </font></a><a href=""><font color="#04049c">化妆</font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">服装 </font></a><a href=""><font color="#04049c">服饰 </font></a><a href=""><font color="#04049c">鞋帽 </font></a><a href=""><font color="#04049c">箱包</font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">母婴 </font></a><a href=""><font color="#04049c">饰品 </font></a><a href=""><font color="#04049c">礼品</font></a><a href=""><font color="#04049c"> 体育 </font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">玩具 </font></a><a href=""><font color="#04049c">牌具 </font></a><a href=""><font color="#04049c">办公 </font></a><a href=""><font color="#04049c">通讯 </font></a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td class="head_n_br">
                                <div class="header-menu" style="background-color:#fff;background-image:url();">
                                    <ul>
                                        <li id="menu1450000" style="text-align: center">
                                            <a href="jcdianqi.html"><font color="#04049c">设备</font></a> <a href="jcdianqi.html"><font color="#04049c">能源 </font></a><a href="jcdianqi.html"><font color="#04049c">冶金 </font></a><a href="jcdianqi.html"><font color="#04049c">照明</font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">橡塑 </font></a><a href=""><font color="#04049c">电子 </font></a><a href=""><font color="#04049c">仪器 </font></a><a href=""><font color="#04049c">电气</font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <a href=""><font color="#04049c">化工 </font></a><a href=""><font color="#04049c">交通 </font></a><a href=""><font color="#04049c">环保 </font></a><a href=""><font color="#04049c">纸业</font></a>
                                        </li>
                                        <li id="menu1270000" style="text-align: center">
                                            <a href=""><font color="#04049c">纺织</font></a> <a href=""><font color="#04049c">皮革 </font></a><a href=""><font color="#04049c">农资 </font></a><a href=""><font color="#04049c">农机 </font></a>
                                        </li>
                                        <li style="text-align: center">
                                            <div align="center"><a href=""><font color="#04049c">林木</font></a> <a href=""><font color="#04049c">养殖 </font></a><a href=""><font color="#04049c">渔业 </font></a><a href=""><font color="#04049c">家装</font></a></div>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p>
                    &nbsp;
                </p>
            </div>
            <!--<div class="slider">
                 <div class="slider-container">
                     <div class="slider-wrapper">
                         <div class="slide"> <img src="assets/p1.jpg" width="1920" alt="jQuery Slider with CSS Transitions"> </div></div></div></div>
             <div>-->
            <div class="slider">
                <div class="slider-container">
                    <div class="slider-wrapper">
                        <div class="slide"> <img src="assets/img/p1.jpg" alt="jQuery Slider with CSS Transitions"> </div>
                        <div class="slide"> <img src="assets/img/p2.jpg" alt="jQuery Slider with CSS Transitions"> </div>
                        <div class="slide"> <img src="assets/img/p3.jpg" alt="jQuery Slider with CSS Transitions"> </div>
                        <div class="slide"> <img src="assets/img/p4.jpg" alt="jQuery Slider with CSS Transitions"> </div>
                    </div>
                </div>
            </div>
            <script src="assets/js/jquery-1.8.3.min.js"></script>
            <script src="assets/js/slider.js"></script>
            <script type="text/javascript">
                (function () {
                    Slider.init({
                        target: $('.slider'),
                        time: 3000
                    });
                })();
            </script>
            <!--<div style="right:10px;bottom:10px;position:fixed">
                 <SCRIPT language=javascript>function g(formname) { var url = "http://www.baidu.com/baidu"; if (formname.s[1].checked) { formname.ct.value = "2097152"; } else { formname.ct.value = "0"; } formname.action = url; return true; }</SCRIPT><form name="f1" onsubmit="                        return g(this)"><table bgcolor="#FFFFFF" style="font-size:9pt;"><tr height="80" ;width="1920" ;><td valign="top"><img src="http://img.baidu.com/img/logo-137px.gif" border="0" alt="baidu"></td><td><input name=word size="30" maxlength="100"><input type="submit" value="百度搜索"><br><input name=tn type=hidden value="bds"><input name=cl type=hidden value="3"><input name=ct type=hidden><input name=si type=hidden value="www.baidu.com"><div class="mt10"><input name=s type=radio><font size="3" color="blue"> 互联网</font><input name=s type=radio checked><font size="3" color="blue">www.baidu.com<</font>></div></td></tr></table></form>
             </div>-->
            <!--服务范围部分-->
            <div style="text-align:center;height:30px;font-family:'Microsoft YaHei UI';font-size:xx-large;color:#04049c;margin-top:10px;">服务范围</div>
            <div style="height:240px;width:100%; padding-left:5%;padding-right:5%;padding-top:30px;padding-bottom:30px;">
                <div class="service" style="height: 230px; width: 28%; border: solid 1px #d3d3d3; border-radius: 5px; float: left; margin-right: 3%; background-image: url('images/q1.jpg');">
                    <div style="margin-top:50px;">
                        <font color="firebrick">批发销售</font>
                        <div class="header-menu">
                            <div style="width:auto;float:left;padding-top:3px;margin-left:60px;">
                                <div><font size="5" color="blue">Wholesale Sales</font></div>
                                <ul>
                                    <li><a href="haoqufshui.html"><font size="5" color="blue">浩奇防水</font></a></li>
                                    <li><a href=""><font size="5" color="blue">衣服</font></a></li>
                                    <li><a href="yjiu.html"><font size="5" color="blue">烟酒</font></a></li>
                                    <li><a href=""><font size="5" color="blue">音响</font></a></li>
                                    <li><a href=""><font size="5" color="blue">茶叶</font></a></li>
                                    <li><a href=""><font size="5" color="blue">数码电器</font></a></li>
                                    <li><a href=""><font size="5" color="blue">家具</font></a></li>
                                    <li><a href=""><font size="4" color="blue">化妆品</font></a></li>
                                    <li><a href=""><font size="4" color="blue">海产品</font></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="service" style="height: 230px; width: 28%; border: solid 1px #d3d3d3; border-radius: 5px; float: left; margin-right: 3%;background-image: url('images/3.jpg');">
                    <div style="margin-top:50px;"><font size="6" color="blue">厂房 商铺出租 &nbsp;工程、施工</font></div>
                    <div><font size="5" color="blue">Engineering, construction</font></div>
                    <div class="header-menu">
                        <ul>
                            <li><a href="fzcz.html"><font size="5" color="blue">厂房 商铺出租</font></a></li>
                            <li><a href=""></a></li>
                            <li><a href=""></a></li>
                            <li><a href=""></a></li>
                            <li><a href=""></a></li>
                            <li><a href=""></a></li>
                            <li><a href=""></a></li>
                            <li><a href=""></a></li>
                        </ul>
                    </div>
                </div>
                <div class="service" style="height: 230px; width: 28%; border: solid 1px #d3d3d3; border-radius: 5px; float: left; background-image: url('images/q1.jpg');">
                    <div style="margin-top:50px;"><font size="5" color="blue">广告设计制作</font></div>
                    <div><font size="5" color="blue">Advertising design</font></div>
                </div>
            </div>
            <link href="css/owl.carousel.css" rel="stylesheet" />
            <link href="css/owl.theme.css" rel="stylesheet" />
            <style type="text/css"></style>
          
            <script src="js/jquery-1.8.3.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>


            <div class="scroll-outer">
                <div id="scroll" class="owl-carousel">
                    <div class="item">
                        <img src="images/q1.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">客提威电子商务团购KTV</a></h3>
                            <p></p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/q2.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">客提威电子商务团购KTV</a></h3>
                            <p></p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/3.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">柳宗元铜像被拆除</a></h3>
                            <p>广西柳州投资7000万元修建柳宗元像，将成为国内最高的人物铜像，但由于资金不到位，仅完成底座和核心柱子就被拆除。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/4.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">越狱案逃犯高玉伦被抓获</a></h3>
                            <p>哈尔滨越狱案3名嫌犯之一，此前被判死刑，于9月11日下午17时许在延寿县青川乡被公安机关抓获。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/5.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">21世纪网收企业“保护费”</a></h3>
                            <p>2014年9月3日，21世纪网包括主编、副主编在内的相关人员，因涉嫌新闻敲诈被上海市公安局抓获。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/6.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">电子港澳通行证15日起启用</a></h3>
                            <p>2014年9月，公安部决定，全国公安机关出入境管理部门自9月15日起全面启用电子往来港澳通行证。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/7.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">“刀锋战士”枪杀女友非故意</a></h3>
                            <p>残疾人100、200、400米世界纪录保持者。因涉嫌枪杀女友受审，2014年9月11日，法院宣判其故意杀人罪不成立。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/8.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">苏格兰将举行独立公投</a></h3>
                            <p>苏格兰独立公投将于9月18日举行。9月10日英国首相前往苏格兰进行挽留，试图阻止公众在9月18日的公投中支持独立。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/9.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">特色词条：小熊猫</a></h3>
                            <p>躯体肥壮，身上披有粗长的毛，主要生活于海拔3000米以下有竹丛的地方，平日栖居于大的树洞或石洞中。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/1.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">港版iPhone 6发布</a></h3>
                            <p>苹果在2014年9月推出的新产品，4.7寸的iPhone6和5.5寸的iPhone 6 Plus携新广告文案“Bigger than Bigger”正式亮相。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/2.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">500万Gmail用户名密码泄露</a></h3>
                            <p>据美国CNN 9月10日报道，近500万个Gmail用户的账号密码被黑客发布到了俄罗斯的一个比特币论坛上。</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/3.jpg" alt="">
                        <div class="shd"><a href="http://www.17sucai.com/"></a></div>
                        <div class="txt">
                            <h3><a href="http://www.17sucai.com/">柳宗元铜像被拆除</a></h3>
                            <p>广西柳州投资7000万元修建柳宗元像，将成为国内最高的人物铜像，但由于资金不到位，仅完成底座和核心柱子就被拆除。</p>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $('#scroll').owlCarousel({
                        items: 4,
                        autoPlay: true,
                        navigation: true,
                        navigationText: ["", ""],
                        scrollPerPage: true
                    });
                });
            </script>

            <!--成功案例-->
            <div style="                    t
                    ext-align:cente r;he
                    ight:38px;font -famiy:'icrosoft
                aHei UI';font-size:xx-large;color:#939393;margin-top:5px;padding-bottom:5px;border-bottom:solid 1px #dbdbdb;">成功案例</div>
            <div style="height:400px;">
                <div>
                    <div style="height:38px;width:100%; padding-left:5%;padding-right:5%;padding-top:30px;padding-bottom:30px;">
                        <div class="service" style="height:35px;width:28%; border:solid 1px #d3d3d3;border-radius:5px;float:left;margin-right:3%;">
                            <div style="margin-top:5px;">
                                批发销售
                            </div>
                        </div>
                        <div class="service" style="height:35px;width:28%;border:solid 1px #d3d3d3;border-radius:5px;float:left;margin-right:3%;">
                            <div style="margin-top:5px;">工程、施工</div>
                        </div>
                        <div class="service" style="height:35px;width:28%;border:solid 1px #d3d3d3;border-radius:5px;float:left;">
                            <div style="margin-top:5px;">广告设计制作</div>
                        </div>
                    </div>
                </div>
                <div style="width:100%;padding-left:1%;padding-right:1%;">
                    <div style="width:23%;float:left;margin-right:2%;"><img src="image/a1.jpg" style="width:100%;height:300px;border-radius:8px;" /></div>
                    <div style="width:23%;float:left;margin-right:2%;"><img src="image/a2.jpg" style="width:100%;height:300px;border-radius:8px;" /></div>
                    <div style="width:23%;float:left;margin-right:2%;"><img src="image/a3.jpg" style="width:100%;height:300px;border-radius:8px;" /></div>
                    <div style="width:23%;float:left;"><img src="image/a4.jpg" style="width:100%;height:300px;border-radius:8px;" /></div>
                </div>
            </div>

            <div>
            </div>


            <div style="text-align:center;height:38px;font-family:'Microsoft YaHei UI';font-size:xx-large;color:#939393;margin-top:5px;padding-bottom:5px; border-bottom:solid 1px #dbdbdb;">关于我们</div>
            <div style="height:380px;width:100%;padding-left:5%;padding-right:5%;padding-top:10px;">
                <!--关于公司信息-->
                <div style="float:left; width:45%;height:360px;padding:10px; border:solid 1px #dbdbdb;border-radius:5px;">
                    <div style="width:20%;float:left;">
                        <img src="image/builing.jpg" />
                    </div>
                    <div style="width:58%;height:360px;float:right;font-family:'Microsoft YaHei UI';font-size:medium;color:#939393;">
                        湛江市浩联文化传播有限公司于2015年2月6日在湛江工商局登记注册，业务经理是赵浩，公司注册资本未提供，我公司的办公地址位于粤西和北部湾经济圈的经济中心湛江，湛江市赤坎区椹川大道24号之一（棉织厂对面）402、403室，我们有最好的产品和专业的销售和技术团队，公司发展迅速，我们为客户提供最好的产品、良好的技术支持、健全的售后服务，湛江市浩联文化传播有限公司是湛江文化艺术业行业知名企业，如果您对我公司的产品服务有兴趣，请在线留言或者来电咨询。
                    </div>
                </div>
                <!--新闻资讯-->
                <div style="float:left; width:45%;height:360px;padding:10px; border:solid 1px #dbdbdb;border-radius:5px;">
                    <div style="font-family:'Microsoft YaHei UI';font-size:xx-large;color:#939393;">新闻资讯</div>
                    <div style="float:left;font-family:'Microsoft YaHei UI';font-size:small;color:#939393;">
                        <div style="float:left;width:auto;padding-right:10px;"><img src="image/news.jpg" /></div>
                        <div style="border-bottom:solid 1px #d3d3d3;height:120px;">
                            <div style="font-size:large;color:#636363;padding-bottom:10px;">户外LED显示屏广告设计的六大要点</div>
                            <div>近年，随着智能手机的普及，各种手机应用的便利性不断扩大，人们的眼球正被那个...</div>
                            <div>更多>></div>
                        </div>
                    </div>
                    <div style="float:left;font-family:'Microsoft YaHei UI';font-size:medium;color:#939393;">
                        <div>户外LED显示屏广告设计的六大要点</div>
                        <div>发光字设计制作公司就选择浩联文化传播有限公司</div>
                        <div>户外广告的发展现状</div>
                        <div>做人：失信是最大的破产</div>
                        <div>如何选购防水材料</div>
                        <div>变形缝的防水构造处理</div>
                    </div>
                </div>
            </div>
            <!--友情链接-->
            <div style="text-align:center;height:30px;font-family:'Microsoft YaHei UI';font-size:x-large;color:#939393;margin-top:5px;padding-bottom:5px; border-bottom:solid 1px #dbdbdb;">友情链接</div>
            <div style="height:50px; text-align:center;padding:10px;margin-bottom:10px;">
                <div style="float:left;border:solid 1px #d3d3d3;height:50px;padding:5px;margin-right:10px;border-radius:5px;cursor:pointer;">
                    <a href="http://www.ljtianbao.me668.net/" target="_blank"><img src="image/tianbao.gif" style="height:45px;" />点击我跳转到田宝复合肥有限公司</a>
                </div>
                <div style="float:left;border:solid 1px #d3d3d3;height:50px;padding:5px;margin-right:10px;border-radius:5px;cursor:pointer;">
                    <a href="http://zjhaolian.me668.net/"> <img src="image/haolian.gif" style="height:45px;" /></a>
                </div>
            </div>

            <!--清除浮动超出范围-->
            <div style="clear:both;"></div>
            <!--页脚部-->
            <div class="footer">
                <!--联系方式和二维码部分-->
                <div>
                    <!--客户反馈信息-->
                    <div style="width:40%;height:300px;float:left;background-color:#939393;text-align:right;font-family:'Microsoft YaHei UI';color:#fff; font-size:small;">
                        <div style="padding-bottom:20px;padding-top:50px;padding-right:10px;">您有任何疑问都可以留下您的问题和联系方式<br />我们将有客服人员与您联系。</div>
                        <div style="padding-bottom:10px;padding-right:10px;">您的姓名<input type="text" id="submit_name" style="width:70%;margin-left:20px;height:26px;" /></div>
                        <div style="padding-bottom:10px;padding-right:10px;">您的电话<input type="text" id="submit_tel" style="width:70%;margin-left:20px;height:26px;" inputmode="numeric" /></div>
                        <div style="padding-bottom:10px;padding-right:10px;">您的需求<input type="text" id="submit_need" style="width:70%;margin-left:20px;height:80px;" /></div>
                    </div>
                    <!--联系信息-->
                    <div style="width:40%;height:300px;float:left;background-color:#939393;">
                        <div class="contaner" style="font-size:xx-large;">
                            <div style="padding-right:10px;padding-top:35px;">
                                <img src="image/phone.jpg" style="margin-right:15px;height:30px;"><span>联系我们</span>
                            </div>
                        </div>
                        <div class="contaner"></div>
                        <div class="contaner">湛江市浩联文化传播有限公司</div>
                        <div class="contaner">总经理：赵浩</div>
                        <div class="contaner">手&nbsp;&nbsp;&nbsp;机：13360127913</div>
                        <div class="contaner">电&nbsp;&nbsp;&nbsp;话：0769-3206368</div>
                        <div class="contaner">地&nbsp;&nbsp;&nbsp;址：湛江市赤坎区椹川大道北24号之一402房</div>
                    </div>
                    <!--二维码-->
                    <div style="width:20%;height:300px; float:right;background-color:#939393;">
                        <div style="padding:50px;">
                            <div><img src="image/qrcode.jpg" /></div>
                            <div style="text-align:center; font-family:'Microsoft YaHei UI';color:#fff; font-size:small;">[官方二维码]</div>
                        </div>
                    </div>
                </div>
            </div>
            <!--版权部分-->
            <div class="header-menu"
                 style="text-align:center;
           padding-top:15px;
           font-family:'Microsoft YaHei UI';
           font-size:large;
           color:#939393;">版权所有 &copy; 2005-2017 湛江市浩联文化传播有限公司　All Right Reserved</div>
</body>
</html>
