using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.admin.reader
{
    public partial class type : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            BindData();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                HK.Model.ReaderType Readertype = new HK.Model.ReaderType();
                Readertype.Name = name.Text;
                Readertype.Number = int.Parse(num.Text);
                if (HK.BLL.ReaderType.Get(Readertype.Name) != null){
                    HK.Utils.JsHelper.Alert("读者类型重复");
                    BindData();
                    return;
                }

                if (HK.BLL.ReaderType.Insert(Readertype))
                {
                    HK.Utils.JsHelper.Alert("插入成功");
                }
                else
                {
                    HK.Utils.JsHelper.Alert("插入失败");
                }
            }
            catch
            {
                HK.Utils.JsHelper.Alert("插入失败，请检查提交的数据是否合法");
            }


            BindData();
        }

        protected void BindData()
        {
            GridView1.DataSource = HK.BLL.ReaderType.Get();
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
            try
            {
                GridViewRow Row = GridView1.Rows[e.RowIndex];
                HK.Model.ReaderType Readertype = new HK.Model.ReaderType();
                Readertype.Id = int.Parse(Row.Cells[1].Text);
                Readertype.Name = ((TextBox)(Row.Cells[2].Controls[0])).Text;
                Readertype.Number = int.Parse(((TextBox)(Row.Cells[3].Controls[0])).Text);

                if (HK.BLL.ReaderType.Update(Readertype))
                {
                    HK.Utils.JsHelper.Alert("更新成功");
                }
                else
                {
                    HK.Utils.JsHelper.Alert("更新失败");
                }
            }
            catch
            {
                HK.Utils.JsHelper.Alert("更新失败，请检查提交的数据是否合法");
            }


            GridView1.EditIndex = -1;
            BindData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow Row = GridView1.Rows[e.RowIndex];
                string Msg = HK.BLL.ReaderType.Delete(int.Parse(Row.Cells[1].Text));
                if (Msg == "删除成功")
                {
                    HK.Utils.JsHelper.Alert("删除成功");
                }
                else
                {
                    HK.Utils.JsHelper.Alert("删除失败,原因:" + Msg);
                }
            }
            catch
            {
                HK.Utils.JsHelper.Alert("删除失败，数据可能不存在");
            }

            BindData();
        }
    }
}