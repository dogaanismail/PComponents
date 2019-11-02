<%@ Page Title="" Language="C#" MasterPageFile="~/kategoriurunler.master" AutoEventWireup="true" CodeFile="uye.aspx.cs" Inherits="uye" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate></HeaderTemplate>
    <ItemTemplate>
    <table>
    <tr>
    
    <td>   
    <h4> HOŞGELDİNİZ SAYIN</h4></td> <td></td>

    <td>
   <h4> <%#Eval("kullaniciadi") %>  </h4>
    </td>
    
    
    </tr>
    
    
    </table>
    
    </ItemTemplate>
    <FooterTemplate></FooterTemplate>
    </asp:Repeater><br /> <br />

  
     <asp:BulletedList ID="BulletedList1" runat="server" BorderColor="#0066FF" 
        Font-Size="Medium" BulletStyle="Square" DisplayMode="HyperLink">
      <asp:ListItem style="padding-bottom:12px" Text="SATIN ALDIKLARIM"  value="satinalinan.aspx"></asp:ListItem> 
        
        <asp:ListItem style="padding-bottom:12px" Text="FAVORİ ÜRÜNLERİM"  value="favoriurun.aspx"> </asp:ListItem>
       
        <asp:ListItem  style="padding-bottom:12px" Text="BİLGİLERİM / AYARLARIM" Value="ayarlar.aspx" ></asp:ListItem>
         <asp:ListItem Value="sepet.aspx">SEPETİM</asp:ListItem>
        </asp:BulletedList>
    

</asp:Content>

