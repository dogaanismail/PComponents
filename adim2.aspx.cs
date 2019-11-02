using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;
public partial class adim2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string kisiadi = Session["uye_adim"].ToString();
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Kullanici urun = (from i in db.Kullanici
                          where (i.kullaniciadi == kisiadi)
                          select i).FirstOrDefault<Kullanici>();
        lbl_soru.Text = urun.kisi_soru.ToString();

    }
    protected void btn_ileri_Click(object sender, EventArgs e)
    {
        string kisiadi = Session["uye_adim"].ToString();
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Kullanici urun = (from i in db.Kullanici
                          where (i.kullaniciadi == kisiadi)
                          select i).FirstOrDefault<Kullanici>();
        string cevap = urun.kisi_cevap.ToString();
        if (cevap == TextBox1.Text)
        {
            Response.Redirect("sifredegistir.aspx");
        }
    }
}