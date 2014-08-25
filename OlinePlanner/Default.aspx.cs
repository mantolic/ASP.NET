using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string userName = CreateUserWizard1.UserName;
        string pass = CreateUserWizard1.Password.GetHashCode().ToString();
        string cofirmPass = CreateUserWizard1.ConfirmPassword;
        string firstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtBoxName")).Text;
        string lastName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtBoxSurname")).Text;
        string email = CreateUserWizard1.Email;
        DateTime birthDate = new DateTime();
        DateTime.TryParse(((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtBoxBirthDate")).Text, out birthDate);        
        string place = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtBoxPlace")).Text;
        int zipCode;
        int.TryParse(((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtBoxZipCode")).Text, out zipCode);
        string gender = ((RadioButtonList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("radioBttnListGender")).SelectedItem.Value;

        string databaseConString = ConfigurationManager.ConnectionStrings["connectionToDatabase"].ConnectionString;
        SqlConnection con = new SqlConnection(databaseConString);

        SqlCommand query = new SqlCommand("INSERT INTO users VALUES(@user, @pass, @name, @surname, @mail, @date, @place, @zipCode, @gender)", con);
        query.Parameters.AddWithValue("@user", userName);
        query.Parameters.AddWithValue("@pass", pass);
        query.Parameters.AddWithValue("@name", firstName);
        query.Parameters.AddWithValue("@surname", lastName);
        query.Parameters.AddWithValue("@mail", email);
        query.Parameters.AddWithValue("@date", birthDate);
        query.Parameters.AddWithValue("@place", place);
        query.Parameters.AddWithValue("@zipCode", zipCode);
        query.Parameters.AddWithValue("@gender", gender);

        con.Open();
        int x = query.ExecuteNonQuery();
        con.Close();
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string username = Login1.UserName.ToString();
        string pass = Login1.Password.ToString().GetHashCode().ToString();
        
        string conString = ConfigurationManager.ConnectionStrings["connectionToDatabase"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        SqlCommand query = new SqlCommand("SELECT username, password FROM users WHERE username=@user AND password=@pass", con);
        query.Parameters.AddWithValue("@user", username);
        query.Parameters.AddWithValue("@pass", pass);
        SqlDataReader read = query.ExecuteReader();
        if (read.Read() == true)
            e.Authenticated = true;
        else
            e.Authenticated = false;
        con.Close();
    }
}