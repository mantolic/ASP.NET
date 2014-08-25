using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Planner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {        
        this.CalendarSlecetDate.SelectedDate = DateTime.Now.Date;
        this.txtBoxSelectedDate.Text = this.CalendarSlecetDate.SelectedDate.ToShortDateString();
        SqlDataSource1.SelectParameters["username"].DefaultValue = User.Identity.Name;
        SqlDataSource2.SelectParameters["username"].DefaultValue = User.Identity.Name;
    }

    protected void CalendarSlecetDate_SelectionChanged(object sender, EventArgs e)
    {
        this.txtBoxSelectedDate.Text = this.CalendarSlecetDate.SelectedDate.ToShortDateString();
        if (this.CalendarSlecetDate.SelectedDate < DateTime.Today)
            this.bttnAdd.Enabled = false;
        else
            this.bttnAdd.Enabled = true;
    }

    protected void txtBoxSelectedDate_TextChanged(object sender, EventArgs e)
    {
        DateTime curDate = DateTime.Today;
        if (DateTime.TryParse(txtBoxSelectedDate.Text, out curDate))
        {
            CalendarSlecetDate.SelectedDate = curDate;
            CalendarSlecetDate.VisibleDate = curDate;
        }
        if (this.CalendarSlecetDate.SelectedDate < DateTime.Today)
        {
            this.bttnAdd.Enabled = false;
            this.bttnUpdate.Enabled = false;
            this.bttnDelete.Enabled = false;
        }
        else
        {
            this.bttnAdd.Enabled = true;
            this.bttnUpdate.Enabled = true;
            this.bttnDelete.Enabled = true;
        }
    }

    protected void bttnAdd_Click(object sender, EventArgs e)
    {
     /*   string databaseConString = ConfigurationManager.ConnectionStrings["connectionToDatabase"].ConnectionString;
        SqlConnection con = new SqlConnection(databaseConString);
        
        SqlCommand query = new SqlCommand("INSERT INTO plans (usernameID,planDate,notes) VALUES (@username, @date, @note)", con);
        query.Parameters.AddWithValue("@username", User.Identity.Name);
        query.Parameters.AddWithValue("@date", CalendarSlecetDate.SelectedDate);
        query.Parameters.AddWithValue("@note", txtBoxNotes.Text);

        con.Open();
        int x = query.ExecuteNonQuery();
        con.Close();

        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Info", "alert('Uspjesno');", false);
        //bttnAdd.OnClientClick = "addEvent()";
        //ScriptManager.RegisterPostBackControl (bttnAdd, this.GetType(), "Info", "alert('Uspjesno');", false);
        txtBoxNotes.Text = "";
        Response.Redirect("~/Planner.aspx");
        */
        /*
        SqlDataSource1.InsertCommand = "INSERT INTO plans (usernameID,planDate,notes) VALUES (@username, @date, @note)";
        SqlDataSource1.InsertParameters[1].DefaultValue = User.Identity.Name;
        SqlDataSource1.InsertParameters[2].DefaultValue = CalendarSlecetDate.SelectedDate.ToShortDateString();
        SqlDataSource1.InsertParameters[3].DefaultValue = txtBoxNotes.Text;
        */
        SqlDataSource1.InsertParameters[0].DefaultValue = User.Identity.Name;
        SqlDataSource1.Insert();
        GridView2.DataBind();
        txtBoxNotes.Text = string.Empty;

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer'");
        e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference((Control)sender, "Select$" + e.Row.RowIndex.ToString()));
    }

    protected void bttnUpdate_Click(object sender, EventArgs e)
    {
        int row = GridView1.SelectedIndex;
        GridView1.SetEditRow(row);
    }

    protected void bttnDelete_Click(object sender, EventArgs e)
    {
       /* int id = 0;
        int.TryParse(GridView1.SelectedDataKey.Value.ToString(), out id);

        string databaseConString = ConfigurationManager.ConnectionStrings["connectionToDatabase"].ConnectionString;
        SqlConnection con = new SqlConnection(databaseConString);

        SqlCommand query = new SqlCommand("DELETE FROM plans WHERE ID=@id", con);
        query.Parameters.AddWithValue("@id", id);

        con.Open();
        query.ExecuteNonQuery();
        con.Open();*/
        SqlDataSource1.Delete();   
        GridView2.DataBind();
    }

    protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        GridView2.DataBind(); 
    }
}