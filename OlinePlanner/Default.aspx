<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="Stylesheet" href="Styles/Site.css" />
    <link rel="Stylesheet" href="Styles/grid.css" />
    <title>Moj rokovnik</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header" style="margin-bottom: 20px;">
        <div class="row">
            <div class="header-title" style="padding-bottom: 35px;"><h1>Moj rokovnik</h1></div>
        </div>
     </div>

    <div class="wrapper column-12 centar">

        <div class="column-6 login" align="right">
        <asp:Login ID="Login1" runat="server" Height="161px" Width="326px"         
        FailureText="Vaš pokušaj prijave nije bio uspješan. Molimo pokušajte ponovo." 
        DestinationPageUrl="~/Planner.aspx" onauthenticate="Login1_Authenticate" 
                BorderWidth="2px" BorderColor="#2B0604" BorderStyle="Solid">
        <LayoutTemplate>
            <table cellpadding="8" cellspacing="15" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:161px;width:326px;">
                            <tr>
                                <td align="center" colspan="2">
                                    Prijava</td>
                            </tr>
                            <tr>
                                <td align="right">Korisničko ime:
                                    &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="Obaveno je korisničko ime." 
                                        ToolTip="Obaveno je korisničko ime." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Lozinka:&nbsp;</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Obavezna je lozinka." 
                                        ToolTip="Obavezna je lozinka." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
               
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Prijava" 
                                        ValidationGroup="Login1" Width="90px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
        </div>

    <div class="column-6 registration">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        CompleteSuccessText="Vaš račun je uspješno kreiran." 
        ContinueButtonText="Nastavi" CreateUserButtonText="Registriraj se" 
        DuplicateEmailErrorMessage="E-mail adresa koju ste unijeli je već u upotrebi. Unesite novu adresu." 
        DuplicateUserNameErrorMessage="Korisničko ime je zauzeto, unesite novo." InvalidAnswerErrorMessage="" 
        InvalidEmailErrorMessage="Unesite ispravnu e-mail adresu." 
        InvalidPasswordErrorMessage="Minimalna duljina lozinke: {0}." 
        UnknownErrorMessage="Vaš račn nije uspješno kreiran. Molimo pokušajte ponovo." 
        oncreateduser="CreateUserWizard1_CreatedUser" CancelButtonText="Odustani" 
        CancelDestinationPageUrl="~/Default.aspx" 
        ContinueDestinationPageUrl="~/Planner.aspx" DisplayCancelButton="True" 
        InvalidQuestionErrorMessage="" BorderWidth="2px" CellPadding="8" 
            CellSpacing="15" BorderColor="#2B0604" BorderStyle="Dotted">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="2">
                                Registriraj se</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblUsername" runat="server" AssociatedControlID="UserName">Korisničko ime:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="Korisničko ime je obavezno." 
                                    ToolTip="Korisničko ime je obavezno." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="Password">Lozinka:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Lozinka je obavezna." 
                                    ToolTip="Lozinka je obavezna." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblConfirmPass" runat="server" 
                                    AssociatedControlID="ConfirmPassword">Potvrdi lozinku:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Potrebna je potvrda lozinke." 
                                    ToolTip="Potrebna je potvrda lozinke." 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">                                
                                <asp:Label ID="lblName" runat="server" AssociatedControlID="txtBoxName">Ime:</asp:Label>                                
                            </td>
                            <td>
                                <asp:TextBox ID="txtBoxName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" 
                                    ControlToValidate="txtBoxName" 
                                    ErrorMessage="*" 
                                    ToolTip="Ime je obavezno." 
                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblSurname" runat="server">Prezime:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBoxSurname" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSurname" runat="server" 
                                    ControlToValidate="txtBoxSurname" 
                                    ErrorMessage="*" 
                                    ToolTip="Prezime je obavezno." 
                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                    ToolTip="E-mail adresa je obavezna." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>


                        
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblBirthDate" runat="server">Datum rođenja:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBoxBirthDate" runat="server" ToolTip="Primjer: 12.1.2014."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" 
                                    ControlToValidate="txtBoxBirthDate" 
                                    ErrorMessage="*" 
                                    ToolTip="Datum je obavezan." 
                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                        
                        
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblPlace" runat="server">Mjesto:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBoxPlace" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPlace" runat="server" 
                                    ControlToValidate="txtBoxPlace" 
                                    ErrorMessage="*" 
                                    ToolTip="Mjesto je obavezno." 
                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblZipCode" runat="server">Poštanski broj:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBoxZipCode" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorZipCode" runat="server" 
                                    ControlToValidate="txtBoxZipCode" 
                                    ErrorMessage="*" 
                                    ToolTip="Poštanski broj je obavezan." 
                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="lblGedner" runat="server">Spol</asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="radioBttnListGender" runat="server">
                                    <asp:ListItem Selected="True" Value="Muško">Muško</asp:ListItem>
                                    <asp:ListItem>Žensko</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>

                       <tr>
                            <td align="center">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" ErrorMessage="Lozinke moraju biti iste" 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorZipCode" 
                                    runat="server" ErrorMessage="Neispravni poštanski broj" 
                                    ControlToValidate="txtBoxZipCode" ValidationExpression="^[0-9]{5}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorDate" 
                                    runat="server" ErrorMessage="Neispravan datum!" 
                                    ValidationExpression="^([0]?[1-9]|[1|2][0-9]|[3][0|1])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4}|[0-9]{2})[./-]$" 
                                    ControlToValidate="txtBoxBirthDate"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" 
                                    runat="server" ErrorMessage="Neispravna e-mail adresa!" 
                                    ControlToValidate="Email" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
    </div>

    <div class="footer">
        <h4 align="center">Copyright &copy; 2014 Matea Antolić</h4>
    </div>
    </form>
</body>
</html>
