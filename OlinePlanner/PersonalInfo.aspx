<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PersonalInfo.aspx.cs" Inherits="PersonalInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="Styles/Site.css" />
    <link rel="Stylesheet" href="Styles/grid.css" />
    <style type="text/css">
        .style1
        {
            width: 109px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="column-8 plate">
    <div class="column-8 plate-tab">
        <asp:Button ID="bttnInfo" runat="server" onclick="bttnInfo_Click" 
            Text="Pregled podataka" Height="30px" Width="150px" BorderWidth="0px" />
        <asp:Button ID="bttnChangePass" runat="server" onclick="bttnChangePass_Click" 
            Text="Promjena lozinke" Height="30px" Width="150px" BorderWidth="0px" />
    </div>

    <div class="tab">

        <asp:MultiView ID="MultiView1" runat="server">

            <asp:View ID="ViewInfo" runat="server" onactivate="ViewInfo_Activate">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:connectionToDatabase %>" 
                    SelectCommand="SELECT [username], [firstName], [lastName], [email], [birthDate], [zipCode], [place], [gedner] FROM [users] WHERE (username = @username)">
                    <SelectParameters>
                        <asp:Parameter Name="username" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="username" DataSourceID="SqlDataSource1" Height="50px" 
                    Width="350px" CellPadding="8" ForeColor="#333333" GridLines="None" 
                    HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#FEFDF5" Font-Bold="True" Width="50%" />
                    <Fields>
                        <asp:BoundField DataField="username" HeaderText="Korinsičko ime:" 
                            ReadOnly="True" SortExpression="username" />
                        <asp:BoundField DataField="firstName" HeaderText="Ime:" 
                            SortExpression="firstName" />
                        <asp:BoundField DataField="lastName" HeaderText="Prezime:" 
                            SortExpression="lastName" />
                        <asp:BoundField DataField="email" HeaderText="E-mail:" SortExpression="email" />
                        <asp:BoundField DataField="birthDate" DataFormatString="{0:d.M.yyyy}" 
                            HeaderText="Datum rođenja:" SortExpression="birthDate" />
                        <asp:BoundField DataField="zipCode" HeaderText="Poštanski broj:" 
                            SortExpression="zipCode" />
                        <asp:BoundField DataField="place" HeaderText="Mjesto" SortExpression="place" />
                        <asp:BoundField DataField="gedner" HeaderText="Spol:" SortExpression="gedner" />
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
            </asp:View>


            <asp:View ID="ViewChangePass" runat="server" 
                onactivate="ViewChangePass_Activate">
            <div class="tab" align="center">
                <table cellpadding="5">
                    <tr>
                        <td class="style1" align="right">
                            <asp:Label ID="lblOldPass" runat="server" Text="Stara lozinka:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBoxOldPass" runat="server" Width="150px" 
                                TextMode="Password" Height="25px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" align="right">
                            <asp:Label ID="lblNewPass" runat="server" Text="Nova lozinka:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBoxNewPass" runat="server" Width="150px" 
                                TextMode="Password" Height="25px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" align="right">
                            <asp:Label ID="lblConfirmChPass" runat="server" Text="Potvrdi lozinku:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBoxConfirmChPass" runat="server" Width="150px" 
                                TextMode="Password" Height="25px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="color:Red;">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtBoxNewPass" ControlToValidate="txtBoxConfirmChPass" 
                                ErrorMessage="Potvrdna lozinka mora biti ista kao nova"></asp:CompareValidator>                   
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="color:Red;">
                          <asp:Literal ID="Literal1" runat="server" Text="Pogrešna stara lozinka!" 
                                Visible="False"></asp:Literal>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPass" 
                                runat="server" ControlToValidate="txtBoxNewPass" Display="Dynamic" 
                                ErrorMessage="Lozinka mora imati od 6 do 15 znakova " 
                                ValidationExpression="^.{6,15}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>                        
                        <td colspan="2" style="color:Red;">
        
                            <asp:Literal ID="Literal2" runat="server" Text="Lozinka ne može biti 0." 
                                Visible="False"></asp:Literal>
        
                        </td>
                    </tr>
                    <tr>                        
                        <td  colspan="2"  align="right">
                             <asp:Button ID="SaveChPass" runat="server" onclick="SaveChPass_Click" 
                                 Text="Spremi" Height="30px" Width="90px" />
                        </td>
                   </tr>
                </table>
            </div>
            </asp:View>
        </asp:MultiView>

    </div>
</div>

</asp:Content>

