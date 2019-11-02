using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;

public partial class ekrankartları : System.Web.UI.Page
{
    int UrunKategoriId;
    int UrunMarkaId;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UrunKategoriId = Convert.ToInt32(Request.QueryString["kategoriid"]);
            UrunMarkaId= Convert.ToInt32(Request.QueryString["urunmarkaid"]);
        }

        pcompone_1453Entities3 db = new pcompone_1453Entities3();
        Repeater1.DataSource = (from i in db.Urunler
                                where (i.urunKategoriID==UrunKategoriId || i.urun_markaid== UrunMarkaId )
                               
                               
                                select i).ToList<Urunler>();
        Repeater1.DataBind();
    }


    protected void btn_listele_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue=="Ucuzdan Pahalıya")
        {
            UrunKategoriId = Convert.ToInt32(Request.QueryString["kategoriid"]);
            UrunMarkaId = Convert.ToInt32(Request.QueryString["urunmarkaid"]);

            pcompone_1453Entities3 bd = new pcompone_1453Entities3();
            var sorgu = from liste in bd.Urunler
                        where (liste.urun_markaid == UrunMarkaId || liste.urunKategoriID==UrunKategoriId)
                         orderby liste.fiyat ascending
                         select liste;


            Repeater1.DataSource = sorgu;
            Repeater1.DataBind();

        }

        if (DropDownList1.SelectedValue=="Pahalıdan Ucuza")
        {
            UrunKategoriId = Convert.ToInt32(Request.QueryString["kategoriid"]);
            UrunMarkaId = Convert.ToInt32(Request.QueryString["urunmarkaid"]);
            pcompone_1453Entities3 bd = new pcompone_1453Entities3();
            
            var sorgu = from liste in bd.Urunler
                        where (liste.urun_markaid == UrunMarkaId || liste.urunKategoriID == UrunKategoriId)
                        orderby liste.fiyat descending
                        select liste;


            Repeater1.DataSource = sorgu;
            Repeater1.DataBind();
            
        }

        if (DropDownList1.SelectedValue=="Beğeni Sayısına Göre")
        {

            UrunKategoriId = Convert.ToInt32(Request.QueryString["kategoriid"]);
            UrunMarkaId = Convert.ToInt32(Request.QueryString["urunmarkaid"]);
            pcompone_1453Entities3 bd = new pcompone_1453Entities3();
            var sorgu = from liste in bd.Urunler
                        where (liste.urun_markaid == UrunMarkaId || liste.urunKategoriID == UrunKategoriId)
                        orderby liste.hit descending
                        select liste;

            Repeater1.DataSource = sorgu;
            Repeater1.DataBind();

            
        }

        if (DropDownList1.SelectedValue == "Satış Sayısına Göre")
        {
            UrunKategoriId = Convert.ToInt32(Request.QueryString["kategoriid"]);
            UrunMarkaId = Convert.ToInt32(Request.QueryString["urunmarkaid"]);

            pcompone_1453Entities3 bd = new pcompone_1453Entities3();
            var sorgu = from liste in bd.Urunler
                        where (liste.urun_markaid == UrunMarkaId || liste.urunKategoriID == UrunKategoriId)
                        orderby liste.urunsatissayisi descending
                        select liste;


            Repeater1.DataSource = sorgu;
            Repeater1.DataBind();

        }
        if (DropDownList1.SelectedValue == "Tarihe Göre(En Yeni)")
        {
            UrunKategoriId = Convert.ToInt32(Request.QueryString["kategoriid"]);
            UrunMarkaId = Convert.ToInt32(Request.QueryString["urunmarkaid"]);

            pcompone_1453Entities3 bd = new pcompone_1453Entities3();
            var sorgu = from liste in bd.Urunler
                        where (liste.urun_markaid == UrunMarkaId || liste.urunKategoriID == UrunKategoriId)
                        orderby liste.eklenmetarihi descending
                        select liste;


            Repeater1.DataSource = sorgu;
            Repeater1.DataBind();

        }
        if (DropDownList1.SelectedValue == "Tarihe Göre(En Eski)")
        {
            UrunKategoriId = Convert.ToInt32(Request.QueryString["kategoriid"]);
            UrunMarkaId = Convert.ToInt32(Request.QueryString["urunmarkaid"]);

            pcompone_1453Entities3 bd = new pcompone_1453Entities3();
            var sorgu = from liste in bd.Urunler
                        where (liste.urun_markaid == UrunMarkaId || liste.urunKategoriID == UrunKategoriId)
                        orderby liste.eklenmetarihi ascending
                        select liste;


            Repeater1.DataSource = sorgu;
            Repeater1.DataBind();

        }
    }
    
    

   
}