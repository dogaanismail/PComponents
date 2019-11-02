<%@ Page Language="C#" AutoEventWireup="true" CodeFile="odeme.aspx.cs" Inherits="odeme" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PComponents</title>

<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<script src="SpryAssetss/SpryMenuBar.js" type="text/javascript"></script>
<link href="SpryAssetss/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">




    /***********************************************
    * Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
    * This notice MUST stay intact for legal use
    * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
    ***********************************************/

</script>

<script type="text/javascript">

    ddsmoothmenu.init({
        mainmenuid: "templatemo_menu", //menu DIV id
        orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
        classname: 'ddsmoothmenu', //class added to menu's outer DIV
        //customtheme: ["#1c5a80", "#18374a"],
        contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
    })

</script>

<link rel="stylesheet" type="text/css" href="css/styles.css" />
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2.1-core.js"></script>
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2-more.js"></script>
<script language="javascript" type="text/javascript" src="scripts/slideitmoo-1.1.js"></script>
<script language="javascript" type="text/javascript">
	window.addEvents({
		'domready': function(){
			/* thumbnails example , div containers */
			new SlideItMoo({
						overallContainer: 'SlideItMoo_outer',
						elementScrolled: 'SlideItMoo_inner',
						thumbsContainer: 'SlideItMoo_items',		
						itemsVisible: 5,
						elemsSlide: 2,
						duration: 200,
						itemsSelector: '.SlideItMoo_element',
						itemWidth: 171,
						showControls:1});
		},
		
	});

	function clearText(field)
	{
		if (field.defaultValue == field.value) field.value = '';
		else if (field.value == '') field.value = field.defaultValue;
	}
</script>


        
    <style type="text/css">
        .style1
        {
            width: 5px;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 57px;
        }
        .style4
        {
            width: 57px;
            color: #CC3300;
            text-decoration: underline;
        }
    </style>


        
