<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(
"Server=localhost\\SqlExpress;Database=Dorknozzle;" +
"Integrated Security=True");

        SqlCommand comm = new SqlCommand(
"SELECT EmployeeID, Name FROM Employees", conn);

        conn.Open();
        SqlDataReader reader = comm.ExecuteReader();
        while (reader.Read())
        {
            employeesLabel.Text += reader["Name"] + " ***** " + reader["EmployeeID"].ToString() + "<br />";
        }
        reader.Close();
        conn.Close();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Using ADO.NET</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="employeesLabel" runat="server" />
        </div>
    </form>
</body>
</html>
