using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class Admin_kategoriekleme : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnekle_Click(object sender, EventArgs e)
    {

        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        db.Kategori.AddObject(new Kategori()
        {
            kategoriismi = TextBox1.Text,
            MainKategori= int.Parse(maink.Text),
            AnaKategorisi= int.Parse(anak.Text),
            urun_markaid= int.Parse(urunmk.Text),

           
        });
        db.SaveChanges();



        

    }
    protected void btn_sil_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["kategori_id"]!=null)
        {
            int kategori_id = int.Parse(Request.QueryString["kategori_id"].ToString());

            pcompone_1453Entities3 db = new pcompone_1453Entities3();
            Kategori kategori = (from i in db.Kategori
                                 where(i.kategori_id==kategori_id)
                                 select i).FirstOrDefault<Kategori>();

            kategori.kategoriismi = TextBox1.Text;
           

            db.Kategori.DeleteObject(kategori);
            db.SaveChanges();

        }

    }
}