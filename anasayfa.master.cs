using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;
using System.Data;
using System.Data.SqlClient;

public partial class anasayfa : System.Web.UI.MasterPage
{
    int kullaniciid;
    
    string aranan;
    SqlConnection baglanti = new SqlConnection();
   int Topla;
   
                   
    protected void Page_Load(object sender, EventArgs e)
   {
                 if (!Page.IsPostBack)
                 {
                     
                     kullaniciid = Convert.ToInt16(Session["ID"]);
                     pcompone_1453Entities3 h = new pcompone_1453Entities3();
                     Kullanici kullanici = (from i in h.Kullanici
                                            where (i.kullanici_id == kullaniciid)
                                            select i).FirstOrDefault<Kullanici>();


                     veriyukle(kullaniciid);

                     
                    


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


                 if (Session["ID"] == null)
                 {
                     btn_cikisyap.Visible = false;
                 }

        pcompone_1453Entities3 mkl = new pcompone_1453Entities3();
        rptAnaKategori.DataSource = (from i in mkl.Kategori
                                     where (i.MainKategori == 0)
                                     select i).ToList<Kategori>();
                                     
        rptAnaKategori.DataBind();


        pcompone_1453Entities3 abc = new pcompone_1453Entities3();
        Repeater1.DataSource = (from i in abc.Hit
                                select i).ToList<Hit>();
        Repeater1.DataBind();



        pcompone_1453Entities3 bd = new pcompone_1453Entities3();
        var sorgu = (from liste in bd.Urunler
                     orderby liste.hit descending
                     select liste).Take(3);


        Repeater2.DataSource = sorgu;
        Repeater2.DataBind();



        pcompone_1453Entities3 a = new pcompone_1453Entities3();
        var satıs = (from liste in a.Urunler
                     orderby liste.urunsatissayisi descending
                     select liste).Take(3);


        Repeater3.DataSource = satıs;
        Repeater3.DataBind();


    }

    private void veriyukle(int kullaniciid)
    {
        Kullanici kullanici = new Kullanici();
        pcompone_1453Entities3 z = new pcompone_1453Entities3();
        kullaniciid = Convert.ToInt16(Session["ID"]);

       
        Repeater4.DataSource = (from i in z.Kullanici

                                where (i.kullanici_id==kullaniciid)
                                
                                 
                                select i).ToList<Kullanici>();

        Repeater4.DataBind();
        btn_cikisyap.Visible = true;
    }

    protected void btn_cikisyap_Click(object sender, EventArgs e)
    {


        kullaniciid = Convert.ToInt16(Session["ID"]);
        Session.Remove("ID");

        
        Response.Redirect("anasayfa.aspx");

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
