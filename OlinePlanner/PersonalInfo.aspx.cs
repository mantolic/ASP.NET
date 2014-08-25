using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class PersonalInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
        {
            Response.Redirect("~/Default.aspx");
        }      
        MultiView1.ActiveViewIndex = 0;
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters["username"].DefaultValue = User.Identity.Name;
    }

    protected void bttnInfo_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    protected void bttnChangePass_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void SaveChPass_Click(object sender, EventArgs e)
    {
        string oldPass = txtBoxOldPass.Text.GetHashCode().ToString();
        string newPass = txtBoxNewPass.Text.GetHashCode().ToString();
        string user = User.Identity.Name;

        if (txtBoxNewPass.Text == string.Empty)
        {
            Literal2.Visible = true;
            MultiView1.ActiveViewIndex = 1;
        }
        else
            {
                Literal2.Visible = false;

                string databaseConString = ConfigurationManager.ConnectionStrings["connectionToDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(databaseConString);

                SqlCommand query = new SqlCommand("SELECT password FROM users WHERE (username=@user)", con);
                query.Parameters.AddWithValue("@user", user);
                query.Parameters.AddWithValue("@oldpass", oldPass);

                con.Open();
                SqlDataReader read = query.ExecuteReader();
                read.Read();
                string password = read.GetString(0);
                con.Close();

                if (password == oldPass)
                {
                    SqlCommand query1 = new SqlCommand("UPDATE users SET password=@pass WHERE (username=@user)", con);
                    query1.Parameters.AddWithValue("@pass", newPass);
                    query1.Parameters.AddWithValue("@user", user);

                    con.Open();
                    query1.ExecuteNonQuery();
                    con.Close();

                    Literal1.Visible = false;
                    MultiView1.ActiveViewIndex = 0;
                }
                else
                {
                    Literal1.Visible = true;
                    MultiView1.ActiveViewIndex = 1;
                }
        }
    }

    protected void ViewInfo_Activate(object sender, EventArgs e)
    {
        bttnInfo.BackColor = System.Drawing.Color.FromArgb(255, 244, 220);
        bttnChangePass.BackColor = System.Drawing.Color.FromArgb(252, 228, 190);
    }

    protected void ViewChangePass_Activate(object sender, EventArgs e)
    {
        bttnInfo.BackColor = System.Drawing.Color.FromArgb(252, 228, 190);
        bttnChangePass.BackColor = System.Drawing.Color.FromArgb(255, 244, 220);
    }

}