</head>
<body id="subpage">
    <form id="form1" runat="server">
    <div>

    <div id="templatemo_wrapper">
	<div id="templatemo_header">
    	<div id="site_title"><h3><a href="#">PComponents </a></h3></div>
        
        <div id="header_right">
            
            <div class="cleaner">
                <asp:Repeater ID="Repeater2" runat="server">
                <HeaderTemplate></HeaderTemplate>

                <ItemTemplate>
                <table>

               <tr>

            

               <td>
                 <a href="uye.aspx?kullaniciID=<%#Eval("kullanici_id") %>">           <%#Eval("kullaniciadi") %></a>
               </td>

               </tr>

               </table>
                
                </ItemTemplate>

                <FooterTemplate></FooterTemplate>
                </asp:Repeater>
            
            </div>
            <asp:Button ID="btn_cikisyap" runat="server" Text="ÇIKIŞ YAP" onclick="btn_cikisyap_Click" 
               /><br />

           
                
                <asp:TextBox ID="txtara" runat="server"></asp:TextBox>
                <asp:Button ID="btn_ara" runat="server" Text="ARA" onclick="btn_ara_Click" />
              
           
         </div> <!-- END -->
    </div> <!-- END of header -->
    
    <div id="templatemo_menu" class="ddsmoothmenu">
         <ul>
            <li><a href="anasayfa.aspx" >Anasayfa</a></li>
            
            <li><a href="uyegirisi.aspx">Giriş Yap</a></li>
            <li><a href="yeniuye.aspx">Üye Ol</a></li>
            <li><a href="hakkimizda.aspx">Hakkımızda</a></li>
            <li><a href="uyegirisi.aspx">Bana Özel</a></li>
        </ul>
        <br style="clear: left" />
    </div> <!-- end of templatemo_menu -->
    
    <div class="cleaner h20"></div>
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	
        <div id="sidebar">
        	<h3>Adres Bilgileri</h3>
            <p>Lüten Adres bilgilerinizi kontrol edin. Size göndereceğimiz ürün aşağıdaki adrese gönderelecektir.   </p>
            <ul class="sidebar_menu">
                <table class="style2">
                    <tr>
                        <td class="style3">
                            Adı</td>
                        <td>
                            <asp:TextBox ID="txtad" runat="server" Width="87px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Soyadi</td>
                        <td>
                            <asp:TextBox ID="txtsoyad" runat="server" Width="87px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Kullanici Adi</td>
                        <td>
                            <asp:TextBox ID="txt_kadi" runat="server" Width="87px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Sifre</td>
                        <td>
                            <asp:TextBox ID="txtsifre" runat="server" Width="87px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            E-Mail</td>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server" Width="87px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Doğum T.</td>
                        <td>
                            <asp:TextBox ID="txtdogumtarihi" runat="server" Width="87px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Doğum Y.</td>
                        <td>
                            <asp:TextBox ID="txtdogumyeri" runat="server" Width="87px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <strong>Adres</strong></td>
                        <td>
                            <asp:TextBox ID="txtadres" runat="server" Width="87px" TextMode="MultiLine" 
                                ForeColor="#CC3300"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Cep Tel.</td>
                        <td>
                            <asp:TextBox ID="txtceptelefonu" runat="server" Width="87px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Sehir</td>
                        <td>
                            <asp:TextBox ID="txtsehir" runat="server" Width="87px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Button ID="btn_guncel" runat="server" Height="23px" 
                                 Text="güncelle" Width="60px" onclick="btn_guncel_Click" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    </table>
               
               </ul>
 
                  
               
              
            <div id="newsletter">
                
                <div class="cleaner">
                    <asp:Label ID="Label2" runat="server" ForeColor="#CC3300"></asp:Label>
                    </div>
            </div>
        </div> <!-- END of sidebar -->
       
        <div id="content">
        Ödeme Sepetiniz :
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate></HeaderTemplate>

            <ItemTemplate>
               <table  cellspacing="0" cellpadding="5">
                   	  <tr bgcolor="#CCCCCC">
                        	
                        	<th width="180" align="left">Ürün İsmi </th> 
                       	  	<th width="100" align="center">Ürün Adeti</th> 
                        	<th width="60" align="right">Ürün Fiyatı </th> 
                        	<th width="60" align="right">Toplam Fiyat</th> 
                        
                            
                      </tr>
                    	<tr>
                        

                        	<td><%#Eval("urunismi") %></td> 
                            <td align="center"><%#Eval("urun_adet") %> </td>
                            <td align="right">$<%#Eval("fiyat") %></td> 
                            <td align="right">$<%#Eval("toplamfiyat")%></td>
                           
						</tr>
                        
                     
					</table>
            </ItemTemplate>

            <FooterTemplate></FooterTemplate>
            </asp:Repeater><br />&nbsp; <br />


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

            
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 


           
           
            
               
               <table>
               <tr>
               <td>
                  <strong> Lütfen Kart Numarası Giriniz</strong>
               </td>
               </tr>
               </table>
                
           
                 <table>
              
           
            <tr>

            <td class="style1" >
                <asp:TextBox ID="TextBox1" runat="server" Height="20" Width="30" MaxLength="4"></asp:TextBox>
            </td>

             <td >
                <asp:TextBox ID="TextBox2" runat="server" Height="20" Width="30"></asp:TextBox>
            </td>
             <td >
                <asp:TextBox ID="TextBox3" runat="server" Height="20" Width="30"></asp:TextBox>
            </td>

             <td >
                <asp:TextBox ID="TextBox4" runat="server" Height="20" Width="30"></asp:TextBox>
            </td>

       


       

            </tr>


            </table>
            <br />

            <table>
            
            <tr>

            <td>
            CVC2 Numarası
            </td>

            <td></td>

            <td>
                <asp:TextBox ID="TextBox5" runat="server" MaxLength="4" Height="17px"  
                    Width="45px"></asp:TextBox>
            </td>

            </tr>
            </table><br />
            <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" Height="52px" 
                Width="600px"></asp:TextBox><br /><br />

            <asp:CheckBox ID="CheckBox1" runat="server" Text="Satış Sözleşmesini Kabul Ediyorum" />
            <br /><br />
            <asp:Button ID="btn_ode" runat="server" Text="KREDİ KARTI İLE ÖDE" 
                onclick="btn_ode_Click" /> <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>





        
                    &nbsp;&nbsp;





        
                    </div>
            
	
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    	</div>
    
        
        <div class="cleaner h40"></div>
		 <center>
			Copyright © 2013 | PComponents <a href="#" target="_parent"></a>
            <h4>Sitede ki ürünler gerçeği yansıtmamaktadır.</h4>

		</center>
    </div> <!-- END of footer -->   
   
</div>

        
    </div>


    <script type="text/javascript">
        var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", { imgRight: "SpryAssets/SpryMenuBarRightHover.gif" });
</script>

    </form>
</body>
</html>
