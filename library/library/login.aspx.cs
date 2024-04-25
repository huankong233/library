using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoRegister(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void SubmitForm(object sender, EventArgs e)
        {
            HK.Model.Admin Admin = new HK.Model.Admin();

            string Username = username.Text;
            string Password = password.Text;

            if (Username == "" || Password == "")
            {
                Fail("请完整填写表格");
                return;
            }

            Admin.Name = Username;
            Admin.Pwd = Password;

            string response = HK.BLL.Admin.Login(Admin);

            if(response == "登陆成功")
            {
                HK.Utils.JsHelper.Move("/index.aspx",1500);
                Success(response);
            }
            else
            {
                Fail(response);
            }
        }

        protected void Success(string msg)
        {
            success.Text = msg;
            fail.Text = "";
        }

        protected void Fail(string msg)
        {
            success.Text = "";
            fail.Text = msg;
        }
    }
}