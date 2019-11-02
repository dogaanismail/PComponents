<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hakkimizda.aspx.cs" Inherits="hakkımızda" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PComponents</title>
<meta name="keywords" content="web store, contact page, form, free templates, website templates, CSS, HTML" />
<meta name="description" content="Web Store Theme, Contact Form, free CSS template provided by templatemo.com" />
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

    function clearText(field) {
        if (field.defaultValue == field.value) field.value = '';
        else if (field.value == '') field.value = field.defaultValue;
    }
</script>

</head>
<body id="subpage">
    <form id="form1" runat="server">
    <div>
    <div id="templatemo_wrapper">
	<div id="templatemo_header">
    	<div id="site_title"><h3><a href="#">PComponents </a></h3></div>
        
        <div id="header_right">
            
            <div class="cleaner">
            
                <asp:Repeater ID="Repeater1" runat="server">
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
            <asp:Button ID="btn_cikisyap" runat="server" Text="ÇIKIŞ YAP" 
                onclick="btn_cikisyap_Click" /><br />

           
                
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
            <li>
               <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" ForeColor="Red" Font-Italic="true"/>         
           </li>
            
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
                      <li><a href="kategoriurunler.aspx?urunmarkaid=<%#Eval("urun_markaid") %>      "> <%#Eval("kategoriismi")%></a></li>
                     </ItemTemplate>
                    </asp:Repeater>
                
       
          
           
             </ul>
            </li>
  
           
            </ItemTemplate>
         </asp:Repeater>
            
    
    	</ul>
    

    <br />

</div>
        
        <div id="content">
        	<h2>Hakkımızda</h2>
            <p> Merhaba, ben İsmail DOĞAN. Doğuş Üniversitesi-Bilgisayar Mühendisliği bölümünde okuyorum. Düzce Üniversitesi-Bilgisayar Programcılığı bölümünden mezun oldum. 20 yaşındayım. İstanbul-Tuzla'da yaşıyorum. Bu siteyi yapmaya 2013 yılında 11.sınıfta başladım. Bu proje benim için ilk başta sadece bir ödevden ibaretti. Ama sonra bu projeyi sürekli geliştirmek istedim kendi çapımda. Geliştirdikçe geliştirmek istedim. Çok fazla vakit bulamasamda elimden geleni yaptım ve yapacağım. Sitedeki ürünler ise asla gerçeği yansıtmamaktadır. </p>
			
            
        
        
        <div class="cleaner h30"></div>
        
            
        </div> <!-- END of content -->
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    
     <!-- END of footer -->  
      <div id="footer">
        <center>
			Copyright © 2013 | PComponents <a href="#" target="_parent"></a>
            <h4>Sitede ki ürünler gerçeği yansıtmamaktadır.</h4>

		</center>

       
    </div> 
   
</div>


    </div>

     <script type="text/javascript">
         var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", { imgRight: "SpryAssets/SpryMenuBarRightHover.gif" });
</script>


    </form>
</body>
</html>
