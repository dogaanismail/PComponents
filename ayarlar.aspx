<%@ Page Title="" Language="C#" MasterPageFile="~/kategoriurunler.master" AutoEventWireup="true" CodeFile="ayarlar.aspx.cs" Inherits="ayarlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h4>BİLGİLERİM / AYARLARIM </h4> <br />
                    <table>
                    <tr>
                        <td class="style3">
                            Adı</td>
                        <td>
                            <asp:TextBox ID="txtad" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Soyadi</td>
                        <td>
                            <asp:TextBox ID="txtsoyad" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Kullanici Adi</td>
                        <td>
                            <asp:TextBox ID="txt_kadi" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Sifre</td>
                        <td>
                            <asp:TextBox ID="txtsifre" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            E-Mail</td>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Doğum T.</td>
                        <td>
                            <asp:TextBox ID="txtdogumtarihi" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Doğum Y.</td>
                        <td>
                            <asp:TextBox ID="txtdogumyeri" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <strong>Adres</strong></td>
                        <td>
                            <asp:TextBox ID="txtadres" runat="server" TextMode="MultiLine" 
                                ForeColor="#CC3300"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Cep Tel.</td>
                        <td>
                            <asp:TextBox ID="txtceptelefonu" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            Sehir</td>
                        <td>
                            <asp:TextBox ID="txtsehir" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td >
                         <asp:Button ID="Button2" runat="server" Text="GÜNCELLE" onclick="Button2_Click"  OnClientClick="return confirm('İşlemi Onaylıyor musunuz?');" />
                        </td>
                       
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="ÇIKIŞ YAP" 
                                onclick="Button1_Click" />
                         </td>
                    </tr>
                    </table>
</asp:Content>

