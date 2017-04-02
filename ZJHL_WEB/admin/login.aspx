<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="haolian.admin.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="css/style.css"/>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		<script src="js/jquery-1.9.1.min.js"></script>        
        <script src="assets/layer/layer.js" type="text/javascript"></script>
<title>客提威电子商务KTV团购-后台登陆</title>
</head>

<body class="login-layout">
<div class="logintop">    
    <span>欢迎到客提威电子商务KTV团购</span>    
    <ul>
    <li><a href="../index.aspx">返回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    <div class="loginbody">
<div class="login-container">
	<div class="center">
	<h1>
									<i class="icon-leaf green"></i>
									<span class="orange">湛江浩联</span>
									<span class="white">后台管理系统</span>
								</h1>
								<h4 class="white">The Best Management System</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box widget-box no-border visible">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												管理员登陆
											</h4>

											<div class="login_icon"><img src="images/login.png" /></div>

											<form class="">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="登录名"  name="LoginName">
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码" name="Password">
															<i class="icon-lock"></i>
														</span>
													</label>

													<div class="space"></div>
													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace">
															<span class="lbl">保存密码</span>
														</label>

														<button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="login_btn">
															<i class="icon-key"></i>
															登陆
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">通知</span>
											</div>

											<div class="social-login center">
											本网站系统不再对IE8以下浏览器支持，请见谅。
											</div>
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
											

											
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->
							</div><!-- /position-relative -->
						</div>
                        </div>
                        <div class="loginbm">版权所有 &copy; 2017  <a href="">客提威电子商务KTV团购</a> </div><strong></strong>
</body>
</html>
<script>
    /*用户登陆*/
    function Login(username, passwrod) {
        /*前端发送AJAX请求获取后台数据*/
        $.ajax({
            /*AJAX请求类型*/
            type: 'POST',
            /*要通过AJAX访问的地址*/
            url: 'http://' + window.location.host + '/Ajax/data.aspx?action=Login&username=' + username + '&password=' + passwrod,
            /*AJAX访问后台成功,response为成功返回的数据*/
            success: function (response) {
                /*将JSON字符串转换成对象*/
                var obj = eval(response)[0];
                //判断用户名和密码是否正确
                if (obj != undefined) {
                    //保存登陆成功的用户数据到浏览器的本地储存
                    var userdata = JSON.stringify(obj);
                    //alert(userdata);
                    localStorage.setItem('userdata', userdata);
                    //显示登陆成功信息
                    layer.alert('登陆成功！', {
                        title: '系统登陆',
                        icon: 1,
                    });
                    location.href = "index.aspx";//跳到后台管理主页面
                    layer.close(index);//关闭窗口	

                }
                else 
                {
                    //用户名或密码不对
                    layer.alert('用户名或密码不正确！', {
                        title: '系统登陆',
                        icon: 0,
                    });
                }

            }
        });
    }
//登陆按钮单击事件
    $('#login_btn').on('click', function () {
        var num = 0;
        var str = "";
        //得到文本框的内容并遍历
        $("input[type$='text']").each(function (n) {
            if ($(this).val() == "") {
                //内容为空时提示信息
                layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                    title: '系统登陆',
                    icon: 0,
                });
                num++;
                return false;
            }
        });
        if (num > 0) { return false; }
        else {
            //到得输入的用户名
            var uname = $("input[name$='LoginName']").val();
            //得到输入的密码
            var pwd = $("input[name$='Password']").val();
            //执行登陆方法
            Login(uname,pwd);   
        }
    });
</script>
