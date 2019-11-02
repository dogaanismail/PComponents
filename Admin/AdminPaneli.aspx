<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPaneli.aspx.cs" Inherits="Admin_AdminPaneli" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            color: #FF0000;
            text-decoration: underline;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    
        <table class="style1">
            <tr>
           
                <td class="style2" > 
                     <strong>Admin Paneli</strong></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                   <a href="urunekleme.aspx"> Ürün Ekleme  </a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                
                <td> 
               <a href="kategoriekleme.aspx">     Kategori Ekleme</td>
            </tr>
            <tr>
                <td>
                   <a href="../anasayfa.aspx"> Anasayfaya Dön </a></td>
                <td>
                    </td>
            </tr>
            
        </table>

    </div>

    <h3> ZİYARETÇİ SAYISI</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource5" DataKeyNames="hit_id">
        <Columns>
            <asp:BoundField DataField="hit_id" HeaderText="hit_id" 
                SortExpression="hit_id" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="site_hit" HeaderText="site_hit" 
                SortExpression="site_hit" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pcompone_1453ConnectionString2 %>" 
        SelectCommand="SELECT * FROM [Hit]"></asp:SqlDataSource>

    
    

  <h3>  ÜRÜNLER</h3>

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="urun_id" 
        DataSourceID="SqlDataSource6" style="margin-right: 0px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="urun_id" HeaderText="urun_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="urun_id" />
            <asp:BoundField DataField="urunismi" HeaderText="urunismi" 
                SortExpression="urunismi" />
            <asp:BoundField DataField="fiyat" HeaderText="fiyat" SortExpression="fiyat" />
            <asp:BoundField DataField="resim" HeaderText="resim" SortExpression="resim" />
            <asp:BoundField DataField="durum" HeaderText="durum" SortExpression="durum" />
            <asp:BoundField DataField="ozellikler" HeaderText="ozellikler" 
                SortExpression="ozellikler" />
            <asp:BoundField DataField="garantisuresi" HeaderText="garantisuresi" 
                SortExpression="garantisuresi" />
            <asp:BoundField DataField="urunturu" HeaderText="urunturu" 
                SortExpression="urunturu" />
            <asp:BoundField DataField="urunKategoriID" HeaderText="urunKategoriID" 
                SortExpression="urunKategoriID" />
            <asp:BoundField DataField="eklenmetarihi" HeaderText="eklenmetarihi" 
                SortExpression="eklenmetarihi" />
            <asp:BoundField DataField="urun_markaid" HeaderText="urun_markaid" 
                SortExpression="urun_markaid" />
            <asp:BoundField DataField="urun_markaismi" HeaderText="urun_markaismi" 
                SortExpression="urun_markaismi" />
            <asp:BoundField DataField="urunsatissayisi" HeaderText="urunsatissayisi" 
                SortExpression="urunsatissayisi" />
            <asp:BoundField DataField="hit" HeaderText="hit" SortExpression="hit" />
            <asp:BoundField DataField="urungoruntulenmesayisi" 
                HeaderText="urungoruntulenmesayisi" SortExpression="urungoruntulenmesayisi" />
            <asp:BoundField DataField="urun_adet" HeaderText="urun_adet" 
                SortExpression="urun_adet" />
            <asp:BoundField DataField="toplamfiyat" HeaderText="toplamfiyat" 
                SortExpression="toplamfiyat" />
            <asp:BoundField DataField="StokAdedi" HeaderText="StokAdedi" 
                SortExpression="StokAdedi" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pcompone_1453ConnectionString2 %>" 
        DeleteCommand="DELETE FROM [Urunler] WHERE [urun_id] = @urun_id" 
        InsertCommand="INSERT INTO [Urunler] ([urunismi], [fiyat], [resim], [durum], [ozellikler], [garantisuresi], [urunturu], [urunKategoriID], [eklenmetarihi], [urun_markaid], [urun_markaismi], [urunsatissayisi], [hit], [urungoruntulenmesayisi], [urun_adet], [toplamfiyat], [StokAdedi]) VALUES (@urunismi, @fiyat, @resim, @durum, @ozellikler, @garantisuresi, @urunturu, @urunKategoriID, @eklenmetarihi, @urun_markaid, @urun_markaismi, @urunsatissayisi, @hit, @urungoruntulenmesayisi, @urun_adet, @toplamfiyat, @StokAdedi)" 
        SelectCommand="SELECT * FROM [Urunler]" 
        UpdateCommand="UPDATE [Urunler] SET [urunismi] = @urunismi, [fiyat] = @fiyat, [resim] = @resim, [durum] = @durum, [ozellikler] = @ozellikler, [garantisuresi] = @garantisuresi, [urunturu] = @urunturu, [urunKategoriID] = @urunKategoriID, [eklenmetarihi] = @eklenmetarihi, [urun_markaid] = @urun_markaid, [urun_markaismi] = @urun_markaismi, [urunsatissayisi] = @urunsatissayisi, [hit] = @hit, [urungoruntulenmesayisi] = @urungoruntulenmesayisi, [urun_adet] = @urun_adet, [toplamfiyat] = @toplamfiyat, [StokAdedi] = @StokAdedi WHERE [urun_id] = @urun_id">
        <DeleteParameters>
            <asp:Parameter Name="urun_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="urunismi" Type="String" />
            <asp:Parameter Name="fiyat" Type="Int32" />
            <asp:Parameter Name="resim" Type="String" />
            <asp:Parameter Name="durum" Type="String" />
            <asp:Parameter Name="ozellikler" Type="String" />
            <asp:Parameter Name="garantisuresi" Type="String" />
            <asp:Parameter Name="urunturu" Type="String" />
            <asp:Parameter Name="urunKategoriID" Type="Int32" />
            <asp:Parameter Name="eklenmetarihi" Type="DateTime" />
            <asp:Parameter Name="urun_markaid" Type="Int32" />
            <asp:Parameter Name="urun_markaismi" Type="String" />
            <asp:Parameter Name="urunsatissayisi" Type="Int32" />
            <asp:Parameter Name="hit" Type="Int32" />
            <asp:Parameter Name="urungoruntulenmesayisi" Type="Int32" />
            <asp:Parameter Name="urun_adet" Type="Int32" />
            <asp:Parameter Name="toplamfiyat" Type="Int32" />
            <asp:Parameter Name="StokAdedi" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="urunismi" Type="String" />
            <asp:Parameter Name="fiyat" Type="Int32" />
            <asp:Parameter Name="resim" Type="String" />
            <asp:Parameter Name="durum" Type="String" />
            <asp:Parameter Name="ozellikler" Type="String" />
            <asp:Parameter Name="garantisuresi" Type="String" />
            <asp:Parameter Name="urunturu" Type="String" />
            <asp:Parameter Name="urunKategoriID" Type="Int32" />
            <asp:Parameter Name="eklenmetarihi" Type="DateTime" />
            <asp:Parameter Name="urun_markaid" Type="Int32" />
            <asp:Parameter Name="urun_markaismi" Type="String" />
            <asp:Parameter Name="urunsatissayisi" Type="Int32" />
            <asp:Parameter Name="hit" Type="Int32" />
            <asp:Parameter Name="urungoruntulenmesayisi" Type="Int32" />
            <asp:Parameter Name="urun_adet" Type="Int32" />
            <asp:Parameter Name="toplamfiyat" Type="Int32" />
            <asp:Parameter Name="StokAdedi" Type="Int32" />
            <asp:Parameter Name="urun_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />

   <h3>  KULLANICILAR</h3> 
    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="kullanici_id" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="kullanici_id" HeaderText="kullanici_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="kullanici_id" />
            <asp:BoundField DataField="adi" HeaderText="adi" SortExpression="adi" />
            <asp:BoundField DataField="soyadi" HeaderText="soyadi" 
                SortExpression="soyadi" />
            <asp:BoundField DataField="kullaniciadi" HeaderText="kullaniciadi" 
                SortExpression="kullaniciadi" />
            <asp:BoundField DataField="sifre" HeaderText="sifre" SortExpression="sifre" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="dogumtarihi" HeaderText="dogumtarihi" 
                SortExpression="dogumtarihi" />
            <asp:BoundField DataField="dogumyeri" HeaderText="dogumyeri" 
                SortExpression="dogumyeri" />
            <asp:BoundField DataField="sehir" HeaderText="sehir" SortExpression="sehir" />
            <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
            <asp:BoundField DataField="ceptelefonu" HeaderText="ceptelefonu" 
                SortExpression="ceptelefonu" />
            <asp:BoundField DataField="kisi_soru" HeaderText="kisi_soru" 
                SortExpression="kisi_soru" />
            <asp:BoundField DataField="kisi_cevap" HeaderText="kisi_cevap" 
                SortExpression="kisi_cevap" />
            <asp:BoundField DataField="aktiflik" HeaderText="aktiflik" 
                SortExpression="aktiflik" />
            <asp:BoundField DataField="durum" HeaderText="durum" SortExpression="durum" />
            <asp:BoundField DataField="kullanicikimligi" HeaderText="kullanicikimligi" 
                SortExpression="kullanicikimligi" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pcompone_1453ConnectionString2 %>" 
        DeleteCommand="DELETE FROM [Kullanici] WHERE [kullanici_id] = @kullanici_id" 
        InsertCommand="INSERT INTO [Kullanici] ([adi], [soyadi], [kullaniciadi], [sifre], [email], [dogumtarihi], [dogumyeri], [sehir], [adres], [ceptelefonu], [kisi_soru], [kisi_cevap], [aktiflik], [durum], [kullanicikimligi]) VALUES (@adi, @soyadi, @kullaniciadi, @sifre, @email, @dogumtarihi, @dogumyeri, @sehir, @adres, @ceptelefonu, @kisi_soru, @kisi_cevap, @aktiflik, @durum, @kullanicikimligi)" 
        SelectCommand="SELECT * FROM [Kullanici]" 
        UpdateCommand="UPDATE [Kullanici] SET [adi] = @adi, [soyadi] = @soyadi, [kullaniciadi] = @kullaniciadi, [sifre] = @sifre, [email] = @email, [dogumtarihi] = @dogumtarihi, [dogumyeri] = @dogumyeri, [sehir] = @sehir, [adres] = @adres, [ceptelefonu] = @ceptelefonu, [kisi_soru] = @kisi_soru, [kisi_cevap] = @kisi_cevap, [aktiflik] = @aktiflik, [durum] = @durum, [kullanicikimligi] = @kullanicikimligi WHERE [kullanici_id] = @kullanici_id">
        <DeleteParameters>
            <asp:Parameter Name="kullanici_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="adi" Type="String" />
            <asp:Parameter Name="soyadi" Type="String" />
            <asp:Parameter Name="kullaniciadi" Type="String" />
            <asp:Parameter Name="sifre" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="dogumtarihi" Type="String" />
            <asp:Parameter Name="dogumyeri" Type="String" />
            <asp:Parameter Name="sehir" Type="String" />
            <asp:Parameter Name="adres" Type="String" />
            <asp:Parameter Name="ceptelefonu" Type="String" />
            <asp:Parameter Name="kisi_soru" Type="String" />
            <asp:Parameter Name="kisi_cevap" Type="String" />
            <asp:Parameter Name="aktiflik" Type="Int32" />
            <asp:Parameter Name="durum" Type="Int32" />
            <asp:Parameter Name="kullanicikimligi" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="adi" Type="String" />
            <asp:Parameter Name="soyadi" Type="String" />
            <asp:Parameter Name="kullaniciadi" Type="String" />
            <asp:Parameter Name="sifre" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="dogumtarihi" Type="String" />
            <asp:Parameter Name="dogumyeri" Type="String" />
            <asp:Parameter Name="sehir" Type="String" />
            <asp:Parameter Name="adres" Type="String" />
            <asp:Parameter Name="ceptelefonu" Type="String" />
            <asp:Parameter Name="kisi_soru" Type="String" />
            <asp:Parameter Name="kisi_cevap" Type="String" />
            <asp:Parameter Name="aktiflik" Type="Int32" />
            <asp:Parameter Name="durum" Type="Int32" />
            <asp:Parameter Name="kullanicikimligi" Type="String" />
            <asp:Parameter Name="kullanici_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

 <br /><br />

    <h3> YORUMLAR</h3><br />
    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="yorum_id" 
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="yorum_id" HeaderText="yorum_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="yorum_id" />
            <asp:BoundField DataField="kisi_adi" HeaderText="kisi_adi" 
                SortExpression="kisi_adi" />
            <asp:BoundField DataField="yorum" HeaderText="yorum" SortExpression="yorum" />
            <asp:BoundField DataField="tarih" HeaderText="tarih" SortExpression="tarih" />
            <asp:BoundField DataField="urun_id" HeaderText="urun_id" 
                SortExpression="urun_id" />
            <asp:BoundField DataField="onay" HeaderText="onay" SortExpression="onay" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:pcompone_1453ConnectionString2 %>" 
        DeleteCommand="DELETE FROM [Yorumlar] WHERE [yorum_id] = @yorum_id" 
        InsertCommand="INSERT INTO [Yorumlar] ([kisi_adi], [yorum], [tarih], [urun_id], [onay]) VALUES (@kisi_adi, @yorum, @tarih, @urun_id, @onay)" 
        SelectCommand="SELECT * FROM [Yorumlar]" 
        UpdateCommand="UPDATE [Yorumlar] SET [kisi_adi] = @kisi_adi, [yorum] = @yorum, [tarih] = @tarih, [urun_id] = @urun_id, [onay] = @onay WHERE [yorum_id] = @yorum_id">
        <DeleteParameters>
            <asp:Parameter Name="yorum_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="kisi_adi" Type="String" />
            <asp:Parameter Name="yorum" Type="String" />
            <asp:Parameter Name="tarih" Type="DateTime" />
            <asp:Parameter Name="urun_id" Type="Int32" />
            <asp:Parameter Name="onay" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="kisi_adi" Type="String" />
            <asp:Parameter Name="yorum" Type="String" />
            <asp:Parameter Name="tarih" Type="DateTime" />
            <asp:Parameter Name="urun_id" Type="Int32" />
            <asp:Parameter Name="onay" Type="Int32" />
            <asp:Parameter Name="yorum_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />

    </form>
</body>
</html>
