using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoLogin(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void SubmitForm(object sender, EventArgs e)
        {
            HK.Model.Admin Admin = new HK.Model.Admin();
            string Username = username.Text;
            string Password = password.Text;
            string ConfirmPassword = confirmPassword.Text;

            if(Username == "" || Password == "" || ConfirmPassword == "")
            {
                Fail("请完整填写表格");
                return;
            }

            if (Password != ConfirmPassword)
            {
                Fail("两次密码不一致");
                return;
            }

            Admin.Name = Username;
            Admin.Pwd = Password;

            if (HK.BLL.Admin.CheckIsExists(Username))
            {
                Fail("该用户名已被使用");
                return;
            }

            if (HK.BLL.Admin.Insert(Admin))
            {
                Response.Write("<script>setTimeout(()=>location.href='./login.aspx',1500)</script>");
                Success("注册成功");
            }
            else
            {
                Fail("注册失败");
            }
        }

        protected void Success(string Msg)
        {
            success.Text = Msg;
            fail.Text = "";
        }

        protected void Fail(string Msg)
        {
            success.Text = "";
            fail.Text = Msg;
        }
    }
}