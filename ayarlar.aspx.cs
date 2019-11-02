using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class ayarlar : System.Web.UI.Page
{
    int kullaniciid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            kullaniciid = Convert.ToInt16(Session["ID"]);
            veriyukle();
            
        }


    }
    private void veriyukle()
    {
        pcompone_1453Entities3 bd = new pcompone_1453Entities3();
        kullaniciid = Convert.ToInt16(Session["ID"]);
        Kullanici kullanici = (from i in bd.Kullanici
                               where (i.kullanici_id == kullaniciid)
                               select i).FirstOrDefault<Kullanici>();


        txtad.Text = kullanici.adi;
        txtsoyad.Text = kullanici.soyadi;
        txt_kadi.Text = kullanici.kullaniciadi;
        txtemail.Text = kullanici.email;
        txtsehir.Text = kullanici.sehir;

        txtadres.Text = kullanici.adres;
        txtsifre.Text = kullanici.sifre;
        txtceptelefonu.Text = kullanici.ceptelefonu;
        txtdogumtarihi.Text = kullanici.dogumtarihi;
        txtdogumyeri.Text = kullanici.dogumyeri;

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        pcompone_1453Entities3 bd = new pcompone_1453Entities3();
        kullaniciid = Convert.ToInt16(Session["ID"]);
        Kullanici kullanici = (from i in bd.Kullanici
                               where (i.kullanici_id == kullaniciid)
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
        Response.Write("<script lang='JavaScript'> alert ('Güncelleme Başarılı');</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        kullaniciid = Convert.ToInt16(Session["ID"]);
        Session.Remove("ID");
        Response.Redirect("anasayfa.aspx");
    }
}