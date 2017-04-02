using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZJHL_KTVTG
{
    public partial class data : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            var k = new HaoLianDAL.SqlDAL();
            if (Request.Params["action"] == "fileupload")
            {
                //得到文件名
                var filename = Request.Files[0].FileName;
                //得到文件类型
                var filetype =  Request.Files[0].ContentType;
                //得到编辑器回调序号
                var editorFuncNum = Request.Params["CKEditorFuncNum"];

                //生成脚本到前端，回传文件地址给编辑器
                ClientScriptManager cs = ClientScript;

                var fileExt = "";
                switch (filetype)
                {
                    case "image/jpeg":
                        fileExt = ".jpg";
                        break;
                    case "image/png":
                        fileExt = ".png";
                        break;
                    case "image/gif":
                        fileExt = ".gif";
                        break;
                    case "image/bmp":
                        fileExt = ".bmp";
                        break;
                    default:
                       
                        break;

                }
                //重全名文件
                filename = Guid.NewGuid().ToString() + fileExt;
                //文件完整保存地址
                var filepath = Server.MapPath("~/upload/") + filename;
                //保存文件到服务器
                Request.Files[0].SaveAs(filepath);
                var exts = new string[] { ".jpg",".gif",".png",".bmp"};
                var uploadpath = "/upload/";
                //如果文件格式正确返回文件路径，否则返回提示信息
                var script = exts.Contains(fileExt) ? @"window.parent.CKEDITOR.tools.callFunction(" + editorFuncNum + ",'" + uploadpath + filename + "','')" :
                        @"window.parent.CKEDITOR.tools.callFunction(" + editorFuncNum + ",''," + "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');";
                var key = "upload" + editorFuncNum;
                if (!cs.IsStartupScriptRegistered(key))
                {
                    //注册脚本到浏览器
                    cs.RegisterStartupScript(this.GetType(), key, "<script type=\"text/javascript\">" + script + "</script>");
                }

            }
            if (Request.Params["action"] == "swfupload")
            {
                //得到文件名
                var filename = Request.Files[0].FileName;
                //得到文件类型
                var filetype = Request.Files[0].ContentType;
                
                //重全名文件
                var newfilename = Guid.NewGuid().ToString() ;
                //文件完整保存地址
                var filepath = "/admin/upload/" +newfilename + "_" + filename;
                var filepath_server = Server.MapPath("~" + filepath);
                //保存文件到服务器
                Request.Files[0].SaveAs(filepath_server);
                Response.Clear();
                Response.Write($"{{path:\"{filepath}\",width:{200},height:{100}}}");
                Response.End();
                

            }
            if (Request.Params["action"] == "GetCustomer")
            {
                var number = int.Parse(Request.Params["number"]);
                var pgsize = int.Parse(Request.Params["pgsize"]);
                GetCustomer(number,pgsize);
            }
            //判断前端传入的请求字符串action的值是否为Login
            if (Request.Params["action"] == "Login")
            {
                //得到前端传入的请求字符串名为username的值
                var username = Request.Params["username"];
                //得到前端传入的请求字符串名为password的值
                var password = Request.Params["password"];
                //调用数据访问类中的用户登陆方法，并传入用户名和密码
                Login(username, password);
            }

            //添加客户信息
            if (Request.Params["action"] == "AddCustomer")
            {
                //得到前端传入的客户JSON数据
                var customerJson = Request.Params["customejson"];
                //将数据写入到数据库表中
                AddCustomer(customerJson);
            }
            //添加用户信息
            if (Request.Params["action"] == "AddUser")
            {
                //得到前端传入的客户JSON数据
                var userJson = Request.Params["userjson"];
                var tmp = "";
                foreach (var item in Request.Form.Keys)
                {
                    tmp += $"\"{item}\":\"{Request.Form[item.ToString()]}\"" + ",";   
                }
                tmp = tmp.Length > 0 ? $"{{{tmp.Substring(0,tmp.Length-1)}}}" : "";

                userJson = userJson ?? tmp;
                //将数据写入到数据库表中
                AddUser(userJson);
            }
            //根据用户编号删除用户信息
            if (Request.Params["action"] == "DeleteUsersByID")
            {
                //得到前端传入用户编号
                var id = Request.Params["userid"];
                //删除用户
                DeleteUsersByID(id);
            }

            
            //根据用户编号列表删除选中用户信息
            if (Request.Params["action"] == "DeleteUsersByIdList")
            {
                //得到前端传入用户编号
                var ids = Request.Params["userids"];
                //删除选中用户
                DeleteUsersByIdList(ids);
            }
            //添加广告信息
            if (Request.Params["action"] == "Add_Adviertisement")
            {
                //得到前端传入的客户JSON数据
                var json = Request.Params["json"];
                //将数据写入到数据库表中
                AddAdviertisement(json);
            }
            //添加站内搜索功能
            if (Request.Params["action"] == "Search")
            {
                //得到前端传入的搜索类型与内容
                var selectType = Request.Params["type"];
                var selectContent = Request.Params["content"];
                //执行搜索
                DoSearch(selectType,selectContent);
            }
            if (Request.Params["action"] == "GetAdvertisement")
            {
                var number = int.Parse(Request.Params["number"]);
                var pgsize = int.Parse(Request.Params["pgsize"]);
                GetAdvertisement(number, pgsize);
            }

            if (Request.Params["action"] == "GetSystemLogs")
            {
                var number = int.Parse(Request.Params["number"]);
                var pgsize = int.Parse(Request.Params["pgsize"]);
                GetSystemLogs(number,pgsize);
            }

            if (Request.Params["action"] == "ChangePassword")
            {
                var oldpwd = Request.Params["old"];
                var newpwd = Request.Params["new"];
                ChangePassword(oldpwd, newpwd);
            }

            if (Request.Params["action"] == "UpdateUserInfo")
            {
                var data = Request.Params["data"];
                UpdateUserInfo(data);
            }

            if (Request.Params["action"] == "GetUsers")
            {
                var number = int.Parse(Request.Params["number"]);
                var pgsize = int.Parse(Request.Params["pgsize"]);
                var where = Request.Params["where"];
                GetUsers(number, pgsize,where);
            }
        }

        private void DeleteUsersByIdList(string ids)
        {
            //删除选中用户
            var result = HaoLianDAL.SqlDAL.DeleteUsersByIdList(ids);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }

        private void DeleteUsersByID(string id)
        {
            //删除单个用户
            var result = HaoLianDAL.SqlDAL.DeleteUsersByID(id);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }


        /// <summary>
        /// 获取客户分页信息
        /// </summary>
        /// <param name="number">当前页码</param>
        /// <param name="pgsize">当前页数据条数</param>
        protected void  GetCustomer(int number,int pgsize)
        {
            //获取客户分页信息
            var result = HaoLianDAL.SqlDAL.GetCustomer(number,pgsize);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }
        /// <summary>
        /// 获取广告分页信息
        /// </summary>
        /// <param name="number">当前页码</param>
        /// <param name="pgsize">当前页数据条数</param>
        protected void GetAdvertisement(int number, int pgsize)
        {
            //获取客户分页信息
            var result = HaoLianDAL.SqlDAL.GetAdvertisement(number, pgsize);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }
        /// <summary>
        /// 用户登陆
        /// </summary>
        /// <param name="username">用户名</param>
        /// <param name="password">密码</param>
        protected void Login(string username, string password)
        {
            //获取用户登陆结果
            var result = HaoLianDAL.SqlDAL.Login(username, password);
            HaoLianDAL.SqlDAL.WriteSysLog("admin", 1, "登陆成功", "广东湛江", "127.0.0.1", DateTime.Now);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
            
        }
        /// <summary>
        /// 添加客户信息
        /// </summary>
        /// <param name="customerJson">客户信息JSON数据</param>
        protected void AddCustomer(string customerJson)
        {
            //获取用户登陆结果
            var result = HaoLianDAL.SqlDAL.AddCustomer(customerJson);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }
        /// <summary>
        /// 添加用户信息
        /// </summary>
        /// <param name="customerJson">用户信息JSON数据</param>
        protected void AddUser(string userJson)
        {
            //获取用户登陆结果
            var result = HaoLianDAL.SqlDAL.AddUser(userJson);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }

        /// <summary>
        /// 添加广告信息
        /// </summary>
        /// <param name="json">广告信息JSON数据</param>
        protected void AddAdviertisement(string json)
        {
            //获取用户登陆结果
            var result = HaoLianDAL.SqlDAL.AddAdviertisement(json);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }

        /// <summary>
        /// 搜索功能
        /// </summary>
        /// <param name="selectType"></param>
        /// <param name="selectContent"></param>
        protected void DoSearch(string selectType,string selectContent)
        {
            //获取用户登陆结果
            var result = HaoLianDAL.SqlDAL.DoSearch(selectType, selectContent);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }

        /// <summary>
        /// 获取系统日志结果
        /// </summary>
        /// <param name="number"></param>
        /// <param name="pgsize"></param>
        protected void GetSystemLogs(int number, int pgsize)
        {
            //获取系统日志结果
            var result = HaoLianDAL.SqlDAL.GetSystemLogs( number,  pgsize);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="oldpwd"></param>
        /// <param name="newpwd"></param>
        protected void ChangePassword(string oldpwd,string newpwd)
        {
            //获取密码结果
            var result = HaoLianDAL.SqlDAL.ChangePassword(oldpwd, newpwd);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }

        /// <summary>
        /// 更新用户信息
        /// </summary>
        /// <param name="data"></param>
        protected void UpdateUserInfo(string data)
        {
            //获取更新用户结果
            var result = HaoLianDAL.SqlDAL.UpdateUserInfo(data);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }

        /// <summary>
        /// 获取系统用户列表
        /// </summary>
        /// <param name="number"></param>
        /// <param name="pgsize"></param>
        protected void GetUsers(int number, int pgsize,string where)
        {
            //获取系统用户列表
            var result = HaoLianDAL.SqlDAL.GetUsers(number, pgsize,where);
            //将返回的数据写到浏览器
            Response.Clear();
            Response.Write(result);
            Response.End();
        }
    }
}