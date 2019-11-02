<%@ Page Title="" Language="C#" MasterPageFile="~/satınal.master" AutoEventWireup="true" CodeFile="satınal.aspx.cs" Inherits="satınal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" >
        
    <HeaderTemplate></HeaderTemplate>
    <ItemTemplate>
    <table width="700px" cellspacing="0" cellpadding="5">
                   	  <tr bgcolor="#CCCCCC">
                        	<th width="220" align="left">Ürün Resmi </th> 
                        	<th width="180" align="left">Ürün İsmi </th> 
                       	  	<th width="100" align="center">Ürün Adeti</th> 
                        	<th width="60" align="right">Ürün Fiyatı </th> 
                        	<th width="60" align="right">Toplam Fiyat</th> 
                        
                            
                      </tr>
                    	<tr>
                        	<td> 
                            
                             <img src='resim/<%#Eval("resim") %>' alt="image 01" />  </td> 

                        	<td><%#Eval("urunismi") %></td> 
                            <td align="center"><%#Eval("urun_adet") %> </td>
                            <td align="right"><%#Eval("fiyat") %> $</td> 
                            <td align="right"><%#Eval("toplamfiyat")%> $</td>
                           
						</tr>
                        
                        <tr>
                        	
                            <td align="right" style="background:#ccc; font-weight:bold"> Toplam Fiyat</td>
                            <td align="right" style="background:#ccc; font-weight:bold">$ <%#Eval("toplamfiyat") %></td>
                            <td style="background:#ccc; font-weight:bold"> </td>
						</tr>
					</table>

                    <div style="float:right; width: 215px; margin-top: 20px;">
                   
                       
                        <div class="cleaner h20"></div>
                        
                       
    
    </ItemTemplate>
    <FooterTemplate></FooterTemplate>
    </asp:Repeater>
     <asp:Button ID="btn_odeme" runat="server" Text="ÖDEMEYE GEÇ" 
        onclick="btn_odeme_Click" />  <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     <a href="uyegirisi.aspx">   <asp:Label ID="Label1" runat="server"  Font-Size="Medium"></asp:Label></a>
</asp:Content>

