<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sifredegistir.aspx.cs" Inherits="sifredegistir" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head id="Head1" runat="server">
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
             width: 145px;
         }
         .style4
         {
             width: 145px;
             text-align: center;
             font-size: large;
         }
         .style5
         {
             text-align: left;
         }
         .style6
         {
             width: 145px;
             font-size: large;
         }
         .style7
         {
             font-size: large;
         }
     </style>

</head>
<body id="subpage">
    <form id="form1" runat="server">
    <div>
    <div id="templatemo_wrapper">
	<div id="templatemo_header">
    	<div id="site_title"><h3><a href="#">PComponents</a></h3></div>
        
        <div id="header_right">
           
            <div class="cleaner">
               
            </div>
           
                
               

                
            
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
        	<h3></h3>

            <ul class="sidebar_menu">
                

               
               <br /><br /><br /><br />
               
               
                
       
          
           
             </ul>
            </li>
  
           
            </ItemTemplate>
         </asp:Repeater>
            
    
    	</ul>
    

    
    </div>




           
         <!-- END of sidebar -->
      <h2>ŞİFRE DEĞİŞ</h2>
        <div id="content">
        


             
                <table class="style1">
            <tr>
                <td class="style2">
                    Yeni Şifre:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Yeni Şifre Tekrar:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="Button1" runat="server" Text="İleri" onclick="Button1_Click" />
                </td>
                <td>
                    <asp:Label ID="lbl_durum" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                 <a href="anasayfa.aspx"> Anasayfaya Dön</a></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                   <a href="uyegirisi.aspx"> Yeni Şifreyle Giriş Yap</a></td>
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


