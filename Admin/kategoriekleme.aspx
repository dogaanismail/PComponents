<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kategoriekleme.aspx.cs" Inherits="Admin_kategoriekleme" %>

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
            width: 172px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;Kategori İsmi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Main Kategori</td>
            <td>
                <asp:TextBox ID="maink" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Ana Kategorisi</td>
            <td>
                <asp:TextBox ID="anak" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Urun Markaİd</td>
            <td>
                <asp:TextBox ID="urunmk" runat="server"></asp:TextBox>
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
    </table>
    <div>
    
                <asp:Button ID="btnekle" runat="server" onclick="btnekle_Click" Text="EKLE" />
    
    &nbsp;&nbsp;
                <asp:Button ID="btn_sil" runat="server" onclick="btn_sil_Click" Text="SİL" />
    
    </div>
    </form>
</body>
</html>
