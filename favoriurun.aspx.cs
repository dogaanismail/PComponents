using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class favoriurun : System.Web.UI.Page
{
    int kullaniciid;
    pcompone_1453Entities3 bd = new pcompone_1453Entities3();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            kullaniciid = Convert.ToInt16(Session["ID"]);
            var sorgu = (from i in bd.Urunler
                         from p in bd.FavoriUrunler
                         where (p.urunID == i.urun_id) && (p.kullaniciID == kullaniciid)
                         select new
                         {
                             i.resim,
                             i.urunismi,
                             i.fiyat,
                             i.urun_id,
                             p.datetime
                         });



            if (sorgu.Count() == 0)
            {
                Response.Write("<script lang='JavaScript'> alert ('Favori Ürününüz Bulunmamaktadır!');</script>");

            }
            else
            {
                Repeater1.DataSource = sorgu.ToList();
                Repeater1.DataBind();

            }

        }


    }
    public void doldur()
    {
        kullaniciid = Convert.ToInt16(Session["ID"]);
        var sorgu = (from i in bd.Urunler
                     from p in bd.FavoriUrunler
                     where (p.urunID == i.urun_id) && (p.kullaniciID == kullaniciid)
                     select new
                     {
                         i.resim,
                         i.urunismi,
                         i.fiyat,
                         i.urun_id,
                         p.datetime
                     });
        Repeater1.DataSource = sorgu.ToList();
        Repeater1.DataBind();

    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
         kullaniciid = Convert.ToInt16(Session["ID"]);
        int urunid = Convert.ToInt16(e.CommandArgument);
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        //int urunid = Convert.ToInt32(((LinkButton)e.Item.FindControl("lnkislem")).CommandName);

        if (e.CommandName.ToString() == "btnislem")
        {

            FavoriUrunler fav = (from i in db.FavoriUrunler
                                 where (i.urunID == urunid) && (i.kullaniciID == kullaniciid)
                                 select i).FirstOrDefault<FavoriUrunler>();

            db.FavoriUrunler.DeleteObject(fav);

            db.SaveChanges();
            doldur();
            //Response.Write("satinalinan.aspx?kullaniciid=" + kullaniciid + "");
        }
         
            
    }
}