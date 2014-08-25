<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="Styles/Site.css" />
    <link rel="Stylesheet" href="Styles/grid.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="column-8 plate">

    <div class="column-8 plate-tab">
        <asp:Button ID="bttnFuture" runat="server" onclick="bttnFuture_Click" 
            Text="Budući događaji" Height="30px" Width="150px" BackColor="#FCE4BE" 
            BorderWidth="0px" />
        <asp:Button ID="bttnPast" runat="server" onclick="bttnPast_Click" 
            Text="Prošli događaji" Height="30px" Width="150px" BackColor="#FCE4BE" 
            BorderWidth="0px" />
    </div>

    <div class="tab">
        <asp:MultiView ID="MultiView1" runat="server">


            <asp:View ID="ViewFuture" runat="server" onactivate="ViewFuture_Activate">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:connectionToDatabase %>" 
                
                
                    
                    SelectCommand="SELECT ID, planDate, notes FROM plans WHERE (planDate &gt;= { fn CURDATE() }) AND (usernameID = @username) ORDER BY planDate" 
                    DeleteCommand="DELETE FROM plans WHERE (ID = @ID)" 
                    UpdateCommand="UPDATE plans SET notes=@notes WHERE ID=@ID">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="ID" 
                            PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:Parameter Name="username" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="notes" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="ID" 
                            PropertyName="SelectedDataKey" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="10" 
                    ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
                    DataKeyNames="ID" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="ID" 
                            HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" 
                            Visible="False" />
                        <asp:BoundField DataField="planDate" HeaderText="Datum" 
                            SortExpression="planDate" DataFormatString="{0:d.M.yyyy.}" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="planDate" DataFormatString="{0:dddd}" 
                            HeaderText="Dan" ReadOnly="True" SortExpression="planDate" />
                        <asp:BoundField DataField="notes" HeaderText="Događaj" SortExpression="notes" />
                        <asp:CommandField ShowEditButton="True" ButtonType="Image" 
                            CancelImageUrl="~/Images/cancel.png" EditImageUrl="~/Images/edit.png" 
                            UpdateImageUrl="~/Images/update.png" />
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Image" 
                            DeleteImageUrl="~/Images/delete.png" DeleteText="Obriši" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#F3B18C" Font-Bold="True" ForeColor="Black" />
                    <HeaderStyle BackColor="#F3B18C" Font-Bold="True" ForeColor="Black" />
                    <PagerStyle BackColor="#F3B18C" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </asp:View>

            <asp:View ID="ViewPast" runat="server" onactivate="ViewPast_Activate">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:connectionToDatabase %>" 
                
                
                    SelectCommand="SELECT planDate, notes FROM plans WHERE (planDate &lt; { fn CURDATE() }) AND (usernameID = @username) ORDER BY planDate DESC">
                    <SelectParameters>
                        <asp:Parameter Name="username" Type="String"/>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="10" 
                    ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="planDate" DataFormatString="{0:d.M.yyyy.}" 
                            HeaderText="Datum" SortExpression="planDate" />
                        <asp:BoundField DataField="planDate" DataFormatString="{0:dddd}" 
                            HeaderText="Dan" ReadOnly="True" />
                        <asp:BoundField DataField="notes" HeaderText="Bilješke" 
                            SortExpression="notes" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#F3B18C" Font-Bold="True" ForeColor="Black" />
                    <PagerStyle BackColor="#F3B18C" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderWidth="0px" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </asp:View>

        </asp:MultiView>
    </div>
</div>

</asp:Content>

