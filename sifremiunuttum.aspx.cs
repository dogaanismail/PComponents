using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class sifremiunuttum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_ileri_Click(object sender, EventArgs e)
    {
        pcompone_1453Entities3 db = new pcompone_1453Entities3();

        var sorgu = from i in db.Kullanici
                    where (i.kullaniciadi == TextBox1.Text)
                    select i;
        if (sorgu.Count() != 0)
        {
            Session["uye_adim"] = TextBox1.Text;
            Response.Redirect("adim2.aspx");
        }
        else
        {


        }
    }
}