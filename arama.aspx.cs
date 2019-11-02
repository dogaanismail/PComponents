using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;
using System.Data;
using System.Data.SqlClient;

public partial class arama : System.Web.UI.Page
{
    pcompone_1453Entities3 db = new pcompone_1453Entities3();
    
    int kullaniciid;
    protected void Page_Load(object sender, EventArgs e)
    {
       kullaniciid = Convert.ToInt16(Session["ID"]);
        if (Request.QueryString["arananurun"] != null)
        {
            string kelime = Request.QueryString["arananurun"].ToString();
            aramayap(kelime);
            
        }

        pcompone_1453Entities3 h = new pcompone_1453Entities3();
                Kullanici kullanici = (from i in h.Kullanici
                                       where (i.kullanici_id==kullaniciid)
                                       select i).FirstOrDefault<Kullanici>();

                pcompone_1453Entities3 mkl = new pcompone_1453Entities3();
        rptAnaKategori.DataSource = (from i in mkl.Kategori
                                     where (i.MainKategori == 0)
                                     select i).ToList<Kategori>();

        rptAnaKategori.DataBind();
    }

  private void aramayap(string kelime)
    {
        List<Urunler> u = (from i in db.Urunler
                           where (i.urunismi.Contains(kelime))
                           select i).ToList<Urunler>();
        Repeater3.DataSource = u;
        Repeater3.DataBind();

        if (u.Count==0)
        {
            Response.Write("<script lang='JavaScript'> alert ('Aradığınız ürün bulunamamıştır, lütfen tekrar deneyin !');</script>");
             
        }
        


    }

  protected void btn_ara_Click(object sender, EventArgs e)
  {
      string aranan = "arama.aspx?arananurun=" + HttpUtility.UrlEncode(txtara.Text.Trim());
      Response.Redirect(aranan);
  }
  protected void rptAnaKategori_ItemDataBound(object sender, RepeaterItemEventArgs e)
  {

      Repeater rp = (Repeater)e.Item.FindControl("RpAltKategori");
      SqlConnection baglanti = new SqlConnection(@"Data Source=mssql11.domainhizmetleri.com;Initial Catalog=pcompone_1453;Persist Security Info=True;User ID=pcompone_ismail;Password=n5Wfd6_5");
      baglanti.Open();

      SqlCommand cmdAltKat = new SqlCommand("Select * From Kategori where AnaKategorisi = " + Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "kategori_id").ToString()), baglanti);

      rp.DataSource = cmdAltKat.ExecuteReader();
      rp.DataBind();
      cmdAltKat.Dispose();
      baglanti.Close();

  }
  protected void btn_cikisyap_Click(object sender, EventArgs e)
  {
      kullaniciid = Convert.ToInt16(Session["ID"]);
      Session.Remove("ID");


      Response.Redirect("anasayfa.aspx");
  }
}
