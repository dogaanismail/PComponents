<%@ Page Title="" Language="C#" MasterPageFile="~/satınal.master" AutoEventWireup="true" CodeFile="satinalinan.aspx.cs" Inherits="satinalinan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h4> SATIN ALINAN ÜRÜNLER </h4>
    <table width="600px" cellspacing="0" cellpadding="2">
   
                   	  <tr bgcolor="#CCCCCC">
                        	<th width="100" align="center">Ürün Resmi </th> 
                        	<th width="100" align="center">Ürün İsmi </th> 
                       	  	<th width="60" align="center">Ürün Adeti</th> 
                        	<th width="60" align="center">Ürün Fiyatı </th> 
                            <th width="60" align="center">Ürünün Toplam Fiyatı </th> 
                            <th width="160" align="center">Satın Alınan Tarih</th> 
                            <th width="95" align="right"></th> 
                            </tr>

    <asp:Repeater ID="Repeater1" runat="server" onitemcommand="Repeater1_ItemCommand" >
        
    <HeaderTemplate></HeaderTemplate>
    <ItemTemplate>
 
                    	<tr>
                        	<td> 
                            
                             <img src='resim/<%#Eval("resim") %>' alt="image 01" height="45" width="45" />  </td> 
                        	<td><%#Eval("urunismi") %></td> 
                            <td align="center"><%#Eval("urun_adet") %> </td>
                            <td align="center"><%#Eval("fiyat") %> $</td> 
                            <td align="center"><%#Eval("toplamfiyat") %> $</td> 
                            <td align="center"><%#Eval("datetime") %></td> 
                             <td align="right">
                                 <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandName="lblislem" CommandArgument='<%#Eval("urun_id")%>'  OnClientClick="return confirm('Silme işlemini Onaylıyor musunuz?');" Text="Listeden Kaldır" ></asp:LinkButton>--%>
                      <asp:Button ID="Button1" runat="server" Text="Listeden Kaldır" CommandName="btnislem"  CommandArgument='<%#Eval("urun_id")%>' OnClientClick="return confirm('Silme işlemini Onaylıyor musunuz?');" /></td> 
                          
						</tr>
                
            
    </ItemTemplate>
    <FooterTemplate></FooterTemplate>
    </asp:Repeater>
     </table>
     <table>
     <tr>
     <td>
     <h3>Sayfa Toplamı: 
         <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
     </td>
     
     
     </tr>
     </table>
    
      <div style="float:right; width: 215px; margin-top:20px;">
       <div class="cleaner h20"></div>
   

</asp:Content>

