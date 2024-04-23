using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            List<HK.Model.BookInfo> BookRank = HK.BLL.BookInfo.Rank();
            GridView1.DataSource = BookRank;
            GridView1.DataBind();

            List<HK.Model.Reader> ReaderRank = HK.BLL.Reader.Rank();
            GridView2.DataSource = ReaderRank;
            GridView2.DataBind();
        }
    }
}