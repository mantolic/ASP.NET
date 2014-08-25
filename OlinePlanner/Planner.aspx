<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Planner.aspx.cs" Inherits="Planner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="Styles/Site.css" />
    <link rel="Stylesheet" href="Styles/grid.css" />
    <style type="text/css">
        .style2
        {
            width: 61px;
        }
    </style>

    <script type="text/javascript">
        function addEvent() {
            alert("Uspješno ste spremili novi događaj!");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="column-12 centar">
    <asp:ScriptManager ID="ScriptManagerDate" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelDate" runat="server">
        <ContentTemplate>
        <div class="up">
                <div class="column-6 one">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:connectionToDatabase %>" 
            
                        SelectCommand="SELECT notes AS 'Današnje obaveze' FROM plans WHERE (planDate = { fn CURDATE() }) AND (usernameID=@username)">
                        <SelectParameters>
                            <asp:Parameter Name="username" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" 
                        CellPadding="15" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
                        Width="100%" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" 
                        ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Današnje obaveze" HeaderText="Današnje obaveze" 
                                SortExpression="Današnje obaveze" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#F3B18C" Font-Bold="True" ForeColor="Black" />
                        <PagerStyle BackColor="#F3B18C" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>


                <div class="column-6 two">
                    <asp:Calendar ID="CalendarSlecetDate" runat="server" 
                        onselectionchanged="CalendarSlecetDate_SelectionChanged" BackColor="White" 
                        BorderColor="Black" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                        ForeColor="Black" NextPrevFormat="FullMonth" Width="100%" CellPadding="10" 
                          BorderStyle="None" Height="355px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#993333" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                            Font-Bold="True" Font-Size="12pt" ForeColor="#993333" />
                        <TodayDayStyle BackColor="#F3B18C" />
                    </asp:Calendar>                
                 </div>

        </div>
        
        <div class="down">

                  <div class="column-6 three">
                    <div class="four-grid">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:connectionToDatabase %>" 
                
                        SelectCommand="SELECT id, [notes] FROM [plans] WHERE ([planDate] = @planDate) AND (usernameID=@username)" 
                        UpdateCommand="UPDATE plans SET notes=@notes WHERE ID=@ID" 
                        DeleteCommand="DELETE FROM plans WHERE ID=@id" 
                        
                        InsertCommand="INSERT INTO plans(usernameID, planDate, notes) VALUES (@username, @date, @note)" 
                        onupdated="SqlDataSource1_Updated">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="id" 
                                PropertyName="SelectedValue" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="username" Type="String" />
                            <asp:ControlParameter ControlID="CalendarSlecetDate" Name="date" 
                                PropertyName="SelectedDate" />
                            <asp:ControlParameter ControlID="txtBoxNotes" Name="note" PropertyName="Text" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CalendarSlecetDate" DbType="Date" 
                                Name="planDate" PropertyName="SelectedDate" />
                            <asp:Parameter Name="username" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="notes" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="GridView1" Name="ID" 
                                PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1" DataKeyNames="id" 
                        onrowdatabound="GridView1_RowDataBound" CellPadding="15" 
                        ForeColor="#333333" GridLines="None" Width="100%" PageSize="5" 
                        EnablePersistedSelection="True" ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField SelectText="" ShowSelectButton="True" />
                            <asp:CommandField EditText="" ShowEditButton="True" 
                                CancelImageUrl="~/Images/cancel.png" UpdateImageUrl="~/Images/update.png" 
                                CancelText="Odustani" UpdateText="Spremi" />
                            <asp:BoundField DataField="id" SortExpression="id" HeaderText="id" 
                                InsertVisible="False" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="notes" HeaderText="Doagađaji za odabrani datum" 
                                SortExpression="id" ShowHeader="False">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#F3B18C" Font-Bold="True" ForeColor="Black" />
                        <PagerStyle BackColor="#F3B18C" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    </div>
                    <div class="gumbi">
                        <asp:Button ID="bttnUpdate" runat="server" onclick="bttnUpdate_Click" 
                            Text="Uredi" Height="30px" Width="90px" />
                        <asp:Button ID="bttnDelete" runat="server" onclick="bttnDelete_Click" 
                            Text="Obriši" Height="30px" Width="90px" />
                     </div>
                  </div>
  
                <div class="column-6 four">
                  <table style="padding: 10px; width:100%; text-align: right;" cellpadding="5">
                        <tr>
                            <td align="left" style="font-weight: bold;" colspan="2">
                                <asp:Label ID="lblDate" runat="server">Datum:</asp:Label>
                                &nbsp;
                                <asp:TextBox ID="txtBoxSelectedDate" runat="server" AutoPostBack="True" 
                                    ontextchanged="txtBoxSelectedDate_TextChanged" Height="30px" Width="100px"></asp:TextBox>
                            </td>
                            <td style="font-weight:bold" align="left">
                                <asp:Label ID="lblNotes" runat="server">Novi događaj:</asp:Label>
                            </td>
                        </tr>                        
                        <tr>                          
                            <td colspan="3" align="left">
                                <asp:TextBox ID="txtBoxNotes" runat="server" Height="200px" Width="100%" 
                                    TextMode="MultiLine" style="resize: none;"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="bttnAdd" runat="server" onclick="bttnAdd_Click" Text="Dodaj" 
                                    Height="30px" Width="90px" /> 
                            </td>   
                        </tr>
                    </table>
                </div>
         </div>
        </ContentTemplate>
    </asp:UpdatePanel>  
    </div>
</asp:Content>

