using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.admin.reader
{
    public partial class manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            List<HK.Model.ReaderType> List = HK.BLL.ReaderType.Get();
            foreach (HK.Model.ReaderType Readertype in List)
            {
                type.Items.Add(new ListItem(Readertype.Name, Readertype.Id.ToString()));
            }

            BindData();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            HK.Model.Reader Reader = new HK.Model.Reader();
            Reader.Name = name.Text;
            Reader.Type = HK.BLL.ReaderType.Get(int.Parse(type.Text));
            Reader.Birthday = Convert.ToDateTime(birthday.Text);
            Reader.Papertype = papertype.Text;
            Reader.Papernum = papernum.Text;
            Reader.Tel = tel.Text;
            Reader.Email = email.Text;
            Reader.Createdate = DateTime.Now;
            Reader.Oper = HK.BLL.Admin.Get(int.Parse(Session["Id"].ToString()));
            Reader.Remark = remark.Text;
            Reader.Borrownum = 0;
            Reader.Num = 0;
            if (HK.BLL.Reader.Insert(Reader))
            {
                HK.Utils.JsHelper.Alert("插入成功");
            }
            else
            {
                HK.Utils.JsHelper.Alert("插入失败");
            }
        }

        protected void BindData()
        {
            GridView1.DataSource = HK.BLL.Reader.Get();
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
            HK.Model.Reader Reader = new HK.Model.Reader();
            Reader.Id = int.Parse(Row.Cells[1].Text);
            Reader.Name = ((TextBox)Row.Cells[2].Controls[0]).Text;
            Reader.Type = HK.BLL.ReaderType.Get(int.Parse(((DropDownList)Row.Cells[3].Controls[1]).Text));
            Reader.Birthday = Convert.ToDateTime(((TextBox)Row.Cells[4].Controls[1]).Text);
            Reader.Papertype = ((DropDownList)Row.Cells[5].Controls[1]).Text;
            Reader.Papernum = ((TextBox)Row.Cells[6].Controls[0]).Text;
            Reader.Tel = ((TextBox)Row.Cells[7].Controls[1]).Text;
            Reader.Email = ((TextBox)Row.Cells[8].Controls[1]).Text;
            Reader.Remark = ((TextBox)Row.Cells[9].Controls[0]).Text;
            Reader.Borrownum = int.Parse(((TextBox)Row.Cells[10].Controls[1]).Text);
            Reader.Num = int.Parse(((TextBox)Row.Cells[11].Controls[1]).Text);
            Reader.Oper = HK.BLL.Admin.Get(int.Parse(Session["Id"].ToString()));

            if (HK.BLL.Reader.Update(Reader))
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
            string Msg = HK.BLL.Reader.Delete(Id);
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                // 插入选项
                DropDownList Type = (DropDownList)e.Row.FindControl("type");
                List<HK.Model.ReaderType> List = HK.BLL.ReaderType.Get();
                foreach (HK.Model.ReaderType Readertype in List)
                {
                    Type.Items.Add(new ListItem(Readertype.Name, Readertype.Id.ToString()));
                }

                // 选中选项
                HK.Model.Reader Drv = (HK.Model.Reader)e.Row.DataItem;
                Type.SelectedValue = Drv.Type.Id.ToString();
            }
        }
    }
}