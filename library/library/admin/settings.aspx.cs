using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace library
{
    public partial class setting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            List<HK.Model.Library> Data = HK.BLL.Library.Get();
            if(Data.Count > 0)
            {
                HK.Model.Library Library = Data[0];
                libraryname.Text = Library.Libraryname;
                curator.Text = Library.Curator;
                tel.Text = Library.Tel;
                address.Text = Library.Address;
                email.Text = Library.Email;
                url.Text = Library.Url;
                createdate.Text = Library.Createdate.ToString("yyyy-MM-dd HH:mm:ss");
                introduce.Text = Library.Introduce;
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            HK.Model.Library Library = new HK.Model.Library();
            Library.Libraryname = libraryname.Text;
            Library.Curator = curator.Text;
            Library.Tel = tel.Text;
            Library.Address= address.Text;
            Library.Email = email.Text;
            Library.Url = url.Text;
            Library.Createdate = Convert.ToDateTime(createdate.Text);
            Library.Introduce = introduce.Text;

            if (HK.BLL.Library.Insert(Library))
            {
                HK.Utils.JsHelper.Alert("修改成功");
            }
            else
            {
                HK.Utils.JsHelper.Alert("修改失败");
            }
        }
    }
}