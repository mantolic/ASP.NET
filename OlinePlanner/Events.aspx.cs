using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Events : System.Web.UI.Page
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
        SqlDataSource1.SelectParameters["username"].DefaultValue = User.Identity.Name;
        SqlDataSource2.SelectParameters["username"].DefaultValue = User.Identity.Name;
        this.MultiView1.ActiveViewIndex = 0;
    }

    protected void bttnFuture_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 0;
    }

    protected void bttnPast_Click(object sender, EventArgs e)
    {
        this.MultiView1.ActiveViewIndex = 1;
    }

    protected void ViewFuture_Activate(object sender, EventArgs e)
    {
        bttnFuture.BackColor = System.Drawing.Color.FromArgb(255,244,220);
        bttnPast.BackColor = System.Drawing.Color.FromArgb(252, 228, 190);    
    }

    protected void ViewPast_Activate(object sender, EventArgs e)
    {
        bttnPast.BackColor = System.Drawing.Color.FromArgb(255, 244, 220);
        bttnFuture.BackColor = System.Drawing.Color.FromArgb(252, 228, 190);    
    }
}