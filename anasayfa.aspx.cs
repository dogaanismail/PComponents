using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;
using System.Data.SqlClient;

public partial class anasayfa : System.Web.UI.Page
{
    string ip = HttpContext.Current.Request.ServerVariables["Remote_Addr"].ToString();

    pcompone_1453Entities3 k = new pcompone_1453Entities3();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        pcompone_1453Entities3 z = new pcompone_1453Entities3();
        pcompone_1453Entities3 b = new pcompone_1453Entities3();

            var abcc = from sa in z.Ziyaretci
                      where (sa.Ipadress == ip)
                      select ip;

            if (abcc.Count() ==0)
            {
                Ziyaretci ziyaretci = new Ziyaretci();
                ziyaretci.Ipadress = ip;

                k.Ziyaretci.AddObject(ziyaretci);
                k.SaveChanges();

                Hit hit = (from i in b.Hit
                           where (i.hit_id == 1)
                           select i).FirstOrDefault<Hit>();

                int sayı = Convert.ToInt32(hit.site_hit);
                int deger = sayı + 1;
                hit.site_hit = deger;
                b.SaveChanges();
            }

    

            else
            {
                Hit git = (from i in k.Hit
                           select i).FirstOrDefault<Hit>();
                          

            }
            
            
        }

        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Repeater1.DataSource = (from i in db.Urunler
                                select i).Take(12);
        Repeater1.DataBind();

      
    }
}