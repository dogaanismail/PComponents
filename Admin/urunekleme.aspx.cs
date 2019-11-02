using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using pcompone_1453Model;
using System.IO;

public partial class Admin_urunekleme : System.Web.UI.Page
{
    string dosyauzantisi;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        if (!IsPostBack)
        {
            txturunresmi.Enabled = false;

            var sorgu = DropDownList1.DataSource = (from i in db.Kategori
                                                    select i).ToList<Kategori>();

            DropDownList1.DataTextField = "kategoriismi";
            DropDownList1.DataValueField = "kategori_id";

            DropDownList1.DataBind();

            pcompone_1453Entities3 kjlm = new pcompone_1453Entities3();
            var getir = DropDownList2.DataSource = (from i in kjlm.Markalar
                                                    select i).ToList<Markalar>();

            DropDownList2.DataTextField = "markaismi";
            DropDownList2.DataValueField = "marka_id";
            DropDownList2.DataBind();

            
        }


    }


    protected void btn_ekle_Click(object sender, EventArgs e)
    {

        Urunler urun = new Urunler();

        urun.urunismi = txturunismi.Text;
        urun.fiyat = int.Parse(txturunfiyati.Text);
        urun.resim = txturunresmi.Text.ToString();
        urun.durum = txturundurum.Text;
        urun.ozellikler = txturununozellikleri.Text;
        urun.garantisuresi = txtsure.Text;
        urun.urunturu = DropDownList1.SelectedItem.ToString();

        urun.urunKategoriID = int.Parse(DropDownList1.SelectedValue);
        urun.eklenmetarihi = DateTime.Now;

        urun.urun_markaid = int.Parse(DropDownList2.SelectedValue);
        urun.urun_markaismi = DropDownList2.SelectedItem.ToString();

        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        db.Urunler.AddObject(urun);
        db.SaveChanges();
        Response.Write("<script lang='JavaScript'> alert ('Ürün Eklendi!');</script>"); 
        Response.Redirect("urunekleme.aspx");
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        
         HttpPostedFile yuklenecekDosya = FileUpload1.PostedFile;
        if (yuklenecekDosya!=null)
        {
        
            FileInfo dosyaBilgisi = new FileInfo(yuklenecekDosya.FileName);
            string dosya="resim";
           string yuklenmeyerii= Server.MapPath("httpdocs/"+ dosya + dosyaBilgisi.Name);
            

                FileUpload1.SaveAs(yuklenmeyerii);
                Response.Write("<script lang='JavaScript'> alert ('Dosya Yüklendi' +  '     '  +  '" + FileUpload1.PostedFile.FileName +"');</script>");
                string imageSrc = "~/resim/" + FileUpload1.FileName;
                Image1.ImageUrl = imageSrc;
                Image1.BorderWidth = 2;
                Image1.BorderColor = System.Drawing.Color.SeaGreen;
                txturunresmi.Text = FileUpload1.FileName;

            
        }
        else
        {
            Label1.Text = "Lütfen Dosya seçin.";
        }
    }
}