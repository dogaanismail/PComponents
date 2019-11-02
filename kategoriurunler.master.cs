using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;
using System.Data;
using System.Data.SqlClient;

public partial class kategoriurunler : System.Web.UI.MasterPage
{
    int kullaniciid;
    int Topla;
    protected void Page_Load(object sender, EventArgs e)
    {
              
        if (!IsPostBack)
        {
            kullaniciid = Convert.ToInt16(Session["ID"]);

            pcompone_1453Entities3 k = new pcompone_1453Entities3();
            var sorgulamaifadesi = (from i in k.Kullanici

                                    where (i.kullanici_id==kullaniciid)

                                    select i).ToList<Kullanici>();

            if (sorgulamaifadesi.Count !=0)
            {
                Repeater2.DataSource = sorgulamaifadesi;
                Repeater2.DataBind();
                btn_cikisyap.Visible = true;
                
            }

            else
            {
                btn_cikisyap.Visible = false;
            }
       

        }


        if (HttpContext.Current.Session["Sepet"] == null || Session["Sepet"] == null)
        {
            Button1.Text = "Sepetinizde ürün bulunmamaktadır.";
            Button1.Enabled = false;

        }

        else
        {
            DataTable dt = new DataTable();
            dt = (DataTable)HttpContext.Current.Session["Sepet"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                Topla = Topla + Convert.ToInt32(dt.Rows[i]["adet"]);
                Button1.Text = Topla.ToString() + " " + "adet ürün sepetinizde bulunmaktadır";
            }

        }

       
        pcompone_1453Entities3 mkl = new pcompone_1453Entities3();
        rptAnaKategori.DataSource = (from i in mkl.Kategori
                                     where (i.MainKategori == 0)
                                     select i).ToList<Kategori>();

        rptAnaKategori.DataBind();

    }
    protected void btn_cikisyap_Click(object sender, EventArgs e)
    {
        kullaniciid = Convert.ToInt16(Session["ID"]);
        Session.Remove("ID");


        Response.Redirect("anasayfa.aspx");
        btn_cikisyap.Visible = false;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("sepet.aspx");
    }
}
