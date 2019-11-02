<%@ Page Language="C#" AutoEventWireup="true" CodeFile="urunekleme.aspx.cs" Inherits="Admin_urunekleme" %>

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
            width: 177px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    ÜRÜN EKLEME</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Ürün İsmi:</td>
                <td>
                    <asp:TextBox ID="txturunismi" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Ürün Fiyatı:</td>
                <td>
                    <asp:TextBox ID="txturunfiyati" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Ürün Resmi:</td>
                <td id="xt">
                    <asp:TextBox ID="txturunresmi" runat="server"></asp:TextBox>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="YÜKLE" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Ürün Kategorisi</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" >
                        
                    </asp:DropDownList>
                 
                       
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Ürünün Durumu</td>
                <td>
                    <asp:TextBox ID="txturundurum" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Ürün Markası</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Ürün Özellikleri</td>
                <td>
                    <asp:TextBox ID="txturununozellikleri" runat="server" Height="38px" 
                        TextMode="MultiLine" Width="205px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Garanti Süresi</td>
                <td>
                    <asp:TextBox ID="txtsure" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btn_ekle" runat="server" onclick="btn_ekle_Click" Text="EKLE" />
                &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                &nbsp;&nbsp; 
                   
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Image ID="Image1" runat="server" />
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
    
    </div>
    </form>
</body>
</html>
