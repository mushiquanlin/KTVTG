<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ZJHL_KTVTG.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">   
            <div class="col-md-4"></div>
            <div class="col-md-4">
            <form  class="form-signin">
            <h2 class="form-signin-heading">登陆系统</h2>
            <label for="inputUserName" class="sr-only">请输入用户名</label>
            <input type="text" id="inputUserName" class="form-control" placeholder="请输入用户名" required autofocus>
            <label for="inputPassword" class="sr-only">请输入密码</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="请输入密码" required>
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"> 记住我
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="button" onclick="doAction('Register.aspx')" >注册账号</button>
            <button class="btn btn-lg btn-success btn-block" type="button" onclick="login($('#inputUserName').val(), $('#inputPassword').val())">现在登陆</button>
        </form></div>
            <div class="col-md-4"></div>
            </div>

    </div>
</asp:Content>
