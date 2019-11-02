using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class odeme : System.Web.UI.Page
{
    int UrunID;
    int kullaniciid;
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox6.Text = "  Satış Sözleşmesi :  MADDE 1:Eğer Ürün Bozuk veya arızalıysa lütfen bizi 24 saat içinde haberdar ediniz.Aksi halde müessemiz bu durumda sorumluluk almaz.         MADDE 2:Lütfen yukarıdaki adresi kontrol ediniz satın aldığınız ürün o adrese gönderelecektir.     MADDE 3: Kulanım kılavuzu,garanti belgesi vb. evrakları size ulaştırmakta biz sorumluyuz";

        if (!IsPostBack)
        {
            UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
            kullaniciid = Convert.ToInt16(Session["ID"]);

            pcompone_1453Entities3 k = new pcompone_1453Entities3();
                var sorgulamaifadesi = (from i in k.Kullanici

                                        where (i.kullanici_id==kullaniciid)

                                        select i).ToList<Kullanici>();

                if (sorgulamaifadesi.Count() !=0)
                {
                    Repeater2.DataSource = sorgulamaifadesi;
                    Repeater2.DataBind();
                    btn_cikisyap.Visible = true;
                    
                }
                else
                {
                    btn_cikisyap.Visible = false;
                }

                veriyukle();

        }


        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        UrunID = Convert.ToInt32(Request.QueryString["urunid"]);
        Repeater1.DataSource = (from i in db.Urunler
                                    where(i.urun_id==UrunID)
                                    select i).ToList<Urunler>();
                         
        Repeater1.DataBind();

        }

    private void veriyukle()
    {
        pcompone_1453Entities3 bd = new pcompone_1453Entities3();
        kullaniciid = Convert.ToInt16(Session["ID"]);
        Kullanici kullanici = (from i in bd.Kullanici
                               where (i.kullanici_id==kullaniciid)
                               select i).FirstOrDefault<Kullanici>();

        txt_kadi.Text = kullanici.kullaniciadi;
        txtad.Text = kullanici.adi;
        txtsoyad.Text = kullanici.soyadi;
        txtemail.Text = kullanici.email;
        txtsehir.Text = kullanici.sehir;
       
        txtadres.Text = kullanici.adres;
        txtsifre.Text = kullanici.sifre;
        txtceptelefonu.Text = kullanici.ceptelefonu;
        txtdogumtarihi.Text = kullanici.dogumtarihi;
        txtdogumyeri.Text = kullanici.dogumyeri;

    }

    protected void btn_cikisyap_Click(object sender, EventArgs e)
    {
        kullaniciid = Convert.ToInt16(Session["ID"]);
        Session.Remove("ID");
        Response.Redirect("anasayfa.aspx");
        btn_cikisyap.Visible = false;
    }
    protected void btn_ode_Click(object sender, EventArgs e)
    {
        if(CheckBox1.Checked == true)
            
        {
            Label1.Text="Ürün Adresinize Gönderilmiştir";
        }
        else if (CheckBox1.Checked == false)
        {
            Label1.Text = " Satış Sözleşmesini kabul etmeden bu ürünü alamazsınız";
        }

    }
  
    protected void btn_ara_Click(object sender, EventArgs e)
    {
        string aranan = "arama.aspx?arananurun=" + HttpUtility.UrlEncode(txtara.Text.Trim());
        Response.Redirect(aranan);

    }

    protected void btn_guncel_Click(object sender, EventArgs e)
    {
        pcompone_1453Entities3 bd = new pcompone_1453Entities3();
       kullaniciid = Convert.ToInt16(Session["ID"]);
        Kullanici kullanici = (from i in bd.Kullanici
                               where (i.kullanici_id==kullaniciid)
                               select i).FirstOrDefault<Kullanici>();
        kullanici.adi = txtad.Text;
        kullanici.soyadi = txtsoyad.Text;
        kullanici.kullaniciadi = txt_kadi.Text;
        kullanici.sifre = txtsifre.Text;
        kullanici.email = txtemail.Text;
        kullanici.dogumtarihi = txtdogumtarihi.Text;
        kullanici.dogumyeri = txtdogumyeri.Text;

        kullanici.adres = txtadres.Text;
        kullanici.ceptelefonu = txtceptelefonu.Text;

        kullanici.sehir = txtsehir.Text;

        bd.SaveChanges();

        Label2.Text = " Güncelleme Başarılı";
    }
}