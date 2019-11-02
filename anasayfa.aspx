<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfa.master" AutoEventWireup="true" CodeFile="anasayfa.aspx.cs" Inherits="anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        color: #CC3300;
        font-weight: normal;
        text-decoration: underline;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <h4 class="style1"> <strong>RASTGELE ÜRÜNLER   </strong>   </h4>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate></HeaderTemplate>

    <ItemTemplate>
     <div class="col col_14 product_gallery">
            	<a href="urundetay.aspx?urunid=<%#Eval("urun_id") %>"> 
                <img src='resim/<%#Eval("resim") %>' alt="Product 01"/>
                
                </a>


               <a href="urundetay.aspx?urunid=<%#Eval("urun_id") %>">  <h3><%#Eval("urunismi") %></a></h3>
                <p class="product_price"> <%#Eval("fiyat")  %> $</p>
               
            </div>        	
            
                
            
    </ItemTemplate>
    <FooterTemplate>
    </FooterTemplate>
    </asp:Repeater>

    
</asp:Content>

