using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

using System.Data;
using System.Data.SqlClient;


public partial class uye_girisi : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Request.Cookies["cerez"] != null)
        {
            TextBox1.Text = Request.Cookies["cerez"]["kadi"];
            string parola = Request.Cookies["cerez"]["sifre"];
            TextBox2.Text = parola.ToString();

        }

        pcompone_1453Entities3 mkl = new pcompone_1453Entities3();
        rptAnaKategori.DataSource = (from i in mkl.Kategori
                                     where (i.MainKategori == 0)
                                     select i).ToList<Kategori>();

        rptAnaKategori.DataBind();

    }

   
    protected void btn_girisyap_Click(object sender, EventArgs e)
    {

        SqlConnection baglanti = new SqlConnection(@"Data Source=mssql11.domainhizmetleri.com;Initial Catalog=pcompone_1453;Persist Security Info=True;User ID=pcompone_ismail;Password=n5Wfd6_5");
        baglanti.Open();
        SqlCommand com = new SqlCommand("Select * from Kullanici where kullaniciadi='" + TextBox1.Text + "'and sifre='" + TextBox2.Text + "'", baglanti);

        SqlDataReader oku = com.ExecuteReader();

        if (oku.Read())
        {

            //Session da Giriş yapan kişinin Id ve AdSoyad bilgisini tutuyoruz.
           
            Session["ID"] = oku["kullanici_id"].ToString();
            int durum = Convert.ToInt16(oku["durum"]);

            if (durum==0)
            {
                Response.Redirect("uye.aspx?kullaniciID=" + Session["ID"] + "");
            }
            else
            {
                Session["ID"] = null;
                Response.Redirect("Admin/AdminPaneli.aspx");

            }

        }

        else
        {
            Response.Write("<script lang='JavaScript'> alert ('Kullanıcı Kaydı Bulunmadı! Lütfen tekrar deneyiniz');</script>");
           

        }


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
    protected void btn_ara_Click(object sender, EventArgs e)
    {
        string aranan = "arama.aspx?arananurun=" + HttpUtility.UrlEncode(txtara.Text.Trim());
        Response.Redirect(aranan);
    }
}