using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Demo
{
    class Program
    {
        static void Main(string[] args)
        {
            var jsonstr = "{\"Name\":\"ZTTF\",\"Title\":\"总统套房元旦促销\",\"GG_Image\":\"'image\\\\jrhjd.jpg'\",\"GG_Content\":\"豪华总统套房元旦大促销,限时一天，速来抢定！！！手机：15118164480\",\"CreateDate\":\"2016-12-31\",\"CreateId\":\"2\"}";
            HaoLianDAL.SqlDAL.AddAdviertisement(jsonstr);
        }
    }
}
