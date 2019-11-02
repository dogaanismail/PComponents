using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;
using System.Data;
using System.Data.SqlClient;

public partial class sepet : System.Web.UI.Page
{
    pcompone_1453Entities3 bd = new pcompone_1453Entities3();
    int kullaniciid;
    int Topla;
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        {

            if (HttpContext.Current.Session["Sepet"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)HttpContext.Current.Session["Sepet"];
                List<urunler> urunList = new List<urunler>();
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    int deneme = Convert.ToInt16(dt.Rows[i]["UrunId"]);
                    DateTime tarih = Convert.ToDateTime(dt.Rows[i]["tarih"]);
                    int toplamfiyat = Convert.ToInt32(dt.Rows[i]["toplamfiyat"]);
                    int adetmiktari = Convert.ToInt32(dt.Rows[i]["adet"]);
                    var sorgu = (from o in bd.Urunler
                                 where (o.urun_id == deneme)
                                 select new
                                 {
                                     o.resim,
                                     o.urunismi,
                                     adetmiktari,
                                     o.fiyat,
                                     o.urun_id,
                                     tarih,
                                     toplamfiyat,

                                 }).FirstOrDefault();

                    urunler urun = new urunler();
                    urun.fiyat = sorgu.fiyat.Value;
                    urun.resim = sorgu.resim;
                    urun.urunismi = sorgu.urunismi;
                    urun.urun_adet = adetmiktari;
                    urun.urun_id = sorgu.urun_id;
                    urun.tarih = tarih;
                    urun.toplamfiyat = toplamfiyat;

                    urunList.Add(urun);

                }
                Repeater1.DataSource = urunList;
                Repeater1.DataBind();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Topla = Topla + Convert.ToInt32(dt.Rows[i]["toplamfiyat"]);
                    Label1.Text = Topla.ToString() + " " + "$";
                }

            }
            else
            {
                Label1.Text = "0 $";
            }

        }


        DataTable dy = new DataTable();
        dy = (DataTable)HttpContext.Current.Session["Sepet"];

            if (dy.Rows.Count==0)
            {
                Label1.Text = "0 $";
                HttpContext.Current.Session.Remove("Sepet");
            }
       
            
        
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int urunid = Convert.ToInt16(e.CommandArgument);
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        DataTable dt = new DataTable();
        dt = (DataTable)HttpContext.Current.Session["Sepet"];
        if (e.CommandName.ToString() == "btnislem")
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (Convert.ToInt16(dt.Rows[i]["UrunId"]) == urunid)
                {
                    dt.Rows[i].Delete();
                    Response.Write("<script lang='JavaScript'> alert ('Ürün Sepetten Başarıyla Kaldırılmıştır!');</script>");
                    HttpContext.Current.Session["Sepet"] = dt;

                    break;
                    

                }
               


            }

        }
       
        Response.Redirect("sepet.aspx");
        
    }
}