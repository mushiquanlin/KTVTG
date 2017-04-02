/**
 * 搜索方法
 */
function search() {
    var sel = $('#select_type').val();
    var content = $('#select_content').val();
    doSearch(sel, content);
}
/**
 * 执行搜索
 * @param {any} selectType  搜索类型
 * @param {any} selectContent 搜索内容
 */
function doSearch(selectType, selectContent) {
    //发送ajax请求到后台页面
    $.ajax({
        type: 'POST', //ajax请求类型 POST
        url: 'http://' + window.location.host + '/Ajax/data.aspx?action=Search&type=' + selectType + '&content=' + selectContent, //ajax请求的后台地址
        //请求成功后执行的方法
        success: function (response) {
            var container = $('#container');
            //声明分页无序列表
            var dataHtml = '<ul>';
            var data = eval(response);
            //动态生成无序列表
            $.each(data, function (index, item) {
                dataHtml += '<li><a href="' +
                            'http://www.metrox.com.cn' + '">'   +   item.Company + '</a></li>';
            });
            //无序列表结束
            dataHtml += '</ul>';
            //在分页控件前面添加生成的无序列表
            container.html("");
            container.html(dataHtml);
        }
    });
}
/**
 * url跳转方法
 * @param {any} url //要跳转的地址
 */
function doAction(url) {
    window.location.href = url;
}
/**
 * 登陆方法
 * @param {any} username 用户名
 * @param {any} password 密码
 */
function login(username, password) {
    ////发送ajax请求到后台页面
    $.ajax({
        type: 'POST',  //ajax请求类型 POST
        url: 'http://' + window.location.host + '/Ajax/data.aspx?action=Login&username=' + username + '&password=' + password, //ajax请求的后台地址
        //发送请求成功后执行的方法
        success: function (response) {
            //存储到sessionStorage
            sessionStorage.setItem('LoginUser', response);
            //将请求返回的字符串转换Json对象
            var obj = eval((response));
            if (obj.length > 0) {
                //跳到主页
                doAction('../index.aspx')
            }
            else {
                //提醒错误信息
                alert('用户名或者密码不正确！');
            }
        }
    });

}
/**
 * 注册用户
 * @param {any} me 注册按钮对象
 */
function register(me) {
    //得到文本框的内容并遍历
    $("input[type$='text']").each(function (n) {
        if ($(this).val() == "") {
            //内容为空时提示信息
            layer.alert($(this).attr("placeholder") + "不能为空！\r\n", {
                title: '系统登陆',
                icon: 0,
            });
            return false;
        }
    });
    //用户注册的信息
    var user = {
        "Name": $('#inputUserName').val(),
        "NikeName": $('#inputName').val(),
        "Phone": $('#inputPhone').val(),
        "Sex": $('#inputSex').val(),
        "Remark": $('#inputRemark').val(),
        "QQ": $('#inputQQ').val(),
        "MailBox": $('#inputMailBox').val(),
        "Age": $('#inputAge').val(),
        "Password": $('#inputPassword').val(),
        "WeiXin": $('#inputWeiXin').val()
    };
    //判断用户填入的数据是否为空
    if (user.UserName === '' || user.Name === '' || user.Age === '' || user.Phone === '' || user.Sex === '' || user.Remark === '' || user.QQ === '' || user.MailBox === '' || user.Password === '' || user.inputWeiXin === '' ) {
        return;
    }

    /*前端发送AJAX请求将用户注册的数据送到后台*/
    $.ajax({
        /*AJAX请求类型*/
        type: 'POST',
        /*要通过AJAX访问的地址*/
        url: 'http://' + window.location.host + '/Ajax/data.aspx?action=AddUser' + '&userjson=' + JSON.stringify(user),
        /*AJAX访问后台成功,response为成功返回的数据*/
        success: function (response) {
            if (response === 'True') {
                layer.open({
                    title: '注册',
                    content: '恭喜你,注册成功！',
                    yes: function (index, layero) {
                        doAction('../admin/login.aspx');
                        layer.close(index); //如果设定了yes回调，需进行手工关闭
                    }
                });
               
            } else {
                layer.msg("注册失败！！！", { icon: 1, time: 3000 });
            }
        }
    });
}
/**
 * 添加用户
 */
