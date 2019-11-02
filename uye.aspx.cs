using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pcompone_1453Model;


public partial class uye : System.Web.UI.Page
{
    pcompone_1453Entities3 bd = new pcompone_1453Entities3();
    int kullaniciID;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            kullaniciID = Convert.ToInt16(Session["ID"]);
            Repeater1.DataSource = (from i in bd.Kullanici
                                    where (i.kullanici_id == kullaniciID)
                                    select i).ToList<Kullanici>();
            Repeater1.DataBind();


        }
        else
        {
            Response.Write("<script lang='JavaScript'> alert (' Giriş Yapın veya Üye Olun');</script>");
        }

    }
}