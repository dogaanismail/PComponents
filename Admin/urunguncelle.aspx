<%@ Page Language="C#" AutoEventWireup="true" CodeFile="urunguncelle.aspx.cs" Inherits="Admin_urunguncelle" %>

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
            width: 135px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                ÜRÜN GÜNCELLE</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Ürün İsmi</td>
            <td>
                <asp:TextBox ID="urunismi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Ürün Fiyatı</td>
            <td>
                <asp:TextBox ID="urunfiyati" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Ürün Resmi</td>
            <td>
                <asp:TextBox ID="urunresmi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Ürün Kategorisi</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Ürünün Durumu</td>
            <td>
                <asp:TextBox ID="urunundurumu" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Ürünün Özellikleri</td>
            <td>
                <asp:TextBox ID="urununozellikleri" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Garanti Süresi</td>
            <td>
                <asp:TextBox ID="urunungarantisuresi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="btn_guncelle" runat="server" onclick="btn_guncelle_Click" 
                    Text="GÜNCELLE" />
                <asp:Button ID="btn_sil" runat="server" onclick="btn_sil_Click" 
                    Text="ÜRÜN SİL" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
    
    </div>
    </form>
</body>
</html>
