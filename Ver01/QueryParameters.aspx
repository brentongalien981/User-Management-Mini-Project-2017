<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void submitButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        conn = new SqlConnection("Server=localhost\\SqlExpress;" +
        "Database=Dorknozzle;Integrated Security=True");
        comm = new SqlCommand(
        "SELECT EmployeeID, Name, Username, Password " +
        "FROM Employees WHERE EmployeeID=@EmployeeID", conn);
        int employeeID;
        if (!int.TryParse(idTextBox.Text, out employeeID))
        {
            userLabel.Text = "Please enter a numeric ID!";
        }
        else
        {
            comm.Parameters.Add("@EmployeeID", System.Data.SqlDbType.Int);
            comm.Parameters["@EmployeeID"].Value = employeeID;

            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    userLabel.Text = "Employee ID: " +
                    reader["EmployeeID"] + "<br />" +
                    "Name: " + reader["Name"] + "<br />" +
                    "Username: " + reader["Username"] + "<br />" +
                    "Password: " + reader["Password"];
                }
                else
                {
                    userLabel.Text = "There is no user with this ID: " + employeeID;
                }
                reader.Close();
            }
            catch (Exception)
            {
                userLabel.Text = "Error retrieving user data.";
            }
            finally
            {
                conn.Close();
            }

        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Using Query Parameters</</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            User ID:
            <asp:TextBox ID="idTextBox" runat="server" />
            <asp:Button ID="submitButton" runat="server"
                Text="Get Data" OnClick="submitButton_Click" /><br />
            <asp:Label ID="userLabel" runat="server" />
        </div>
    </form>
</body>
</html>
