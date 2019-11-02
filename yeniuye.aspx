<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yeniuye.aspx.cs" Inherits="yeni_uye" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PComponents</title>
<meta name="keywords" content="web store, free templates, website templates, CSS, HTML" />
<meta name="description" content="Web Store Theme - free CSS template provided by templatemo.com" />
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
            width: 100%;
        }
        .style2
        {
            text-align: center;
            width: 136px;
        }
        .style3
        {
            height: 60px
        }
        .style4
        {
            height: 60px;
            width: 136px;
        }
        .style5
        {
            width: 136px
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
               <%#Eval("kullaniciadi") %> 
               </td>

               </tr>

               </table>
                </ItemTemplate>

                <FooterTemplate></FooterTemplate>
                </asp:Repeater>
            </div>
           
                
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
        	<h3>Kategoriler</h3>

            <ul class="sidebar_menu">
                

               

               


                <ul id="MenuBar1" class="MenuBarVertical"> 
                <asp:Repeater ID="rptAnaKategori" runat="server" OnItemDataBound="rptAnaKategori_ItemDataBound">
             
                <ItemTemplate>
                <li><a class="MenuBarItemSubmenu" href="kategoriurunler.aspx?kategoriid=<%#Eval("kategori_id") %>"> <%#Eval("kategoriismi") %> </a>
                
                <ul>
                    <asp:Repeater ID="RpAltKategori" runat="server">
                    <ItemTemplate> 
                      <li><a href="kategoriurunler.aspx?urunmarkaid=<%#Eval("urun_markaid") %>  "> <%#Eval("kategoriismi")%></a></li>
                     </ItemTemplate>
                    </asp:Repeater>
                
       
          
           
             </ul>
            </li>
  
           
            </ItemTemplate>
         </asp:Repeater>
            
    
    	</ul>
    

    
    </div>




           
         <!-- END of sidebar -->
      <h2>ÜYE OL</h2>
        <div id="content">
        


             
                <table class="style1">
                    <tr>
                        <td class="style2">
                            Adı</td>
                        <td>
                            <asp:TextBox ID="txt_ad" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txt_ad" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Soyadı</td>
                        <td>
                            <asp:TextBox ID="txt_soyadı" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txt_soyadı" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Kullanıcı Adı</td>
                        <td>
                            <asp:TextBox ID="txt_kadi" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txt_kadi" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Sifre</td>
                        <td>
                            <asp:TextBox ID="txt_sifre" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txt_sifre" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            E-Mail</td>
                        <td>
                            
                            <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                            
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txt_email" ErrorMessage="Geçersiz E-Mail Adresi" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txt_email" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Doğum Tarihi</td>
                        <td>
                            <asp:TextBox ID="txt_dtarihi" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txt_dtarihi" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Doğum Yeri</td>
                        <td>
                            <asp:TextBox ID="txt_dyeri" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txt_dyeri" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Şehir</td>
                        <td>
                            <asp:TextBox ID="txt_sehir" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="txt_sehir" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Adres</td>
                        <td>
                            <asp:TextBox ID="txt_adres" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txt_adres" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Cep Telefon Numara</td>
                        <td>
                            <asp:TextBox ID="txt_cepno" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ControlToValidate="txt_cepno" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Güvenlik Sorusu</td>
                        <td>
                            <asp:TextBox ID="txt_gvsoru" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txt_gvsoru" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            Cevap</td>
                        <td>
                            <asp:TextBox ID="txtcevap" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                ControlToValidate="txtcevap" ErrorMessage="Boş Geçilemez"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="~/Redcap.aspx" 
                                Width="150px" />
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:Button ID="Button1" runat="server" Text="YENİLE" />
                        </td>
                        <td>
                            <asp:Button ID="btn_uyeol" runat="server" onclick="btn_uyeol_Click" 
                                Text="ÜYE OL" />
                        </td>
                    </tr>
                </table>
        


             
                </div>     
  
          
  
  
   <!-- END of content -->
   
        <div class="cleaner"></div> 
        </div>
         <!-- END of main -->
      </div>
 
    
        <div class="cleaner h40"></div>
		 <center>
			Copyright © 2013 | PComponents <a href="#" target="_parent"></a>
            <h4>Sitede ki ürünler gerçeği yansıtmamaktadır.</h4>

		</center>
    </div> <!-- END of footer -->   
   

       
    <script type="text/javascript">
        var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", { imgRight: "SpryAssets/SpryMenuBarRightHover.gif" });
</script>
    </form>
</body>
</html>
