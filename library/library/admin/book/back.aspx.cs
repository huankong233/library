using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.admin.book
{
    public partial class back : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void BindData()
        {
            string ReaderName = name.Text;
            HK.Model.Reader Reader = HK.BLL.Reader.Get(ReaderName);
            if (Reader == null)
            {
                HK.Utils.JsHelper.Alert("用户不存在");
                return;
            }

            GridView1.DataSource = HK.BLL.BorrowAndBack.GetByReaderAndHaveBookNotBack(Reader.Id);
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            HK.Model.BorrowAndBack BorrowAndBack = HK.BLL.BorrowAndBack.Get(int.Parse(e.CommandArgument.ToString()));
            BorrowAndBack.Sjbacktime = DateTime.Now;
            BorrowAndBack.Backoper = HK.BLL.Admin.Get(int.Parse(Session["Id"].ToString()));
            BorrowAndBack.Isback = true;

            if (HK.BLL.BorrowAndBack.Update(BorrowAndBack))
            {
                HK.Utils.JsHelper.Alert("还书成功");
                BindData();
            }
            else
            {
                HK.Utils.JsHelper.Alert("还书失败");
            }
        }
    }
}