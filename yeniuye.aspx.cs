using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;
using System.Data;
using System.Data.SqlClient;


public partial class yeni_uye : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(@"Data Source=mssql11.domainhizmetleri.com;Initial Catalog=pcompone_1453;Persist Security Info=True;User ID=pcompone_ismail;Password=n5Wfd6_5");

    public class OrnekHataTuru : ApplicationException
    {

        public OrnekHataTuru(string message) : base(message) { }

    }
    int sayacc;

    public bool Bak()
    {

        pcompone_1453Entities3 veri = new pcompone_1453Entities3();
        pcompone_1453Entities3 veri2 = new pcompone_1453Entities3();
        var deger = (from i in veri.Kullanici
                    where i.kullaniciadi==txt_kadi.Text
                    select i).Count();

        var deger2 = (from p in veri2.Kullanici
                      where p.email == txt_email.Text
                      select p).Count();
           
        try
        {
            
                if (deger>=1)
                {

                    throw new OrnekHataTuru("Kullanıcı Adı Veri Tabanında Mevcut, Kullanıcı Adını Kontrol Ediniz !");
                }

                if (deger2>=1)
                {

                    throw new OrnekHataTuru("E-Mail Veri Tabanında Mevcut,Kontrol Ediniz !");
                }
                else
                {
                    return true;
                }
                
                
            
        }

        catch (OrnekHataTuru ex)
        {

            Response.Write("<script lang='JavaScript'> alert ('" +ex.Message+ "');</script>");
            return false;
            
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       

        pcompone_1453Entities3 mkl = new pcompone_1453Entities3();
        rptAnaKategori.DataSource = (from i in mkl.Kategori
                                     where (i.MainKategori == 0)
                                     select i).ToList<Kategori>();

        rptAnaKategori.DataBind();
    }
    

    protected void btn_uyeol_Click(object sender, EventArgs e)
    {

        try
        {
            if (Bak()==false)
            {
                return;
            }
            else
            {
                SqlCommand cmdd = new SqlCommand("insert into Kullanici(adi,soyadi,kullaniciadi,sifre,email,dogumtarihi,dogumyeri,sehir,adres,ceptelefonu,kisi_soru,kisi_cevap) values ('" + txt_ad.Text + "', '" + txt_soyadı.Text + "', '" + txt_kadi.Text + "', '" + txt_sifre.Text + "', '" + txt_email.Text + "', '" + txt_dtarihi.Text + "', '" + txt_dyeri.Text + "', '" + txt_sehir.Text + "', '" + txt_adres.Text + "', '" + txt_cepno.Text + "', '"+ txt_gvsoru.Text+"', '"+txtcevap.Text+"')", con);
                con.Open();
                cmdd.ExecuteNonQuery();
                
                    Response.Write("<script lang='JavaScript'> alert ('Kayıt Eklendi');</script>");
                    con.Close();

               

                txt_ad.Text = "";
                txt_adres.Text = "";
                txt_cepno.Text = "";
                txt_dtarihi.Text = "";
                txt_dyeri.Text = "";
                txt_email.Text = "";
                txt_gvsoru.Text = "";
                txt_kadi.Text = "";
                txt_sehir.Text = "";
                txt_sifre.Text = "";
                txt_soyadı.Text = "";
                txtcevap.Text = "";
            

            }
            
                
        }
        catch (Exception ex)
        {

            Response.Write("<script lang='JavaScript'> alert ('" +ex.Message+ "');</script>");
        }
    }


    protected void rptAnaKategori_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rp = (Repeater)e.Item.FindControl("RpAltKategori");
        SqlConnection baglanti = new SqlConnection(@"Data Source=mssql11.domainhizmetleri.com;Initial Catalog=pcompone_1453;Persist Security Info=True;User ID=pcompone_ismail;Password=n5Wfd6_5");
        baglanti.Open();

        SqlCommand cmdAltKat = new SqlCommand("Select * From Kategori where AnaKategorisi = " + Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "kategori_id").ToString()), baglanti);

        rp.DataSource = cmdAltKat.ExecuteReader();
        rp.DataBind();
        cmdAltKat.Dispose();
        baglanti.Close();
    }
    protected void btn_ara_Click(object sender, EventArgs e)
    {
        string aranan = "arama.aspx?arananurun=" + HttpUtility.UrlEncode(txtara.Text.Trim());
        Response.Redirect(aranan);
    }
}


