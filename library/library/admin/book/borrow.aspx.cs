using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library.admin.book
{
    public partial class borrow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string Bookcode = ISBN.Text;
            string ReaderName = name.Text;

            HK.Model.BookInfo Book = HK.BLL.BookInfo.Get(Bookcode);
            if (Book == null)
            {
                HK.Utils.JsHelper.Alert("ISBN号对应的图书不存在");
                return;
            }

            HK.Model.Reader Reader = HK.BLL.Reader.Get(ReaderName);
            if (Book == null)
            {
                HK.Utils.JsHelper.Alert("读者不存在");
                return;
            }

            HK.Model.BorrowAndBack BorrowAndBack = new HK.Model.BorrowAndBack();
            BorrowAndBack.Reader = Reader;
            BorrowAndBack.Bookcode = Book;
            BorrowAndBack.Borrowtime = DateTime.Now;
            BorrowAndBack.Ygbacktime = DateTime.Now.AddDays(Book.Type.Days);
            BorrowAndBack.Borrowoper = HK.BLL.Admin.Get(int.Parse(Session["Id"].ToString()));
            BorrowAndBack.Isback = false;

            if(HK.BLL.BorrowAndBack.Insert(BorrowAndBack)){
                HK.Utils.JsHelper.Alert("借阅成功");
            }
            else
            {
                HK.Utils.JsHelper.Alert("借阅失败");
            }
        }
    }
}