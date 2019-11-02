using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class sifredegistir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string kisiadi = Session["uye_adim"].ToString();
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Kullanici urun = (from i in db.Kullanici
                          where (i.kullaniciadi == kisiadi)
                          select i).FirstOrDefault<Kullanici>();
        urun.sifre = TextBox1.Text;
        db.SaveChanges();
        Response.Write("<script lang='JavaScript'> alert ('Şifre Değiştirldi');</script>");
       

    }
}