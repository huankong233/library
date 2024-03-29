using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.admin.book
{
    public partial class _case : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            BindData();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            HK.Model.Bookcase Bookcase = new HK.Model.Bookcase();
            Bookcase.Name = name.Text;
            if (HK.BLL.Bookcase.Insert(Bookcase))
            {
                HK.Utils.JsHelper.Alert("插入成功");
            }
            else
            {
                HK.Utils.JsHelper.Alert("插入失败");
            }

            BindData();
        }

        protected void BindData()
        {
            GridView1.DataSource = HK.BLL.Bookcase.Get();
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow Row = GridView1.Rows[e.RowIndex];
            HK.Model.Bookcase Bookcase = new HK.Model.Bookcase();
            Bookcase.Id = int.Parse(Row.Cells[1].Text);
            Bookcase.Name = ((TextBox)Row.Cells[2].Controls[0]).Text;

            if (HK.BLL.Bookcase.Update(Bookcase))
            {
                HK.Utils.JsHelper.Alert("更新成功");
            }
            else
            {
                HK.Utils.JsHelper.Alert("更新失败");
            }

            GridView1.EditIndex = -1;
            BindData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow Row = GridView1.Rows[e.RowIndex];
            int Id = int.Parse(Row.Cells[1].Text);
            string Msg = HK.BLL.Bookcase.Delete(Id);
            if (Msg == "删除成功")
            {
                HK.Utils.JsHelper.Alert("删除成功");
            }
            else
            {
                HK.Utils.JsHelper.Alert("删除失败,原因:" + Msg);
            }
            BindData();
        }
    }
}