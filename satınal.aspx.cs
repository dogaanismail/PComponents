using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class satınal : System.Web.UI.Page
{
    int kullaniciid;
    int UrunID;
    //int adet;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            UrunID= Convert.ToInt32(Request.QueryString["urunid"]);
            //adet = Convert.ToInt16(Session["adet"]);
        }

        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Repeater1.DataSource = (from i in db.Urunler
                                where (i.urun_id == UrunID)
                                select i).ToList<Urunler>();
        Repeater1.DataBind();

    }


    protected void btn_odeme_Click(object sender, EventArgs e)
    {
         kullaniciid = Convert.ToInt16(Session["ID"]);
        UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
        pcompone_1453Entities3 bd = new pcompone_1453Entities3();
        pcompone_1453Entities3 hhh = new pcompone_1453Entities3();


        var sorgu = from i in bd.Kullanici
                    where (i.kullanici_id == kullaniciid)
                    select i;


        if (sorgu.Count() != 0)
        {

            pcompone_1453Entities3 aa = new pcompone_1453Entities3();
            SatilanUrunler saturun = new SatilanUrunler();
            saturun.urunID = UrunID;
            saturun.kullaniciID = kullaniciid;
            saturun.datetime = DateTime.Now;
            saturun.urunadedi = Convert.ToInt16(Session["adet"]);
            saturun.toplamfiyat = Convert.ToInt16(Session["adet"]) * Convert.ToInt16(Session["fiyat"]);
            aa.SatilanUrunler.AddObject(saturun);
            aa.SaveChanges();

            pcompone_1453Entities3 x = new pcompone_1453Entities3();
            Urunler urun = (from i in x.Urunler
                            where (i.urun_id == UrunID)
                            select i).FirstOrDefault<Urunler>();
            int adet = Convert.ToInt16(urun.StokAdedi);
            int adetsayisi = adet - Convert.ToInt16(Session["adet"]);
            urun.StokAdedi = adetsayisi;
            x.SaveChanges();


            Response.Redirect("odeme.aspx?urunid=" + UrunID + "");
        }
        else if( sorgu.Count()== 0)
        {
            pcompone_1453Entities3 db = new pcompone_1453Entities3();
            Repeater1.DataSource = (from i in db.Urunler
                                    where (i.urun_id == UrunID)
                                    select i).ToList<Urunler>();
            Repeater1.DataBind();
            Response.Write("<script lang='JavaScript'> alert ('Ürünü Satın Alabilmeniz İçin Giriş Yapın veya Üye Olun');</script>");
            
        }


    }
    
}