using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;
using System.IO;
using System.Net;
using System.Dynamic;
using System.Collections;

public partial class satinalinan : System.Web.UI.Page
{
    pcompone_1453Entities3 bd = new pcompone_1453Entities3();
    int kullaniciid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            kullaniciid = Convert.ToInt16(Session["ID"]);
            var sorgu = (from i in bd.Urunler
                         from p in bd.SatilanUrunler
                         where (p.urunID == i.urun_id) && (p.kullaniciID == kullaniciid)
                         select new
                         {
                             i.resim,
                             i.urunismi,
                             i.urun_adet,
                             i.fiyat,
                             i.urun_id,
                             p.toplamfiyat,
                             p.datetime
                             

                         });



            if (sorgu.Count()==0)
            {
                Response.Write("<script lang='JavaScript'> alert ('Satın Aldığınız Ürün Bulunmamaktadır!');</script>");

            }
            else
            {

                Repeater1.DataSource = sorgu.ToList();
                Repeater1.DataBind();





                var sorgu2 = (from a in bd.Urunler
                              from pp in bd.SatilanUrunler
                              where (pp.urunID == a.urun_id) && (pp.kullaniciID == kullaniciid)
                              select pp.toplamfiyat).Sum();
                Label1.Text = sorgu2.ToString() + " "+  "$" ;
                             
                
                    
            }
           
        }
        

    }

    public void doldur()
    {
        kullaniciid = Convert.ToInt16(Session["ID"]);
        var sorgu = (from i in bd.Urunler
                     from p in bd.SatilanUrunler
                     where (p.urunID == i.urun_id) && (p.kullaniciID == kullaniciid)
                     select new
                     {
                         i.resim,
                         i.urunismi,
                         i.urun_adet,
                         i.fiyat,
                         i.urun_id,
                         p.toplamfiyat,
                         p.datetime


                     });


            Repeater1.DataSource = sorgu.ToList();
            Repeater1.DataBind();


            var sorgu2 = (from a in bd.Urunler
                          from pp in bd.SatilanUrunler
                          where (pp.urunID == a.urun_id) && (pp.kullaniciID == kullaniciid)
                          select pp.toplamfiyat).Sum();
            Label1.Text = sorgu2.ToString() + "  " + "$";

        
    }
    
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        kullaniciid = Convert.ToInt16(Session["ID"]);
        int urunid = Convert.ToInt16(e.CommandArgument);
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        //int urunid = Convert.ToInt32(((LinkButton)e.Item.FindControl("lnkislem")).CommandName);

        if (e.CommandName.ToString() == "btnislem")
        {
           
                SatilanUrunler sat = (from i in db.SatilanUrunler
                                      where (i.urunID == urunid) && (i.kullaniciID==kullaniciid)
                                      select i).FirstOrDefault<SatilanUrunler>();

                db.SatilanUrunler.DeleteObject(sat);

                db.SaveChanges();
                doldur();
                //Response.Write("satinalinan.aspx?kullaniciid=" + kullaniciid + "");
         
            
        }
        
        
    }
}