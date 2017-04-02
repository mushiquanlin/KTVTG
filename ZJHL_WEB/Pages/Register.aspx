<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Login.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ZJHL_KTVTG.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../admin/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="../admin/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="../admin/assets/css/ace.min.css" />
		<link rel="stylesheet" href="../admin/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="../admin/assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="../admin/css/style.css"/>
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="../admin/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="../admin/assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="../admin/assets/js/html5shiv.js"></script>
		<script src="../admin/assets/js/respond.min.js"></script>
		<![endif]-->
		<script src="../admin/js/jquery-1.9.1.min.js"></script>        
        <script src="../admin/assets/layer/layer.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2 class="form-signin-heading text-center">会员注册</h2>
        <div class="container">
            <form >
                <div class="row">
                    <div class="col-md-4">
                        <label for="inputUserName" class="sr-only">请输入用户名</label>
                        <input type="text" id="inputUserName" class="form-control" placeholder="用户名" required autofocus>
                    </div>
                    <div class="col-md-4">
                        <label for="inputPassword" class="sr-only">请输入密码</label>
                        <input type="password" id="inputPassword" class="form-control" placeholder="密码" required>
                    </div>
                    <div class="col-md-4">
                        <label for="inputName" class="sr-only">客户名称</label>
                        <input type="text" id="inputName" class="form-control" placeholder="客户名称" required autofocus>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="inputPhone" class="sr-only">手机号码</label>
                        <input type="text" id="inputPhone" class="form-control" placeholder="手机号码" required autofocus>

                    </div>
                    <div class="col-md-4">
                        <label for="inputSex" class="sr-only">性别</label>
                        <input type="text" id="inputSex" class="form-control" placeholder="性别" required autofocus>

                    </div>
                    <div class="col-md-4">
                        <label for="inputAge" class="sr-only">年龄</label>
                        <input type="text" id="inputAge" class="form-control" placeholder="年龄" required autofocus>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="inputWeiXin" class="sr-only">微信</label>
                        <input type="text" id="inputWeiXin" class="form-control" placeholder="微信" required autofocus>
                    </div>
                    <div class="col-md-4">
                        <label for="inputRemark" class="sr-only">备注</label>
                        <input type="text" id="inputRemark" class="form-control" placeholder="备注" required autofocus>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="inputQQ" class="sr-only">QQ</label>
                        <input type="text" id="inputQQ" class="form-control" placeholder="QQ" required autofocus>
                    </div>
                    <div class="col-md-4">
                        <label for="inputMailBox" class="sr-only">邮箱</label>
                        <input type="email" id="inputMailBox" class="form-control" placeholder="邮箱" required autofocus>

                    </div>           
                </div>
                
                    <div class="col-md-4">
                        <button class="btn btn-lg btn-primary btn-block" type="button" onclick="doAction('../index.aspx')">返回首页</button>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-lg btn-success btn-block" type="button" onclick="doAction('../admin/login.aspx')">现在登陆</button>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-lg btn-primary btn-block" type="button"  onclick="register(this);">注册账号</button>
                    </div>
                </div>
            </form>
        </div> 
</asp:Content>
