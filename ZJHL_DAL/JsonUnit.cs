using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Data;
using System.Text.RegularExpressions;
using System.Reflection;
namespace MetroX.Common
{
    public class JsonUnit
    {
        #region 转换为JSON格式
        /// <summary>
        /// 对象转换为JSON字符串
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <returns></returns>
        public static string ToJson<T>(T t)
        {
            //声明json序列化对象
            JavaScriptSerializer jss = new JavaScriptSerializer();
            //转换对象为json字符串
            var json = jss.Serialize(t);
            //声明正则表达式委托
            MatchEvaluator matchEvaluator = new MatchEvaluator(ConvertJsonDateToDateString);
            //正则表达对象声明
            Regex reg = new Regex(@"\\/Date\((\d+)\)\\/");
            //通过委托返回字符串替换表达式匹配的字符串
            var newjson = reg.Replace(json, matchEvaluator);
            //返回替换后的json字符串
            return newjson;
        }

        /// <summary>
        /// 转换JSON格式("\\/Date(1443628808000)\\/")日期为字符串格式(2015-10-01 00:00:08)
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public static string ConvertJsonDateToDateString(Match m)
        {
            string result = string.Empty;
            DateTime dt = new DateTime(1970, 1, 1);
            var timevalue = m.Groups[0].Value.Replace("\\/Date(", "").Replace(")\\/", "");
            long newtime = long.Parse(timevalue);
            dt = dt.AddMilliseconds(newtime);
            dt = dt.ToLocalTime();
            result = dt.ToString("yyyy-MM-dd HH:mm:ss");
            return result;
        }
        #endregion

        #region DataTable转换为List/JSON
        /// <summary>
        /// 将DataTable转换为List
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static List<T> DataTableToList<T>(DataTable dt) where T : class, new()
        {
            List<PropertyInfo> list = new List<PropertyInfo>();
            Type t = typeof(T);
            Array.ForEach<PropertyInfo>(t.GetProperties(), p =>
            {
                if (dt.Columns.IndexOf(p.Name) != -1) list.Add(p);
            });
            List<T> objList = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T obj = new T();
                list.ForEach(p =>
                {
                    if (row[p.Name] != DBNull.Value) p.SetValue(obj, row[p.Name], null);
                });
                objList.Add(obj);
            }
            return objList;
        }

        /// <summary>
        /// 将DataTable转换为JSON
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static string DataTableToJson(DataTable dt)
        {
            List<Dictionary<string, object>> listArray = new List<Dictionary<string, object>>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Dictionary<string, object> list = new Dictionary<string, object>();
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    list.Add(dt.Columns[j].ColumnName, dt.Rows[i][j]);
                }
                listArray.Add(list);
            }
            return ToJson(listArray);
        }
        /// <summary>
        /// 将字符串转换成字典
        /// </summary>
        /// <param name="str">字符串</param>
        /// <returns></returns>
        public static Dictionary<string, object> toDictionary(string str) {
            JavaScriptSerializer jss = new JavaScriptSerializer();
            Dictionary<string, object> obj = (Dictionary<string, object>)jss.DeserializeObject(str);
            return obj;
        }

        #endregion
    }
}
