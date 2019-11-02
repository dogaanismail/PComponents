using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

using System.Data;
using System.Data.SqlClient;

using System.IO;
using System.Net;
using System.Dynamic;
using System.Collections;

public partial class urundetay : System.Web.UI.Page
{

    int kullaniciid;
    int UrunID;
    string ip = HttpContext.Current.Request.ServerVariables["Remote_Addr"].ToString();
    pcompone_1453Entities3 bd = new pcompone_1453Entities3();

    ArrayList SurunlerID = new ArrayList();
    ArrayList Surunleradet = new ArrayList();
    private string a;

    private static int sayii = 1;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        txt_adet.Text = "1";
        txt_adet.Enabled = false;
        if (!IsPostBack)
        {
            sayii = 1;
            kullaniciid = Convert.ToInt16(Session["ID"]);

            pcompone_1453Entities3 u = new pcompone_1453Entities3();
            var abc = from sa in u.Ziyaretci
                      where (sa.Ipadress != ip)
                      select ip;
            if (abc.Count() != 0)
            {

                UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
                pcompone_1453Entities3 bd = new pcompone_1453Entities3();
                Urunler urun = (from i in bd.Urunler
                                where (i.urun_id == UrunID)
                                select i).FirstOrDefault<Urunler>();

                int sayı = Convert.ToInt32(urun.urungoruntulenmesayisi); 
                int deger = sayı + 1;
                urun.urungoruntulenmesayisi = deger;
                bd.SaveChanges();

            }
            else
            {                           
            }
       
        }
        

        

        pcompone_1453Entities3 q = new pcompone_1453Entities3();
        var getirme = (from f in q.FavoriUrunler
                       where (f.urunID == UrunID) && (f.kullaniciID == kullaniciid)
                       select f);
        if (getirme.Count()==1)
        {
            btn_begen.BackColor = System.Drawing.Color.Yellow;
            btn_begen.Text = "FAVORİLERE EKLENDİ";
            btn_begen.Enabled = false;
            btn_begen.ToolTip = "Kullanıcı Panelinizden Ürünü Favoriden Çıkartabilirsiniz";
            
            
        }
      
        UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Repeater1.DataSource = (from i in db.Urunler
                                where (i.urun_id == UrunID)
                                select i).ToList<Urunler>();


        Repeater1.DataBind();

       
        

        pcompone_1453Entities3 a = new pcompone_1453Entities3();
           UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
           kullaniciid = Convert.ToInt16(Session["ID"]);
           Repeater2.DataSource = (from i in a.Yorumlar
                                   where(i.urun_id==UrunID)
                                   where(i.onay==1)
                                   orderby i.tarih descending
                                   select i).Take(3);
           Repeater2.DataBind();

