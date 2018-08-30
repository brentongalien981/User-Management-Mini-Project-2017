<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        conn = new SqlConnection("Server=localhost\\SqlExpress;" +
        "Database=Dorknozzle;Integrated Security=True");
        comm = new SqlCommand(
        "SELECT EmployeeID, Name, Username, Password " +
        "FROM Employees", conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            myRepeater.DataSource = reader;
            myRepeater.DataBind();
            reader.Close();
        }
        catch
        {
            Response.Write("Error retrieving user data.");
        }
        finally
        {
            conn.Close();
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Using the Repeater</</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="myRepeater" runat="server">
                <HeaderTemplate>
                    <h1> fucking results</h1>
                    <table width="400" border="0">
                        <tr>
                            <th>Employee ID</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Password</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("EmployeeID") %></td>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("Username") %></td>
                        <td><%# Eval("Password") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
