using System.Web;
using System;

namespace HK.Utils
{
    public class JsHelper
    {
        public static void Alert(string msg)
        {
            string script = "<script>alert('" + msg + "')</script>";
            HttpContext.Current.Response.Write(script);
        }

        public static void Move(string href, int delay = 0)
        {
            string script = "<script>setTimeout(()=>location.href='" + href + "'," + delay + ")</script>";
            HttpContext.Current.Response.Write(script);
        }
    }
}