function adduser() {
    //用户信息
    var user = {
        "Name": $('#inputName').val(),
        "Password": $('#inputPassword').val(),
        "Phone": $('#inputPhone').val(),
        "MailBox": $('#inputMailBox').val(),
        "QQ": $('#inputQQ').val(),
        "WeiXin": $('#inputWeiXin').val(),
    };
    /*前端发送AJAX请求获取后台数据*/
    $.ajax({
        /*AJAX请求类型*/
        type: 'POST',
        /*要通过AJAX访问的地址*/
        url: 'http://' + window.location.host + '/data.aspx?action=AddUser' + '&userjson=' + JSON.stringify(user),
        /*AJAX访问后台成功,response为成功返回的数据*/
        success: function (response) {
            if (response === 'True') {
                alert('添加用户成功');
            } else {
                alert('添加用户失败！！！');
            }
        }
    });
}
/**
 * 百度搜索功能
 * @param {any} formname
 */
function g(formname) {
    var url = "http://www.baidu.com/baidu";
    if (
        formname.s[1].checked) {
        formname.ct.value = "2097152";
    }
    else {
        formname.ct.value = "0";
    }
    formname.action = url;
    return true;
}
/**
*页面默认执行入口点方法
*/
$(function () {
    var page = window.location.pathname;
    var user = eval((sessionStorage.getItem('LoginUser')));
    if (page == '/index.aspx' && user.length > 0) {
        $(".right").hide();
        $("#adverst_box").show();
        //保存用户信息到window对象
        window.LoginedUser = user[0].Name;
        window.LoginedId = user[0].Id;
        //显示登陆用户信息
        $("#rightmenu").append(' <li class="right" id="loginuser"><a href="#">欢迎你,' + user[0].NikeName + '</a></li>');
        $("#rightmenu").append(' <li class="right" id="logoff"><a href="#" onclick="Logoff();">注销</a></li>');
        $("#hl_edit").append('<div id="editor"></div>');
        //初始化编辑器
        initSample();
    }

    $("#mainmenu > li").on('click', function () {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
    });
});

/**
 * 注销登陆
 */
function Logoff() {
    //从会话存储删除用户信息
    sessionStorage.removeItem('LoginUser');
    //显示登陆和注册
    $(".right").show();
    $('#loginuser').remove();
    //删除注销
    $('#logoff').remove();
    $('#hl_edit').hide();
    $("#adverst_box").hide();
    //注销后转到主页
    var url = window.location.host;
    window.location.href = url;
}
/**
 * 发布广告
 */
function publishAdvertisement() {
    //得到广告标题
    var advertise_title = $('#AdvertisementTitle').val();
    //判断广告标题是否为空
    if (advertise_title === '') {
        alert('请填写广告标题！');
        return;
    }
    //得到广告内容
    var advertise_content = CKEDITOR.instances.editor.getData();
    //判断广告内容是否为空
    if (advertise_content === '') {
        alert('请填写广告内容！');
        return;
    }
    //广告信息
    var adviertisement = {
        "Name": window.LoginedUser + '_' + advertise_title,
        "Title": advertise_title,
        "GG_Image": '',
        "GG_Content":encodeURI( advertise_content),
        "CreateDate": new Date().Format('yyyy-MM-dd hh:mm:ss.S'),
        "CreateId": LoginedId,
    };
    //转换广告信息为JSON格式
    var data = {
        "json": JSON.stringify(adviertisement)
    };
    /*前端发送AJAX请求，并保存广告信息到后台*/
    $.ajax({
        /*AJAX请求类型*/
        type: 'POST',
        /*要通过AJAX访问的地址*/
        url: 'http://' + window.location.host + '/Ajax/data.aspx?action=Add_Adviertisement',
        data: data,
        /*AJAX访问后台成功,response为成功返回的数据*/
        success: function (response) {
            if (response === 'True') {
                //alert('广告数据插入成功');
                //广告信息发布成功后，清空标题的文字
                $('#AdvertisementTitle').val('');
                //广告信息发布成功后，清空广告内容的文字
                CKEDITOR.instances.editor.setData('');
                doAction('../Pages/AdList.aspx');
            } else {
                alert('广告数据插入失败！！！');
            }
        }
    });


}




/*
* 对Date的扩展，将 Date 转化为指定格式的String
* 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
* 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
* 例子： 
* (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
* (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
*
*/
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}