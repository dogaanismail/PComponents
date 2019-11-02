<%@ Page Title="" Language="C#" MasterPageFile="~/kategoriurunler.master" AutoEventWireup="true" CodeFile="kategoriurunler.aspx.cs" Inherits="ekrankartları" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>ÜRÜNLER   </h2>
 <table>
 <tr>
 
 <td>
  <h4>  Sırala :         </h4> 
 
 </td>

 <td>
  <asp:DropDownList ID="DropDownList1" runat="server" >
      <asp:ListItem>Sıralama</asp:ListItem>
      <asp:ListItem>Ucuzdan Pahalıya</asp:ListItem>
      <asp:ListItem>Pahalıdan Ucuza</asp:ListItem>
      <asp:ListItem>Beğeni Sayısına Göre</asp:ListItem>
      <asp:ListItem>Satış Sayısına Göre</asp:ListItem>
      <asp:ListItem>Tarihe Göre(En Yeni)</asp:ListItem>
      <asp:ListItem>Tarihe Göre(En Eski)</asp:ListItem>
     </asp:DropDownList>
 </td>

 <td>
     <asp:Button ID="btn_listele" runat="server" Text="LİSTELE" 
         onclick="btn_listele_Click" />
 </td>

 </tr>
 </table>

    

    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>

    </HeaderTemplate>

    <ItemTemplate>
    
    <div class="col col_14 product_gallery">

                  <a href="urundetay.aspx?urunid=<%#Eval("urun_id") %>"> 
                <img src='resim/<%#Eval("resim") %>' alt=""/>
                
                </a>

                <h3><%#Eval("urunismi") %></h3>
                <p class="product_price">$ <%#Eval("fiyat") %></p>

                Eklenme Tarihi: <h6>   <%#Eval("eklenmetarihi")%></h6> 
                
                
              
              

       
            </div>        	

    </ItemTemplate>

    <FooterTemplate>
    </FooterTemplate>
    
    </asp:Repeater>


</asp:Content>

