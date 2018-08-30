<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HelpDesk.aspx.cs" Inherits="HelpDesk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Employee Help Desk Request</h1>
    <asp:Label ID="dbErrorMessage" ForeColor="Red" runat="server" />
    <p>
        Station Number:<br />
        <asp:TextBox ID="stationTextBox" runat="server"
            CssClass="textbox" />
    </p>
    <p>
        Problem Category:<br />
        <asp:DropDownList ID="categoryList" runat="server"
            CssClass="dropdownmenu" />
    </p>
    <p>
        Problem Subject:<br />
        <asp:DropDownList ID="subjectList" runat="server"
            CssClass="dropdownmenu" />
    </p>
    <p>
        Problem Description:<br />
        <asp:TextBox ID="descriptionTextBox" runat="server"
            CssClass="textbox" Columns="40" Rows="4"
            TextMode="MultiLine" />
    </p>
    <p>
        <asp:Button ID="submitButton" runat="server"
            CssClass="button" Text="Submit Request" OnClick="submitButton_Click" />
    </p>
</asp:Content>

