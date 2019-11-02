using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class Admin_urunguncelle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        if (Request.QueryString["urun_id"]!=null)
        {
            int urun_id = int.Parse(Request.QueryString["urun_id"].ToString());
            if (!IsPostBack)
            {
                verıyukle(urun_id);
            }
        }

        var sorgu = DropDownList1.DataSource = (from i in db.Kategori
                                                select i).ToList<Kategori>();

        DropDownList1.DataTextField = "kategoriismi";
        DropDownList1.DataValueField = "kategori_id";

        DropDownList1.DataBind();

        DropDownList1.DataBind();

    }

    private void verıyukle(int urun_id)
    {
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Urunler urun = (from i in db.Urunler
                        where (i.urun_id == urun_id)
                        select i).FirstOrDefault<Urunler>();

        urunismi.Text = urun.urunismi;
        urunfiyati.Text = urun.fiyat.ToString();
        urunresmi.Text = urun.resim;
        urunundurumu.Text = urun.durum;
        urununozellikleri.Text = urun.ozellikler;
        urunungarantisuresi.Text = urun.garantisuresi;
 DropDownList1.SelectedValue = urun.urunturu;
 DropDownList1.SelectedValue = urun.urunKategoriID.ToString();
        


    }

    protected void btn_guncelle_Click(object sender, EventArgs e)
    {

        if (Request.QueryString["urun_id"]!=null)
        {
            int urun_id = int.Parse(Request.QueryString["urun_id"].ToString());
            pcompone_1453Entities3 db = new pcompone_1453Entities3();
            Urunler urun = (from i in db.Urunler
                            where (i.urun_id == urun_id)
                            select i).FirstOrDefault<Urunler>();

            urun.urunismi = urunismi.Text;
            urun.fiyat = int.Parse(urunfiyati.Text);
            urun.resim = urunresmi.Text;
            urun.durum = urunundurumu.Text;
            urun.ozellikler = urununozellikleri.Text;
            urun.garantisuresi = urunungarantisuresi.Text;
            urun.urunturu = DropDownList1.SelectedItem.ToString();
            urun.urunKategoriID = int.Parse(DropDownList1.SelectedValue);
            urun.eklenmetarihi = DateTime.Now;
            db.SaveChanges();
            

        }
 
    }
    protected void btn_sil_Click(object sender, EventArgs e)
    {
        int urun_id = int.Parse(Request.QueryString["urun_id"].ToString());
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Urunler urun = (from i in db.Urunler
                        where (i.urun_id == urun_id)
                        select i).FirstOrDefault<Urunler>();

        urun.urunismi = urunismi.Text;
        urun.fiyat = int.Parse(urunfiyati.Text);
        urun.resim = urunresmi.Text;
        urun.durum = urunundurumu.Text;
        urun.ozellikler = urununozellikleri.Text;
        urun.garantisuresi = urunungarantisuresi.Text;
        urun.urunturu = DropDownList1.SelectedItem.ToString();
        urun.urunKategoriID = int.Parse(DropDownList1.SelectedValue);
        db.Urunler.DeleteObject(urun);
        db.SaveChanges();

    }
}