           pcompone_1453Entities3 klm = new pcompone_1453Entities3();
           Repeater3.DataSource = (from i in db.Urunler
                                   where (i.urun_id == UrunID)
                                   select i).ToList<Urunler>();
           Repeater3.DataBind();

    }

    protected void btn_begen_Click(object sender, EventArgs e)
    {
        kullaniciid = Convert.ToInt16(Session["ID"]);

        UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Urunler urun = (from i in db.Urunler
                        where (i.urun_id == UrunID)
                        select i).FirstOrDefault<Urunler>();


        var sorgu = from a in db.Kullanici
                     where (a.kullanici_id == kullaniciid)
                     select a;

        if (sorgu.Count() != 0)
        {
            int ht = Convert.ToInt32(urun.hit);
            int sonuc = ht + 1;
            urun.hit = sonuc;
            db.SaveChanges();


            pcompone_1453Entities3 aa = new pcompone_1453Entities3();
            FavoriUrunler favurun = new FavoriUrunler();
            favurun.urunID = UrunID;
            favurun.kullaniciID = kullaniciid;
            favurun.datetime = DateTime.Now;
            aa.FavoriUrunler.AddObject(favurun);
            aa.SaveChanges();

            Response.Redirect("urundetay.aspx?urunid=" + urun.urun_id + "");       

        }

        else if(sorgu.Count() ==0)
        {
            Response.Write("<script lang='JavaScript'> alert ('Lütfen giriş yapın veya üye olun');</script>");
            
        }

    }
    protected void btn_satınal_Click(object sender, EventArgs e)
    {
        UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Urunler urun = (from i in db.Urunler
                        where (i.urun_id == UrunID)
                        select i).FirstOrDefault<Urunler>();

        urun.urun_adet = Convert.ToInt32(sayii);
       

        int adet = Convert.ToInt32(sayii);
        int sayı = Convert.ToInt32(urun.fiyat);
        int sonuc;
        sonuc = adet * sayı;
        urun.toplamfiyat = sonuc;

        int satıs = Convert.ToInt32(urun.urunsatissayisi);
        int deger =  satıs+ 1;
        urun.urunsatissayisi = deger;
        db.SaveChanges();
        Session["adet"] = sayii;
        Session["fiyat"] = urun.fiyat;

      
    Response.Redirect("satınal.aspx?urunid=" + UrunID + "");
        
    }


    private bool kontrol(string a)
    {
        bool sonuc = false;

        DataTable dt = new DataTable();
        dt = (DataTable)HttpContext.Current.Session["Sepet"];
        if (Session["Sepet"] != null)
        {
            var sorgu = (from row in dt.AsEnumerable()
                         where row.Field<int>("UrunId") == UrunID
                         select row);
            if (sorgu.Count() != 0)
            {
                sonuc = true;

               
            }

        }
        
        return sonuc;
    }

    private void Artir(string a)
    {
        UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Urunler urun = (from i in db.Urunler
                        where (i.urun_id == UrunID)
                        select i).FirstOrDefault<Urunler>();

        DataTable dt = new DataTable();

        dt = (DataTable)HttpContext.Current.Session["Sepet"];
        
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            if (Convert.ToInt16( dt.Rows[i]["UrunId"]) == UrunID)
            {
                
                    int adet = Convert.ToInt16(dt.Rows[i]["adet"]);
                    int fiyat2 = Convert.ToInt16(dt.Rows[i]["toplamfiyat"]);
                    int fiyat3 = Convert.ToInt32(urun.fiyat);

                    adet = adet + Convert.ToInt16(sayii);
                    dt.Rows[i]["adet"] = adet;
                    fiyat2 = fiyat3 * adet;
                    dt.Rows[i]["toplamfiyat"] = fiyat2;

                    HttpContext.Current.Session["Sepet"] = dt;
                    Response.Write("<script lang='JavaScript'> alert ('" + sayii.ToString() + "' +  '  '  + ' adet ürün daha sepetinize eklenmiştir ' );</script>");
                    sayii = 1;
                    Response.Redirect("urundetay.aspx?urunid=" + urun.urun_id + ""); 
                
                

            }
        }

        
        
    }

    protected void btn_yorum_Click(object sender, EventArgs e)
    {

        UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
        

        pcompone_1453Entities3 bdd = new pcompone_1453Entities3();
        Urunler urun = (from i in bdd.Urunler
                        where (i.urun_id == UrunID)
                        select i).FirstOrDefault<Urunler>();
        

            pcompone_1453Entities3 db = new pcompone_1453Entities3();
             Kullanici kullanici = new Kullanici();
             kullaniciid = Convert.ToInt16(Session["ID"]);
            Yorumlar yorum = new Yorumlar();
            var sorgu = from i in db.Kullanici
                        where(i.kullanici_id==kullaniciid)
                      
                        select i;

            if (sorgu.Count() != 0)
            {
                var query = from jjj in db.Kullanici
                            where jjj.kullanici_id == kullaniciid
                            select jjj.kullaniciadi;
                string kullaniciadiii = query.Single();
                yorum.kisi_adi = kullaniciadiii;                   
               
                yorum.urun_id = UrunID;

                yorum.yorum = txt_yorum.Text;


                yorum.tarih = DateTime.Now;

                db.Yorumlar.AddObject(yorum);
                db.SaveChanges();
                Response.Write("<script lang='JavaScript'> alert ('Yorumunuz onay verildikten sonra yayınlanacaktır.');</script>");
                txt_yorum.Text = "";
            }
            else
            {
                Response.Write("<script lang='JavaScript'> alert ('Lütfen giriş yapın veya üye olun');</script>");
            }

    }



    protected void btn_sepetekle_Click(object sender, EventArgs e)
    {
        if (Session["Sepet"] == null)
        {
            DataTable SanalTablo = new DataTable();
            SanalTablo.Columns.Add("id", typeof(int));
            SanalTablo.Columns.Add("UrunId", typeof(int));
            SanalTablo.Columns.Add("adet", typeof(int));
            SanalTablo.Columns.Add("tarih", typeof(DateTime));
            SanalTablo.Columns.Add("toplamfiyat", typeof(int));
            HttpContext.Current.Session["Sepet"] = SanalTablo;

            SanalTablo.Columns["id"].AutoIncrement = true; // Otomatik artan olsun
            SanalTablo.Columns["id"].AutoIncrementSeed = 1; // Kaçtan başlasın
            SanalTablo.Columns["id"].AutoIncrementStep = 1; // Kaçar kaçar artsın
            SanalTablo.PrimaryKey = new DataColumn[] { SanalTablo.Columns["id"] }; // PK tanımlayalım.

        }

        UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Urunler urun = (from i in db.Urunler
                        where (i.urun_id == UrunID)
                        select i).FirstOrDefault<Urunler>();
        int sayı =Convert.ToInt32(urun.fiyat);

        bool varmi = kontrol(a);

        if (varmi == false)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)HttpContext.Current.Session["Sepet"];

           
                SurunlerID.Add(UrunID);
                Surunleradet.Add(Convert.ToInt16(sayii));

                DataRow satir = dt.NewRow();
                satir["UrunId"] = UrunID;
                satir["adet"] = Convert.ToInt16(sayii);
                satir["tarih"] = DateTime.Now;
                int fiyat = sayı * Convert.ToInt16(sayii);
                satir["toplamfiyat"] = fiyat;
                dt.Rows.Add(satir);
                HttpContext.Current.Session["Sepet"] = dt;
                Response.Write("<script lang='JavaScript'> alert ('" + sayii.ToString() + "' +  '  '  + ' adet ürün sepetinize eklenmiştir ' );</script>");
                sayii = 1;
                Response.Redirect("urundetay.aspx?urunid=" + urun.urun_id + ""); 
               


        }


        else if (varmi == true)
        {
            Artir(a);
        }


    }
    protected void arttir_Click(object sender, EventArgs e)
    {
        sayii++;
        txt_adet.Text = sayii.ToString();
    }
    protected void azalttir_Click(object sender, EventArgs e)
    {
        if (sayii>1)
        {
            sayii--;
            txt_adet.Text = sayii.ToString();
        }
    }
}