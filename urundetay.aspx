<%@   Page Title="" Language="C#" MasterPageFile="~/urundetay.master" AutoEventWireup="true" CodeFile="urundetay.aspx.cs" Inherits="urundetay"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Ürün Detayı</h2> 

    <asp:Label ID="Label1" runat="server" Text="" Font-Size="Large"></asp:Label>
    
            
                <table>
                <tr>
                <td>
                Adet : 
                </td>
                <td>
                
                 <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate> 
                     <asp:TextBox ID="txt_adet" runat="server" Width="20px" Height="20px" 
                             EnableViewState="False"></asp:TextBox>
                    <asp:Button ID="arttir" runat="server" Text="+" onclick="arttir_Click" />
                         <asp:Button ID="azalttir"
                        runat="server" Text="-" onclick="azalttir_Click" /> 
                        </ContentTemplate>
                       
                    </asp:UpdatePanel>
               
                        
                </td>
                    
                <td>
                    &nbsp;</td>
                </tr>
    <asp:Repeater ID="Repeater1" runat="server" >
    <HeaderTemplate>

    </HeaderTemplate>

    <ItemTemplate>
    <div class=" col col_13">
        	<a  rel="lightbox[portfolio]"  title="<%#Eval("urunismi") %>"> <img src='resim/<%#Eval("resim") %>' alt="" /></a>
            </div>
            <div class=" col col_13 no_margin_right">
                <tr>
                        <td height="30" width="160">Ürün İsmi:</td>
                        <td><%#Eval("urunismi") %></td>
                    </tr>
                    <tr>
                        <td height="30" width="160">Ürün Fiyatı:</td>
                        <td><%#Eval("fiyat") %> $</td>
                    </tr>
                    <tr>
                        <td height="30">Stoktaki Durumu:</td>
                        <td><%#Eval("StokAdedi")%> Adet </td>
                    </tr>
                    

                     <tr>
                        <td height="30">Garanti Süresi:</td>
                        <td><%#Eval("garantisuresi") %></td>
                    </tr>

                    <tr>
                    <td>
                    Ürün Favori Sayısı: 
                    </td>
                        <td>
                           <%#Eval("hit") %>
                        </td>
                    </tr>

                    <tr>

                    <td>
                    Ürün Görüntülenme Sayısı:                   
                    </td>

                    <td>
                    <%#Eval("urungoruntulenmesayisi") %>
                    </td>
                    
                    </tr>


                     <tr>

                    <td>
                    Ürün Satış Sayısı:                   
                    </td>

                    <td>
                    <%#Eval("urunsatissayisi")%>
                    </td>
                    
                    </tr>

                  
          
    </ItemTemplate>

    <FooterTemplate>
      
    </FooterTemplate>
    
    </asp:Repeater>
    <tr>
    <td>
     <asp:Button ID="btn_satınal" runat="server" Text="Hemen Satın Al" 
                        OnClick="btn_satınal_Click"  />     
    </td>
    <td>
                       <asp:Button ID="btn_sepetekle" runat="server" 
        Text="Sepete Ekle" OnClientClick="return confirm('İşlemi Onaylıyor musunuz?');" 
        onclick="btn_sepetekle_Click"  />
    </td>
                
    </tr>
    
    
     </table>
    <div class="cleaner h20">
     </div>
      </div>

  <div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Yorumlar</li>
    <li class="TabbedPanelsTab" tabindex="0">Ürün Özellikleri</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
  
    <div class="TabbedPanelsContent">
    
    
    <asp:Repeater ID="Repeater2" runat="server">
                       <HeaderTemplate>
                       </HeaderTemplate>
                       <ItemTemplate>
                       
                  <table>
                  <tr>

                  <td>
                  <%#Eval("kisi_adi")%> : 
                  </td>
                 
                  <td>
                  <%#Eval("yorum") %>
                  </td>
                 
                  <td>
                  
                  <br />
                 
                <h6>   <%#Eval("tarih") %></h6> 
                  </td>
                 </tr>
                

                  </table>
                           
                       </ItemTemplate>
                       <FooterTemplate>
                       </FooterTemplate>
                   </asp:Repeater>
               <table>
               
               <tr>
               <td>
               YORUMUNUZ:
               </td>
               <td>
                   <asp:TextBox ID="txt_yorum" runat="server" TextMode="MultiLine"></asp:TextBox>
               </td>
               </tr>

               </table>
                     <asp:Button ID="btn_yorum" runat="server" Text="YORUM YAP" onclick="btn_yorum_Click" />
    
    </div>


    <div class="TabbedPanelsContent">
    
        <asp:Repeater ID="Repeater3" runat="server">
        <ItemTemplate>

        <%#Eval("ozellikler") %>
        
        </ItemTemplate>
        </asp:Repeater>
    
    </div>
      
    
  </div>
</div>

<script type="text/javascript">
    var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>

     <asp:Button ID="btn_begen" runat="server" Text="FAVORİLERE EKLE" 
        onclick="btn_begen_Click" Width="158px"  OnClientClick="return confirm('İşlemi Onaylıyor musunuz?');" />

   
                   
</asp:Content>

