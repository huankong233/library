using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.admin.book
{
    public partial class info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            List<HK.Model.BookType> BookTypeList = HK.BLL.BookType.Get();
            foreach (HK.Model.BookType BookType in BookTypeList)
            {
                type.Items.Add(new ListItem(BookType.Typename, BookType.Id.ToString()));
            }

            List<HK.Model.Bookcase> BookcaseList = HK.BLL.Bookcase.Get();
            foreach (HK.Model.Bookcase Bookcase in BookcaseList)
            {
                bcase.Items.Add(new ListItem(Bookcase.Name, Bookcase.Id.ToString()));
            }

            BindData();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            HK.Model.BookInfo BookInfo = new HK.Model.BookInfo();
            BookInfo.Bookcode = ISBN.Text;
            BookInfo.Bookname = name.Text;
            BookInfo.Type = HK.BLL.BookType.Get(int.Parse(type.Text));
            BookInfo.Author = author.Text;
            BookInfo.Translator = translator.Text;
            BookInfo.Pubname = pubname.Text;
            BookInfo.Price = int.Parse(price.Text);
            BookInfo.Page = int.Parse(bookpage.Text);
            BookInfo.Bcase = HK.BLL.Bookcase.Get(int.Parse(bcase.Text));
            BookInfo.Storage = long.Parse(storage.Text);
            BookInfo.InTime = DateTime.Now;
            BookInfo.Oper = HK.BLL.Admin.Get(int.Parse(Session["Id"].ToString()));
            BookInfo.Borrownum = 0;

            // 判断ISBN是否重复

            if (HK.BLL.BookInfo.Get(BookInfo.Bookcode) != null)
            {
                HK.Utils.JsHelper.Alert("插入失败,ISBN重复");
                return;
            }

            if (HK.BLL.BookInfo.Insert(BookInfo))
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
            GridView1.DataSource = HK.BLL.BookInfo.Get();
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
            HK.Model.BookInfo BookInfo = new HK.Model.BookInfo();
            BookInfo.Bookcode = Row.Cells[1].Text;
            BookInfo.Bookname = ((TextBox)Row.Cells[2].Controls[0]).Text;
            BookInfo.Type = HK.BLL.BookType.Get(int.Parse(((DropDownList)Row.Cells[3].Controls[1]).Text));
            BookInfo.Author = ((TextBox)Row.Cells[4].Controls[0]).Text;
            BookInfo.Translator = ((TextBox)Row.Cells[5].Controls[0]).Text;
            BookInfo.Pubname = ((TextBox)Row.Cells[6].Controls[0]).Text;
            BookInfo.Price = decimal.Parse(((TextBox)Row.Cells[7].Controls[0]).Text);
            BookInfo.Page = int.Parse(((TextBox)Row.Cells[8].Controls[0]).Text);
            BookInfo.Bcase = HK.BLL.Bookcase.Get(int.Parse(((DropDownList)Row.Cells[9].Controls[1]).Text));
            BookInfo.Storage = long.Parse(((TextBox)Row.Cells[10].Controls[1]).Text);
            BookInfo.InTime = Convert.ToDateTime(((TextBox)Row.Cells[11].Controls[1]).Text);
            BookInfo.Oper = HK.BLL.Admin.Get(int.Parse(Session["Id"].ToString()));
            BookInfo.Borrownum = int.Parse(((TextBox)Row.Cells[12].Controls[1]).Text);

            if (HK.BLL.BookInfo.Update(BookInfo))
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
            string Id = Row.Cells[1].Text;
            string Msg = HK.BLL.BookInfo.Delete(Id);
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
                DropDownList Bcase = (DropDownList)e.Row.FindControl("bcase");

                List<HK.Model.BookType> BookTypeList = HK.BLL.BookType.Get();
                foreach (HK.Model.BookType BookType in BookTypeList)
                {
                    Type.Items.Add(new ListItem(BookType.Typename, BookType.Id.ToString()));
                }

                List<HK.Model.Bookcase> BookcaseList = HK.BLL.Bookcase.Get();
                foreach (HK.Model.Bookcase Bookcase in BookcaseList)
                {
                    Bcase.Items.Add(new ListItem(Bookcase.Name, Bookcase.Id.ToString()));
                }

                // 选中选项
                HK.Model.BookInfo Drv = (HK.Model.BookInfo)e.Row.DataItem;
                Type.SelectedValue = Drv.Type.Id.ToString();
                Bcase.SelectedValue = Drv.Bcase.Id.ToString();
            }
        }
    }
}