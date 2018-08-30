using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HelpDesk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) // if loaded for the first time.
        {
            SqlConnection conn;
            SqlCommand categoryComm;
            SqlCommand subjectComm;
            SqlDataReader reader;
            string connectionString =
            ConfigurationManager.ConnectionStrings[
            "Dorknozzle"].ConnectionString;
            conn = new SqlConnection(connectionString);
            categoryComm = new SqlCommand(
            "SELECT CategoryID, Category FROM HelpDeskCategories",
            conn);
            subjectComm = new SqlCommand(
            "SELECT SubjectID, Subject FROM HelpDeskSubjects", conn);
            try
            {
                conn.Open();
                reader = categoryComm.ExecuteReader();
                categoryList.DataSource = reader;
                categoryList.DataValueField = "CategoryID";
                categoryList.DataTextField = "Category";
                categoryList.DataBind();
                reader.Close();
                reader = subjectComm.ExecuteReader();
                subjectList.DataSource = reader;
                subjectList.DataValueField = "SubjectID";
                subjectList.DataTextField = "Subject";
                subjectList.DataBind();
                reader.Close();
            }
            finally
            {
                conn.Close();
            }
        }
    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlConnection conn;
            SqlCommand comm;
            string connectionString =
            ConfigurationManager.ConnectionStrings[
            "Dorknozzle"].ConnectionString;
            conn = new SqlConnection(connectionString);

            //Long version of command.
            //comm = new SqlCommand(
            //"INSERT INTO HelpDesk (EmployeeID, StationNumber, " +
            //"CategoryID, SubjectID, Description, StatusID) " +
            //"VALUES (@EmployeeID, @StationNumber, @CategoryID, " +
            //"@SubjectID, @Description, @StatusID)", conn);

            // Short version command as Stored Procedure.
            comm = new SqlCommand("InsertHelpDesk", conn);
            comm.CommandType = System.Data.CommandType.StoredProcedure;

            comm.Parameters.Add("@EmployeeID", System.Data.SqlDbType.Int);
            comm.Parameters["@EmployeeID"].Value = 5;
            comm.Parameters.Add("@StationNumber",
            System.Data.SqlDbType.Int);
            comm.Parameters["@StationNumber"].Value = stationTextBox.Text;
            comm.Parameters.Add("@CategoryID", System.Data.SqlDbType.Int);
            comm.Parameters["@CategoryID"].Value =
            categoryList.SelectedItem.Value;
            comm.Parameters.Add("@SubjectID", System.Data.SqlDbType.Int);
            comm.Parameters["@SubjectID"].Value =
            subjectList.SelectedItem.Value;
            comm.Parameters.Add("@Description",
            System.Data.SqlDbType.NVarChar, 50);
            comm.Parameters["@Description"].Value =
            descriptionTextBox.Text;
            comm.Parameters.Add("@StatusID", System.Data.SqlDbType.Int);
            comm.Parameters["@StatusID"].Value = 1;
            try
            {
                conn.Open();
                comm.ExecuteNonQuery();
                Response.Redirect("HelpDesk.aspx");
            }
            catch
            {
                dbErrorMessage.Text =
                "Error submitting the help desk request! Please " +
                "try again later, and/or change the entered data!";
            }
            finally
            {
                conn.Close();
            }
        }
    }
}