using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using MetroX.Common;
using System.Configuration;
namespace HaoLianDAL
{
    public class SqlDAL
    {
        public static  string connetStr = null;
        public SqlDAL()
        {
            connetStr = ConfigurationManager.AppSettings["connetStr"]; //从配置文件数据库连接字符串
        }
        /// <summary>
        /// 登陆时写入系统日志
        /// </summary>
        /// <param name="username">登陆用户</param>
        /// <param name="type">类型</param>
        /// <param name="message">消息</param>
        /// <param name="address">地址</param>
        /// <param name="ip">IP</param>
        /// <param name="logdate">日期</param>
        public static void WriteSysLog(string username, int type, string message, string address, string ip, DateTime logdate)
        {
            string result = "";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //声明SQL语句 
                string cmdtext = $"INSERT INTO ZJHL_SystemLogs(LogUser,LogType,LogContent,LogAddress,LogIP,LogDate)VALUES('{username}',{type},'{message}','{address}','{ip}',{"getdate()"})";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                cmd.ExecuteNonQuery();

            }
        }

        /// <summary>
        /// 获取客户分页信息
        /// </summary>
        /// <param name="number">当前页码</param>
        /// <param name="pgsize">当前页的数据条数</param>
        /// <returns></returns>
        public static string GetCustomer(int number,int pgsize)
        {
            string result = "";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //声明SQL语句 
                string cmdtext = " SELECT TOP " + pgsize + " * FROM ZJHL_Customers  WHERE ID NOT IN ( SELECT TOP (" + pgsize + " * (" + number + "-1)) ID FROM ZJHL_Customers  )";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                //执行SQL命令并返回SQL数据只读器(reader)
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("id");
                dt.Columns.Add("Name");
                dt.Columns.Add("UserName");
                dt.Columns.Add("Phone");
                dt.Columns.Add("Sex");
                dt.Columns.Add("Address");
                dt.Columns.Add("Area");
                dt.Columns.Add("Remark");
                dt.Columns.Add("Company");
                dt.Columns.Add("QQ");
                dt.Columns.Add("MailBox");
                dt.Columns.Add("Contact");
                dt.Columns.Add("Password");
                dt.Columns.Add("CompanyLogo");
                dt.Columns.Add("CompanyLogoMini");
                while (reader.Read())
                {
                    //读取数据
                    var id = reader.GetInt64(0);
                    var Name = reader.GetString(1);
                    var UserName = reader.GetString(2);
                    var Phone = reader.GetString(3);
                    var Sex = reader.GetBoolean(4);
                    var Address = reader.GetString(5);
                    var Area = reader.GetString(6);
                    var Remark = reader.GetString(7);
                    var Company = reader.GetString(8);
                    var QQ = reader.GetString(9);
                    var MailBox = reader.GetString(10);
                    var Contact = reader.GetString(11);
                    var Password = reader.GetString(12);
                    var CompanyLogo = reader.GetString(13);
                    var CompanyLogoMini = reader.GetString(14);
                    //为数据表添加列
                    dr = dt.NewRow();
                    //为数据行添加值 
                    dr["id"] = id;
                    dr["Name"] = Name;
                    dr["UserName"] = UserName;
                    dr["Phone"] = Phone;
                    dr["Sex"] = Sex;
                    dr["Address"] = Address;
                    dr["Area"] = Area;
                    dr["Remark"] = Remark;
                    dr["Company"] = Company;
                    dr["QQ"] = QQ;
                    dr["MailBox"] = MailBox;
                    dr["Contact"] = Contact;
                    dr["Password"] = Password;
                    dr["CompanyLogo"] = CompanyLogo;
                    dr["CompanyLogoMini"] = CompanyLogoMini;
                    //添加行到表格
                    dt.Rows.Add(dr);
                }
                result = JsonUnit.DataTableToJson(dt);
            }
            return  "{data:" +  result + "}";
        }
        /// <summary>
        /// 获取客户分页信息
        /// </summary>
        /// <param name="number">当前页码</param>
        /// <param name="pgsize">当前页的数据条数</param>
        /// <returns></returns>
        public static string GetAdvertisement(int number, int pgsize)
        {
            string result = "";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //声明SQL语句 
                string cmdtext = " SELECT TOP " + pgsize + " * FROM ZJHL_Adviertisements  WHERE ID NOT IN ( SELECT TOP (" + pgsize + " * (" + number + "-1)) ID FROM ZJHL_Adviertisements  )";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                //执行SQL命令并返回SQL数据只读器(reader)
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("id");
                dt.Columns.Add("Name");
                dt.Columns.Add("Title");
                dt.Columns.Add("GG_Image");
                dt.Columns.Add("GG_Content");
                dt.Columns.Add("CreateDate");
                dt.Columns.Add("CreateId");
                
                while (reader.Read())
                {
                    //读取数据
                    var id = reader.GetInt64(0);
                    var Name = reader.IsDBNull(1) ? "暂时没有填写名字" : reader.GetString(1);
                    var Title = reader.IsDBNull(2) ? "暂时没有填写标题" : reader.GetString(2);
                    var GG_Image = reader.IsDBNull(3) ? "暂时没有填写照片信息" : reader.GetString(3);
                    var GG_Content = reader.IsDBNull(4) ? "暂时没有填写广告内容" : reader.GetString(4);
                    var CreateDate = reader.IsDBNull(5) ? DateTime.Now : reader.GetDateTime(5);
                    var CreateId = reader.IsDBNull(6) ? -1 : reader.GetInt64(6);
                   
                    //为数据表添加列
                    dr = dt.NewRow();
                    //为数据行添加值 
                    dr["id"] = id;
                    dr["Name"] = Name;
                    dr["Title"] = Title;
                    dr["GG_Image"] = GG_Image;
                    dr["GG_Content"] = GG_Content;
                    dr["CreateDate"] = CreateDate;
                    dr["CreateId"] = CreateId;
                  
                    //添加行到表格
                    dt.Rows.Add(dr);
                }
                result = JsonUnit.DataTableToJson(dt);
            }
            return  result;
        }

        public static object DeleteUsersByID(string id)
        {
            //插入数据的结果
            bool result = false;
            //声明删除用户信息的语句
            var sql = $"DELETE FROM dbo.ZJHL_Users WHERE Id = {id}";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //实例化SQL命令执行对象，输入SQL语句(sql)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(sql, connect);
                //执行语句并返回执行结果的第一行第一列
                result = cmd.ExecuteNonQuery() > 0;

            }
            return result;
        }

        /// <summary>
        /// 删除选中用户
        /// </summary>
        /// <param name="ids">用户id列表</param>
        /// <returns></returns>
        public static object DeleteUsersByIdList(string ids)
        {
            //插入数据的结果
            bool result = false;
            //声明删除用户信息的语句
            var sql = $"DELETE FROM dbo.ZJHL_Users WHERE Id in ({ids})";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //实例化SQL命令执行对象，输入SQL语句(sql)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(sql, connect);
                //执行语句并返回执行结果的第一行第一列
                result = cmd.ExecuteNonQuery() > 0;

            }
            return result;
        }

        /// <summary>
        /// 用户登陆
        /// </summary>
        /// <param name="username">用户名</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public static string Login(string username,string password)
        {
            string result = "";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //声明SQL语句 
                string cmdtext = "SELECT * FROM  ZJHL_Users WHERE Name = '" + username + "' AND Password = '" + password + "'";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                //执行SQL命令并返回SQL数据只读器(reader)
                SqlDataReader reader = cmd.ExecuteReader();
                //声明并实例化数据表对象
                DataTable dt = new DataTable();
                //声明数据行对象
                DataRow dr;
                //为数据表添加列
                dt.Columns.Add("Id");
                dt.Columns.Add("Name");
                dt.Columns.Add("NikeName");
                dt.Columns.Add("Password");
                dt.Columns.Add("Phone");
                dt.Columns.Add("Email");
                dt.Columns.Add("QQ");
                dt.Columns.Add("WeiXin");
                dt.Columns.Add("CreateDate");
                dt.Columns.Add("UsetType");
                dt.Columns.Add("Age");
                dt.Columns.Add("Sex");
                //循环读取数据
                while (reader.Read())
                {
                    //读取数据
                    var id = reader.GetInt64(0);
                    var Name = reader.GetString(1);
                    var Password = reader.GetString(2);
                    var Phone = reader.GetString(3);
                    var Email = reader.GetString(4);
                    var QQ = reader.GetString(5);
                    var WeiXin = reader.GetString(6);
                    var CreateDate = reader.GetDateTime(7);
                    var UsetType = reader.IsDBNull(8) ? 0 : reader.GetInt32(8);
                    var NikeName = reader.GetString(9);
                    var Age = reader.GetInt32(10);
                    var Sex = reader.GetBoolean(11);
                    //为数据表添加行
                    dr = dt.NewRow();
                    //为数据行添加值 
                    dr["id"] = id;
                    dr["Name"] = Name;
                    dr["Password"] = Password;
                    dr["Phone"] = Phone;
                    dr["Email"] = Email;
                    dr["QQ"] = QQ;
                    dr["WeiXin"] = WeiXin;
                    dr["CreateDate"] = CreateDate;
                    dr["UsetType"] = UsetType;
                    dr["NikeName"] = NikeName;
                    dr["Age"] = Age;
                    dr["Sex"] = Sex;
                    //添加行到表格
                    dt.Rows.Add(dr);
                }
                //将数据表转换成JSON字符串
                result = JsonUnit.DataTableToJson(dt);
            }
            //返回JSON字符串
            return "{data:" + result + "}";

        }

        public static object UpdateUserInfo(string data)
        {
            int result = 0;
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                var obj =(Newtonsoft.Json.Linq.JObject) Newtonsoft.Json.JsonConvert.DeserializeObject(data);
                //声明SQL语句 
                string cmdtext = $@"UPDATE [dbo].[ZJHL_Users] SET  Name = '{obj["Name"]}'
                                                                  ,Phone = '{obj["Phone"]}'
                                                                  ,MailBox = '{obj["MailBox"]}'
                                                                  ,QQ = '{obj["QQ"]}'
                                                                  ,CreateDate = '{obj["CreateDate"]}'
                                                                  ,UsetType = '{obj["Role"]}'
                                                                  ,NikeName = '{obj["NikeName"]}'
                                                                  ,Age = {obj["Age"]}
                                                                  ,Sex = {obj["Sex"]} 
                                                                  WHERE ID = {obj["ID"]}";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                result = cmd.ExecuteNonQuery();
            }
            return result;
        }

        public static object ChangePassword(string oldpwd, string newpwd)
        {
            int result = 0;
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //声明SQL语句 
                string cmdtext = $"UPDATE [dbo].[ZJHL_Users] SET Password = '{ newpwd }' WHERE Password = '{ oldpwd }'";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                result =  cmd.ExecuteNonQuery();
            }
            return result;
        }

        /// 插入客户信息
        /// </summary>
        /// <param name="customerJson">客户信息的JSON字符串</param>
        /// <returns></returns>
        public static bool AddCustomer(string customerJson)
        {
            //插入数据的结果
            bool result = false;
            //将JSON字符串转换成键值对(字典)
            var obj = JsonUnit.toDictionary(customerJson);
            //声明插入客户信息的语句
            var sql = @"
                INSERT INTO dbo.ZJHL_Customers( 
                       UserName,Name ,Phone ,Sex ,Address ,Area ,Remark ,Company ,
                       QQ ,MailBox ,Contact ,Password ,CompanyLogo ,CompanyLogoMini
                        )" +
                string.Format("VALUES  ( '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}')",
                 obj["UserName"], obj["Name"], obj["Phone"], obj["Sex"], obj["Address"], obj["Area"], obj["Remark"], obj["Company"],
                 obj["QQ"], obj["MailBox"], obj["Contact"], obj["Password"], obj["CompanyLogo"], obj["CompanyLogoMini"]);

            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //实例化SQL命令执行对象，输入SQL语句(sql)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(sql, connect);
                //执行语句并返回执行结果的第一行第一列
                result = cmd.ExecuteNonQuery() > 0;

            }
            return result;
        }

        /// 插入用户信息
        /// </summary>
        /// <param name="customerJson">用户信息的JSON字符串</param>
        /// <returns></returns>
        public static bool AddUser(string userJson)
        {
            //插入数据的结果
            bool result = false;
            //将JSON字符串转换成键值对(字典)
            var obj = JsonUnit.toDictionary(userJson);
            //声明插入客户信息的语句
            var sql = @"
                INSERT INTO dbo.ZJHL_Users( 
                        Name ,
                        Password,
                        Phone ,
                        MailBox ,
                        QQ ,
                        WeiXin ,
                        CreateDate,
                        Sex,
                        NikeName,
                        Remark,
                        Age
                      )" +
                string.Format("VALUES  ( '{0}','{1}',{2},'{3}','{4}','{5}','{6}',{7},'{8}','{9}',{10})",
                        obj["Name"], 
                        obj["Password"],
                        obj["Phone"], 
                        obj["MailBox"], 
                        obj["QQ"], 
                        obj["WeiXin"],
                        DateTime.Now,
                        obj["Sex"],
                        obj["NikeName"],
                        obj["Remark"],
                        obj["Age"]);

            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //实例化SQL命令执行对象，输入SQL语句(sql)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(sql, connect);
                //执行语句并返回执行结果的第一行第一列
                result = cmd.ExecuteNonQuery() > 0;

            }
            return result;
        }


        /// 插入广告信息
        /// </summary>
        /// <param name="customerJson">广告信息的JSON字符串</param>
        /// <returns></returns>
        public static bool AddAdviertisement(string json)
        {
            //插入数据的结果
            bool result = false;
            //将JSON字符串转换成键值对(字典)
            var obj = JsonUnit.toDictionary(json);
            //声明插入客户信息的语句
            var sql = @"
                INSERT INTO dbo.ZJHL_Adviertisements( Name,Title,GG_Image,GG_Content,CreateDate,CreateId)" +
                string.Format("VALUES  ( '{0}','{1}','{2}','{3}','{4}','{5}')",
                 obj["Name"], obj["Title"], obj["GG_Image"], obj["GG_Content"], obj["CreateDate"], obj["CreateId"]);

            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //实例化SQL命令执行对象，输入SQL语句(sql)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(sql, connect);
                //执行语句并返回执行结果的第一行第一列
                result = cmd.ExecuteNonQuery() > 0;

            }
            return result;
        }

        public static string DoSearch(string selectType, string selectContent)
        {
            string result = "";
            //声明搜索语句
            var sql = string.Format( @"
                      SELECT *
                      FROM [ZJHL].[dbo].[ZJHL_Customers] 
                      WHERE Name LIKE '{0}%' 
                      OR Address LIKE '{1}%' 
                      OR Company LIKE '{2}%'
                      OR Phone LIKE '{3}%' 
                      OR QQ LIKE '{4}%'",
                      selectContent, selectContent,
                      selectContent, selectContent, selectContent);

            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {

               
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(sql, connect);
                //执行SQL命令并返回SQL数据只读器(reader)
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("id");
                dt.Columns.Add("UserName");
                dt.Columns.Add("Name");
                dt.Columns.Add("Phone");
                dt.Columns.Add("Sex");
                dt.Columns.Add("Address");
                dt.Columns.Add("Area");
                dt.Columns.Add("Remark");
                dt.Columns.Add("Company");
                dt.Columns.Add("QQ");
                dt.Columns.Add("MailBox");
                dt.Columns.Add("Contact");
                dt.Columns.Add("Password");
                dt.Columns.Add("CompanyLogo");
                dt.Columns.Add("CompanyLogoMini");
                while (reader.Read())
                {
                    //读取数据
                    var id = reader.GetInt64(0);
                    var UserName = reader.IsDBNull(1) ? "" : reader.GetString(1);
                    var Name = reader.GetString(2);
                    var Phone = reader.GetString(3);
                    var Sex = reader.GetBoolean(4);
                    var Address = reader.GetString(5);
                    var Area = reader.GetString(6);
                    var Remark = reader.GetString(7);
                    var Company = reader.GetString(8);
                    var QQ = reader.GetString(9);
                    var MailBox = reader.GetString(10);
                    var Contact = reader.GetString(11);
                    var Password = reader.GetString(12);
                    var CompanyLogo = reader.GetString(13);
                    var CompanyLogoMini = reader.GetString(14);
                    //为数据表添加列
                    dr = dt.NewRow();
                    //为数据行添加值 
                    dr["id"] = id;
                    dr["UserName"] = UserName;
                    dr["Name"] = Name;
                    dr["Phone"] = Phone;
                    dr["Sex"] = Sex;
                    dr["Address"] = Address;
                    dr["Area"] = Area;
                    dr["Remark"] = Remark;
                    dr["Company"] = Company;
                    dr["QQ"] = QQ;
                    dr["MailBox"] = MailBox;
                    dr["Contact"] = Contact;
                    dr["Password"] = Password;
                    dr["CompanyLogo"] = CompanyLogo;
                    dr["CompanyLogoMini"] = CompanyLogoMini;
                    //添加行到表格
                    dt.Rows.Add(dr);
                }
                result = JsonUnit.DataTableToJson(dt);
            }
            return result;
        }

        /// <summary>
        /// 读取系统登陆日志
        /// </summary>
        /// <param name="number">当前页码</param>
        /// <param name="pgsize">当前页的数据条数</param>
        /// <returns></returns>
        public static string GetSystemLogs(int number, int pgsize)
        {
            string result = "";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //声明SQL语句 
                string cmdtext = "SELECT * FROM dbo.ZJHL_SystemLogs";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                //数据适配器
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                //数据集
                DataSet ds = new DataSet();
                //通过数据适配器填充数据集
                da.Fill(ds);
                //返回JSON字符串
                result = JsonUnit.DataTableToJson(ds.Tables[0]);
            }
            return  result ;
        }

        /// <summary>
        /// 读取系统用户列表
        /// </summary>
        /// <param name="number">当前页码</param>
        /// <param name="pgsize">当前页的数据条数</param>
        /// <returns></returns>
        public static string GetUsers(int number, int pgsize,string where)
        {
            string result = "";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //声明SQL语句 
                string cmdtext = $"SELECT * FROM dbo.ZJHL_Users {where}";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                //数据适配器
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                //数据集
                DataSet ds = new DataSet();
                //通过数据适配器填充数据集
                da.Fill(ds);
                //返回JSON字符串
                result = JsonUnit.DataTableToJson(ds.Tables[0]);
            }
            return result;
        }

         /// <summary>
        /// 读取系统权限列表
        /// </summary>
        /// <param name="number">当前页码</param>
        /// <param name="pgsize">当前页的数据条数</param>
        /// <returns></returns>
        public static string GetPermission(int number, int pgsize,string where)
        {
            string result = "";
            //实例化数据库连接对象
            SqlConnection connect = new SqlConnection(connetStr);
            //打开数据连接
            connect.Open();
            if (connect.State != System.Data.ConnectionState.Open)
            {
                Console.WriteLine("打开数据库失败");
            }
            else
            {
                //声明SQL语句 
                string cmdtext = $"SELECT * FROM dbo.ZJHL_Permission {where}";
                //实例化SQL命令执行对象，输入SQL语句(cmdtext)和数据库连接对象(connect)
                SqlCommand cmd = new SqlCommand(cmdtext, connect);
                //数据适配器
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                //数据集
                DataSet ds = new DataSet();
                //通过数据适配器填充数据集
                da.Fill(ds);
                //返回JSON字符串
                result = JsonUnit.DataTableToJson(ds.Tables[0]);
            }
            return result;
        }
    }
}
