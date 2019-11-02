using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;

public partial class Redcap : System.Web.UI.Page
{

    public string RandomString(int tur)
    {
        Random rnd = new Random();
        string deger = "";
        for (int i = 1; i < tur; i++)
        {
            deger += ((char)rnd.Next('A', 'z')).ToString();

        }
        return deger;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Bitmap bmp = new Bitmap(120, 40);
        Graphics g = Graphics.FromImage(bmp);
        g.Clear(Color.Lavender);
        string randstar = RandomString(7);
        Session["Kepce"] = randstar;
        g.DrawString(randstar, new Font(FontFamily.Families[115], 20, FontStyle.Bold), new SolidBrush(Color.Black), 3, 10);
        g.DrawLine(new Pen(Color.Red, 2), 10, 10, 100, 100);
        g.DrawLine(new Pen(Color.Red, 2), 100, 10, 50, 50);
        Random rmd = new Random();
        for (int i = 0; i < bmp.Width; i++)
        {
            for (int j = 0; j < bmp.Height; j++)
            {
                if (rmd.Next(10) == 1)
                {
                    bmp.SetPixel(i, j, Color.Black);

                }
            }
        }
        bmp.Save(Response.OutputStream, ImageFormat.Png);

    }
}